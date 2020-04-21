import 'package:flutter/material.dart';

class CheckBoxTile extends StatefulWidget {
  String assigment;

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
    setState(() {
      isActive = newValue;
    });
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
