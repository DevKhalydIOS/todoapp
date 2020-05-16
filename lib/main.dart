import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:state_managment_todoapp/models/task_mode.dart';
import 'package:state_managment_todoapp/screens/task_screen.dart';

void main() => runApp(InitApp());

//Please read this blog https://www.pluralsight.com/guides/how-to-use-gitignore-file
class InitApp extends StatelessWidget {

  //Try to do the same thing with the new params

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(//Listen all app
      create: (_) => TaskNotifier(),
      child: MaterialApp(
        title: 'TODO-LIST',
        home: TaskScreen(),
      ),
    );
  }
}








  

 

