import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:state_managment_todoapp/models/task_mode.dart';
import 'package:state_managment_todoapp/widgets/checkbox_tile_custom.dart';
import 'package:state_managment_todoapp/widgets/design_bottom_sheet.dart';

class TaskScreen extends StatefulWidget {
  @override
  _TaskScreenState createState() => _TaskScreenState();
}

class _TaskScreenState extends State<TaskScreen> {
  double widht, height;

  final keyScaffold = new GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    widht = MediaQuery.of(context).size.width;
    height = MediaQuery.of(context).size.height;

    return Scaffold(
        key: keyScaffold,
        backgroundColor: Colors.lightBlueAccent,
        body: str(),
        floatingActionButton: FloatingActionButton(
          onPressed: () => showBottomSheet(),
          backgroundColor: Colors.lightBlue,
          child: Icon(
            Icons.add,
            color: Colors.white,
          ),
        ));
  }

  showBottomSheet() => showModalBottomSheet(
        isScrollControlled: true,
        context: context,
        builder: (c) => BottomSheetDesign(
          onPressed: addAnItem,
        ),
      );

  addAnItem(String task) {
    // Provider.of<TaskNotifier>(context).addAnItem();
    final taskModel = new CheckBoxTile(
      assigment: task,
    );
    Provider.of<TaskNotifier>(context,listen: false).addAnItem(taskModel);
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
                      color: Colors.lightBlue,
                      size: 35,
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
                          'Todoey',
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 60),
                        ),
                        Consumer<TaskNotifier>(
                          builder: (context, task, child) => Text(
                            '${task.taskList.length} Tasks',
                            style: TextStyle(color: Colors.white, fontSize: 20),
                          ),
                        ),
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

  Widget list2() => ListView(
        padding: EdgeInsets.only(top: 25),
        children: <Widget>[
          CheckBoxTile(
            assigment: 'An exmple',
          ),
          CheckBoxTile()
        ],
      );

  Widget list() => Consumer<TaskNotifier>(
        builder: (context, task, child) {
          bool isEmptyList = task.taskList.isEmpty;

          int lenghtList = task.taskList.length;

          return isEmptyList
              ? Center(
                  child: Text('No task for today',
                      style: TextStyle(
                        color: Colors.black,
                      )))
              : ListView.builder(
                  padding: EdgeInsets.only(top: 25),
                  itemBuilder: itemBuilder,
                  itemCount: lenghtList,
                );
        },
      );

  Widget itemBuilder(BuildContext _, int i) => Consumer<TaskNotifier>(
      builder: (context, task, child) => task.taskList[i]);
}
