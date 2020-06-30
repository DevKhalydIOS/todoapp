import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:state_managment_todoapp/database_moor/moor_database.dart';
import 'package:state_managment_todoapp/notifiers/db_notifier.dart';
import 'package:state_managment_todoapp/widgets/alert_platforms.dart';

class EditDataAlert extends StatefulWidget {
  
  final Object data;

  EditDataAlert(this.data);

  @override
  _EditDataAlertState createState() => _EditDataAlertState();
}

class _EditDataAlertState extends State<EditDataAlert> {
  final controller = new TextEditingController();

  Object d;
  Task t;
  Note n;

  bool isTask, isEmpty = false;

  @override
  void initState() {
    d = widget.data;
    if (d is Note) {
      n = d as Note;
    } else if (d is Task) {
      t = d as Task;
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    String titleError = 'Error';
    String descriptionError =
        'Something is wrong. If the error persists please contact with the developer';

    final errorAlert = new AlertPlatform(
      title: titleError,
      description: descriptionError,
      isVisibleNegativeBtn: false,
      textPositive: 'OK',
    );

    if (t == null && n == null) return errorAlert;

    isTask = t != null ? true : false;

    if (isTask) {
      controller.text = t.task;
    } else {
      controller.text = n.note;
    }

    //TODO: When this be release to IOS make his own cupertino dialogs
    final interactiveAlert = new AlertDialog(
      title: _headerAlert(),
      content: content(),
      actions: [
        FlatButton(
            onPressed: () => Navigator.pop(context), child: Text('Cancel')),
        FlatButton(onPressed: onAffirmativePressed, child: Text('Edit')),
      ],
    );
    return interactiveAlert;
  }

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
                  labelText: 'Edit this field',
                  errorText: isEmpty ? 'This field is required' : null),
            ),
          ),
        ],
      );

  onAffirmativePressed() async {
    if (isTask) {

      Task copy = t.copyWith(task: controller.text);

      await Provider.of<DatabaseNotifier>(context, listen: false)
          .database
          .updateTask(copy);

      Navigator.pop(context);

    } else {

      Note copy = n.copyWith(note: controller.text);

      await Provider.of<DatabaseNotifier>(context, listen: false)
          .database
          .updateNote(copy);
          
      Navigator.pop(context);

    }
  }

  Widget _headerAlert() {
    String type = isTask ? 'Task' : 'Note';

    return Row(
      children: [
        Icon(Icons.edit),
        //Work with a custom space(Maybe this trhown an error)
        SizedBox(
          width: 4.0,
        ),
        Text('Edit ' + type),
      ],
    );
  }
}
