import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:state_managment_todoapp/database_moor/moor_database.dart';
import 'package:state_managment_todoapp/notifiers/db_notifier.dart';
import 'package:state_managment_todoapp/utils/utils_functios.dart';
import 'package:state_managment_todoapp/widgets/alert_notes.dart';
import 'package:state_managment_todoapp/widgets/edit_data.dart';

class NotesScreen extends StatefulWidget {
  @override
  _NotesScreenState createState() => _NotesScreenState();
}

class _NotesScreenState extends State<NotesScreen> {
  final keyScaffold = new GlobalKey<ScaffoldState>();

  bool isDarkMode = false;

  List<Note> notesOutside = new List();

  Stream<List<Note>> streamsNotes;

  @override
  void initState() {
    
    isDarkMode = Provider.of<DatabaseNotifier>(context, listen: false)
        .userData
        .isDarkMode;

    streamsNotes = Provider.of<DatabaseNotifier>(context, listen: false)
        .database
        .watchNotes();

    streamsNotes.listen((List<Note> notes) {
      Provider.of<DatabaseNotifier>(context, listen: false)
          .updateTotalNotes(notes.length);
      notesOutside = notes;
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        key: keyScaffold,
        backgroundColor: !isDarkMode ? primaryColor : primaryColorDark,
        body: str(),
        floatingActionButton: fab(),
      );

  Widget fab() => FloatingActionButton(
        onPressed: onPressed,
        backgroundColor: acentColor,
        child: Icon(
          Icons.add,
          color: Colors.white,
        ),
      );

  //Add a note to notes table
  onPressed() => showDialogCustom(context, AlertNotes());

  Widget str() => Column(
        children: <Widget>[
          Container(
            height: screenHeight(context) * 0.35,
            width: double.infinity,
            child: Padding(
              padding: EdgeInsets.only(left: 45),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  SizedBox(
                    height: 80,
                  ),
                  Container(
                      padding: EdgeInsets.all(5.0),
                      child: Icon(
                        Icons.calendar_today,
                        color: Colors.white,
                        size: 35,
                      )),
                  Expanded(
                      child: Padding(
                    padding: EdgeInsets.only(top: 35),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          'TO-DO',
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 60),
                        ),
                        Consumer<DatabaseNotifier>(
                            builder: (_, data, child) => Text(
                                  '${data.notes} Notes',
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 20),
                                ))
                      ],
                    ),
                  ))
                ],
              ),
            ),
          ),
          Expanded(
              child: Container(
            child: list(),
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: new BorderRadius.only(
                  topLeft: const Radius.circular(35.0),
                  topRight: const Radius.circular(35.0),
                )),
          ))
        ],
      );

  Widget list() => StreamBuilder(
        stream: streamsNotes,
        builder: (BuildContext context, AsyncSnapshot<List<Note>> snapshot) {
          if (snapshot.hasData) {
            final notes = snapshot.data;

            if (notes.isEmpty)
              return Container(
                width: double.infinity,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [Text('No notes')],
                ),
              );

            return ListView.builder(
              padding: EdgeInsets.only(top: 25),
              itemBuilder: itemBuilder,
              itemCount: notes.length,
            );
          } else {
            if (!snapshot.hasData) {
              return Center(
                  child: Text('No notes',
                      style: TextStyle(
                        color: Colors.black,
                      )));
            } else {
              return Center(child: CircularProgressIndicator());
            }
          }
        },
      );

  //Try to fix else use normal listview
  Widget itemBuilder(BuildContext _, int i) {
    List<Note> reversedList = new List.from(notesOutside.reversed);

    final item = reversedList[i];

    bool isHide = item.isHide;

    return !isHide
        ? ListTile(
            title: Text(item.note),
            onLongPress: () => showDialogCustom(context, EditDataAlert(item)),
          )
        : Container();
  }
}
