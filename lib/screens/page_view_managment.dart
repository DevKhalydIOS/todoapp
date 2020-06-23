import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:state_managment_todoapp/fragments/notes_screen.dart';
import 'package:state_managment_todoapp/fragments/settings_fragment.dart';
import 'package:state_managment_todoapp/fragments/task_screen.dart';
import 'package:state_managment_todoapp/notifiers/db_notifier.dart';

//This class handle the main screens
class PageViewManegment extends StatefulWidget {
  
  static final tag = 'pageViewM';

  @override
  _PageViewManegmentState createState() => _PageViewManegmentState();
}

class _PageViewManegmentState extends State<PageViewManegment> {
  final pageController = new PageController(
    initialPage: 0,
  );

  final views = <Widget>[
    TaskScreen(),
    NotesScreen(),
    SettingsFragment()
  ];

  @override
  void initState() {
    //Before enter into the main screens
    Provider.of<DatabaseNotifier>(context, listen: false)
        .database.deleteTasksCompletes();
    super.initState();
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        body: PageView(
          children: views,
          controller: pageController,
        ),
      );
}
