import 'package:flutter/material.dart';
import 'package:state_managment_todoapp/screens/task_screen.dart';
 
void main() => runApp(InitApp());
 

 //Please read this blog https://www.pluralsight.com/guides/how-to-use-gitignore-file
class InitApp extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'TDOO-LIST',
      home: TaskScreen(),
    );
  }

}
