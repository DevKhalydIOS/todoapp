import 'package:flutter/material.dart';

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
  Widget build(BuildContext context) => SwitchListTile(
        title: Text(text),
        value: isActive,
        secondary: Icon(iconData),
        onChanged: (bool value) {
          if (onAction != null) {
            onAction(value);
          }
          setState(() {
            isActive = value;
          });
        },
      );
}
