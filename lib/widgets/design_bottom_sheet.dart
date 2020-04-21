import 'package:flutter/material.dart';
import 'package:state_managment_todoapp/utils/utils_functios.dart';

class BottomSheetDesign extends StatelessWidget {


  Color mainColor = Color.fromRGBO(102, 193, 254, 1);


  @override
  Widget build(BuildContext context) => SingleChildScrollView(
        child: Container(
          padding:
              EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
          color: Color.fromRGBO(117, 117, 117, 1),
          child: Container(
            child: addTaskUI(),
            height: screenHeight(context) * 0.35,
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(25.0),
                  topRight: Radius.circular(25),
                )),
          ),
        ),
      );

  Widget addTaskUI() => Column(
        children: <Widget>[
          SizedBox(
            height: 10,
          ),
          Text(
            'Add Task',
            style: TextStyle(color: mainColor, fontSize: 25),
          ),
          SizedBox(
            height: 5,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 65, vertical: 15),
            child: TextField(
              style: TextStyle(),
            ),
          ),
          SizedBox(
            height: 15,
          ),
          RaisedButton(
            padding: EdgeInsets.symmetric(horizontal: 100, vertical: 8.5),
            onPressed: () {},
            child: Text(
              'Add',
              style: TextStyle(color: Colors.white, fontSize: 25),
            ),
            color: mainColor,
          )
        ],
      );
}
