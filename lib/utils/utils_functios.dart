import 'package:flutter/material.dart';

double screenWidht(BuildContext context) => MediaQuery.of(context).size.width;

double screenHeight(BuildContext context) => MediaQuery.of(context).size.height;

//App colors
Color primaryColor = Colors.lightBlueAccent;

Color acentColor = Colors.lightBlue;

nextPageRemoveStack(BuildContext context, String pageTag) =>
    Navigator.pushReplacementNamed(context, pageTag);
