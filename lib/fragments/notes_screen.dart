import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:state_managment_todoapp/database_moor/moor_database.dart';
import 'package:state_managment_todoapp/notifiers/db_notifier.dart';
import 'package:state_managment_todoapp/utils/utils_functios.dart';
import 'package:state_managment_todoapp/widgets/icon_app.dart';

class NotesScreen extends StatefulWidget {
  @override
  _NotesScreenState createState() => _NotesScreenState();
}

class _NotesScreenState extends State<NotesScreen> {

  final keyScaffold = new GlobalKey<ScaffoldState>();
  final _listKey = GlobalKey<AnimatedListState>();

  Stream<List<Note>> streamsNotes;

  @override
  Widget build(BuildContext context) => Scaffold(
        key: keyScaffold,
        backgroundColor: primaryColor,
        body: str(),
        floatingActionButton: fab(),
      );

  fab() => FloatingActionButton(
        onPressed: onPressed,
        backgroundColor: acentColor,
        child: Icon(
          Icons.add,
          color: Colors.white,
        ),
      );

  //Add a note to notes table
  onPressed() {



  }

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
                    padding: EdgeInsets.all(10),
                    child: IconApp(
                      radius: 20,
                      sizeIcon: 30,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(40),
                    ),
                  ),
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
                                  'Update Notes',
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

  Widget list() => Center(
        child: Text(
          'Gettings note (Creating methosd)',
          textAlign: TextAlign.center,
        ),
      );
}
