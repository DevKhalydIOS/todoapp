import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:state_managment_todoapp/database_moor/moor_database.dart';
import 'package:state_managment_todoapp/notifiers/db_notifier.dart';
import 'package:state_managment_todoapp/utils/utils_functios.dart';
import 'package:state_managment_todoapp/widgets/alert_task.dart';
import 'package:state_managment_todoapp/widgets/checkbox_tile_custom.dart';
import 'package:state_managment_todoapp/widgets/edit_data.dart';

//This screen will be become in stateless
class TaskScreen extends StatefulWidget {
  static final tag = 'task';

  @override
  _TaskScreenState createState() => _TaskScreenState();
}

class _TaskScreenState extends State<TaskScreen> {
  final keyScaffold = new GlobalKey<ScaffoldState>();

  double widht, height;

  Stream<List<Task>> streamsTasks;

  List<Task> tasksOutside = new List();

  @override
  void initState() {
    setupOfflineMode();
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  void setupOfflineMode() {
    //When the app is on mode offline use this flow

    streamsTasks = Provider.of<DatabaseNotifier>(context, listen: false)
        .database
        .watchTasks();

    streamsTasks.listen((list) {
      Provider.of<DatabaseNotifier>(context, listen: false)
          .updateTotalTask(list.length);

      tasksOutside = list;
    });
  }

  @override
  Widget build(BuildContext context) {
    widht = MediaQuery.of(context).size.width;
    height = MediaQuery.of(context).size.height;

    return Scaffold(
      key: keyScaffold,
      backgroundColor: primaryColor,
      body: str(),
      floatingActionButton: fab(),
    );
  }

  fab() => FloatingActionButton(
        onPressed: () => showDialogCustom(context, AlertTasks()),
        backgroundColor: acentColor,
        child: Icon(
          Icons.add,
          color: Colors.white,
        ),
      );

  Widget str() => Column(
        children: <Widget>[
          Container(
            height: height * 0.35,
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
                                  '${data.tasks} Tasks',
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
        stream: streamsTasks,
        builder: (BuildContext context, AsyncSnapshot<List<Task>> snapshot) {
          if (snapshot.hasData) {
            final tasks = snapshot.data;

            if (tasks.isEmpty)
              return Container(
                width: double.infinity,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [Text('No tasks')],
                ),
              );

            return ListView.builder(
              padding: EdgeInsets.only(top: 25),
              itemBuilder: itemBuilder,
              itemCount: tasks.length,
            );
          } else {
            if (!snapshot.hasData &&
                ConnectionState.done == snapshot.connectionState) {
              return Center(
                  child: Text('No tasks for today',
                      style: TextStyle(
                        color: Colors.black,
                      )));
            } else {
              return Center(child: CircularProgressIndicator());
            }
          }
        },
      );

  Widget itemBuilder(BuildContext _, int i) {

    var reversedList = new List.from(tasksOutside.reversed);

    final item = reversedList[i];

    bool isComplete = item.isComplete;

    return GestureDetector(
      onLongPress: () =>
      showDialogCustom(context, EditDataAlert(item)),
      child: CheckBoxTile(
        isComplete: isComplete,
        task: item.task,
        object: item,
      ),
    );
  }
}
