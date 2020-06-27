import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:state_managment_todoapp/database_moor/moor_database.dart';
import 'package:state_managment_todoapp/notifiers/db_notifier.dart';

class AlertTasks extends StatefulWidget {
  @override
  _AlertTasksState createState() => _AlertTasksState();
}

class _AlertTasksState extends State<AlertTasks> {
  
  final controller = new TextEditingController();
  bool isEmpty = false;

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => AlertDialog(
        title: Text('Add task'),
        content: content(),
        elevation: 16.0,
        actions: [
          FlatButton(
              onPressed: () => Navigator.pop(context), child: Text('Cancel')),
          FlatButton(onPressed: onAffirmativePressed, child: Text('Add')),
        ],
      );

  Widget content() => Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            child: TextFormField(
              controller: controller,
              keyboardType: TextInputType.multiline,
              maxLines: null,
              decoration: InputDecoration(
                  labelText: 'Write your task',
                  errorText: isEmpty ? 'Task field is required' : null),
            ),
          ),
        ],
      );

  onAffirmativePressed() async {
    if (controller.text.isEmpty) {
      setState(() {
        isEmpty = !isEmpty;
      });

      return;
    }
    String task = controller.text;

    final taskModel = new Task(
      id: 'task_' + getDate(),
      initDate: getDate(),
      task: task,
      isComplete: false,
    );

    await Provider.of<DatabaseNotifier>(context, listen: false)
        .database
        .insertTask(taskModel);
    Navigator.pop(context);
  }
}
