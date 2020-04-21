import 'package:flutter/material.dart';
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
        builder: (c) => BottomSheetDesign(),
      );

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
                        Text(
                          '12 Tasks',
                          style: TextStyle(color: Colors.white, fontSize: 20),
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
   

  Widget list() => ListView(
        padding: EdgeInsets.only(top: 25),
        children: <Widget>[
          CheckBoxTile(
            assigment: 'An exmple',
          ),
          CheckBoxTile()
        ],
      );

  Widget modelTask(bool isSTRIKETHROUGH) {
    return CheckboxListTile(
      value: isSTRIKETHROUGH,
      onChanged: (value) {},
      checkColor: Colors.white,
      title: Text(
        'Task 1',
        style: TextStyle(
            color: Colors.black,
            decoration: isSTRIKETHROUGH
                ? TextDecoration.lineThrough
                : TextDecoration.none),
      ),
      activeColor: Colors.lightBlueAccent,
      selected: true,
    );
  }
}
