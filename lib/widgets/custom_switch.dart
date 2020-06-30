import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:state_managment_todoapp/notifiers/db_notifier.dart';

class CustomSwitch extends StatefulWidget {
  final bool isActive;
  final String text;
  final IconData iconData;
  final Function(bool) onAction;

  const CustomSwitch(
      {@required this.isActive,
      @required this.text,
      @required this.iconData,
      this.onAction});

  @override
  _CustomSwitchState createState() => _CustomSwitchState();
}

class _CustomSwitchState extends State<CustomSwitch> {
  bool isActive;
  String text;
  IconData iconData;
  Function(bool) onAction;

  @override
  void initState() {
    isActive = widget.isActive;
    text = widget.text;
    iconData = widget.iconData;
    onAction = widget.onAction;
    super.initState();
  }

  @override
  Widget build(BuildContext context) => Consumer<DatabaseNotifier>(
        builder: (context, db, child) {

          final isDarkMode = db.userData.isDarkMode;

          return SwitchListTile(
            title: Text(text,style: TextStyle(
              color: isDarkMode ? Colors.white : Colors.black
            ),),
            value: isActive,
            secondary: Icon(iconData,color: isDarkMode ? Colors.white : Colors.grey,),
            onChanged: (bool value) {
              if (onAction != null) {
                onAction(value);
              }
              setState(() {
                isActive = value;
              });
            },
          );
        },
      );
}
