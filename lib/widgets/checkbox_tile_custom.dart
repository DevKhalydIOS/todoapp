import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:state_managment_todoapp/models/task_mode.dart';


///Widgets can be ful o less. The thing most important is know how to use it

class CheckBoxTile extends StatefulWidget {
  //Make some fucntions here to get more capacibility
  final String assigment;

  CheckBoxTile({this.assigment = 'No defined'});

  @override
  _CheckBoxTileState createState() => _CheckBoxTileState();
}

class _CheckBoxTileState extends State<CheckBoxTile> {
  //This allow dont send any value by param
  bool isActive = false;

  String assigment;

  @override
  void initState() {
    super.initState();
    assigment = widget.assigment;
  }

  void setValue(bool newValue) {

    if (newValue) {
      final list = Provider.of<TaskNotifier>(context).taskList;
      if (list.isEmpty) return;
      //Changes this types. Make to work
    }

  }

  @override
  Widget build(
          BuildContext
              context) => //By reference if the functions is not equeal throws an error
      CheckboxListTile(
        value: isActive,
        onChanged: setValue,
        checkColor: Colors.white,
        title: Text(
          assigment,
          style: TextStyle(
              color: Colors.black,
              decoration:
                  isActive ? TextDecoration.lineThrough : TextDecoration.none),
        ),
        activeColor: Colors.lightBlueAccent,
        selected: true,
      );
}
