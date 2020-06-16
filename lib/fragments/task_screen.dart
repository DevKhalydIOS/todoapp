import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:state_managment_todoapp/database_moor/moor_database.dart';
import 'package:state_managment_todoapp/notifiers/db_notifier.dart';
import 'package:state_managment_todoapp/utils/utils_functios.dart';
import 'package:state_managment_todoapp/widgets/checkbox_tile_custom.dart';
import 'package:state_managment_todoapp/widgets/design_bottom_sheet.dart';

//This screen will be become in stateless
class TaskScreen extends StatefulWidget {
  static final tag = 'task';

  @override
  _TaskScreenState createState() => _TaskScreenState();
}

class _TaskScreenState extends State<TaskScreen> {
  final _listKey = GlobalKey<AnimatedListState>();

  final keyScaffold = new GlobalKey<ScaffoldState>();

  double widht, height;

  Stream<List<Task>> streamsTasks;

  List<Task> tasksOutside = new List();

  @override
  void initState() {
    //TODO
    setupOfflineMode();
    super.initState();
  }

  void setupOfflineMode() {
    //When the app is on mode offline use this flow
    bool isAlreadyUpdate = false;

    streamsTasks =
        Provider.of<DatabaseNotifier>(context, listen: false).getTasks();

    streamsTasks.listen((list) {
      Provider.of<DatabaseNotifier>(context, listen: false)
          .updateTotalTask(list.length);

      tasksOutside = list;

      if (!isAlreadyUpdate) {
        isAlreadyUpdate = !isAlreadyUpdate;

        //Get the list to delete
        List<Task> deleteList = list.where((e) => e.isComplete).toList();

        //Position to delete. These positions are from list
        List<int> positions = new List();

        if (deleteList.isEmpty) return;

        for (int i = 0; i < list.length; i++) {
          final task = list[i];

          for (int j = 0; j < deleteList.length; j++) {
            if (task.id == deleteList[j].id) {
              positions.add(i);
              break;
            }
          }
        }
      }
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
        onPressed: () => showBottomSheetCustom(),
        backgroundColor: acentColor,
        child: Icon(
          Icons.add,
          color: Colors.white,
        ),
      );
  //Edit this apparence
  showBottomSheetCustom() => showModalBottomSheet(
        isScrollControlled: true,
        context: context,
        builder: (c) => BottomSheetDesign(
          onPressed: addAnItem,
        ),
      );

  //Add a item to the task list
  addAnItem(String task) async {
    // Provider.of<TaskNotifier>(context).addAnItem();
    final taskModel = new Task(
      id: 'task_' + getDate(),
      initDate: getDate(),
      task: task,
      isComplete: false,
    );

    await Provider.of<DatabaseNotifier>(context, listen: false)
        .addTask(taskModel);
    //Maybe this thown an error
    _listKey.currentState.insertItem(0, duration: Duration(milliseconds: 450));
    Navigator.pop(context);
  }

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
                    padding: EdgeInsets.all(10),
                    child: Icon(
                      Icons.menu,
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
            //Total items
            //Add the value to te Provider
            return AnimatedList(
              key: _listKey,
              padding: EdgeInsets.only(top: 25),
              itemBuilder: itemBuilder,
              initialItemCount: tasksOutside.length,
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

  Widget itemBuilder(BuildContext _, int i, animation) {
    if (tasksOutside.isEmpty)
      return Center(
          child: Text('No tasks for today',
              style: TextStyle(
                color: Colors.black,
              )));

    var reversedList = new List.from(tasksOutside.reversed);

    final item = reversedList[i];

    bool isComplete = item.isComplete;

    final myTween = Tween<Offset>(
      begin: const Offset(-1.0, 0.0),
      end: Offset.zero,
    );

    return SlideTransition(
      position: animation.drive(myTween),
      child: CheckBoxTile(
        isComplete: isComplete,
        task: item.task,
        object: item,
      ),
    );
  }
}
