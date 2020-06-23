import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:state_managment_todoapp/database_moor/moor_database.dart';
import 'package:state_managment_todoapp/notifiers/db_notifier.dart';

///Show an alert to add notes
class AlertNotes extends StatefulWidget {

  GlobalKey<AnimatedListState> listKey;

  AlertNotes({@required  this.listKey});

  @override
  _AlertNotesState createState() => _AlertNotesState();
}

class _AlertNotesState extends State<AlertNotes> {
  GlobalKey<AnimatedListState> listKey;

  final controller = new TextEditingController();
  bool isChecked = false;
  bool isEmpty = false;

  @override
  void initState() {
    listKey = widget.listKey;
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => AlertDialog(
        title: Text('Add note'),
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
                  labelText: 'Write your note',
                  errorText: isEmpty ? 'Note field is required' : null),
            ),
          ),
          checkBox()
        ],
      );

  Widget checkBox() => CheckboxListTile(
        title: Text("Hide"),
        value: isChecked,
        onChanged: (value) {
          setState(() {
            isChecked = value;
          });
        },
      );

  onAffirmativePressed() async {
    if (controller.text.isEmpty) {
      setState(() {
        isEmpty = !isEmpty;
      });
      return;
    }

    String note = controller.text;
    bool isHide = isChecked;

    print(note);
    print(isHide);

    final n = new Note(
        id: 'note_' + getDate(),
        initDate: getDate(),
        note: note,
        isHide: isHide);

    await Provider.of<DatabaseNotifier>(context, listen: false)
        .database
        .insertNote(n);

    Navigator.pop(context);
    listKey.currentState.insertItem(0, duration: Duration(milliseconds: 450));
  }
}
