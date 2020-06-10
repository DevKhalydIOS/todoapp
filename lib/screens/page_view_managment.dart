import 'package:flutter/material.dart';
import 'package:state_managment_todoapp/fragments/notes_screen.dart';
import 'package:state_managment_todoapp/fragments/task_screen.dart';


//This class handle the main screens
class PageViewManegment extends StatefulWidget {

  static final  tag  = 'pageViewM';

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
  ];

  @override
  void initState() {
    super.initState();


  }

  @override
  void dispose() {
    super.dispose();
    pageController.dispose();

  }

  @override
  Widget build(BuildContext context) => Scaffold(
    body: PageView(
      children: views,
      controller: pageController,
    ),
  );
}