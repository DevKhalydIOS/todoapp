import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:state_managment_todoapp/database_moor/moor_database.dart';
import 'package:state_managment_todoapp/notifiers/db_notifier.dart';

///Widgets can be ful o less. The thing most important is know how to use it

class CheckBoxTile extends StatefulWidget {


  //This allow dont send any value by param
  final bool isComplete;
  final String task;
  final Task object;


  CheckBoxTile(
      {@required this.isComplete, @required this.task, @required this.object});


  @override
  _CheckBoxTileState createState() => _CheckBoxTileState();

}

class _CheckBoxTileState extends State<CheckBoxTile> {

  bool isComplete;
  String task;
  Task object;

  @override
  void initState() {
    super.initState();
    isComplete = widget.isComplete;
    task = widget.task;
    object = widget.object;
  }

  @override
  Widget build(BuildContext context) => CheckboxListTile(
        value: isComplete,
        
        onChanged: (value) async {

          setState(() {
            isComplete = value;
          });
          
          //Updating
          var updateObjetc = object.copyWith(isComplete: isComplete);


          var wasUpdate =  Provider.of<DatabaseNotifier>(context, listen: false)
              .database.updateTask(updateObjetc);
          
          print('Returned $wasUpdate');


        },
        checkColor: Colors.white,
        title: Text(
          widget.task,
          style: TextStyle(
              color: Colors.black,
              decoration: isComplete
                  ? TextDecoration.lineThrough
                  : TextDecoration.none),
        ),
        activeColor: Colors.lightBlueAccent,
      );
}
