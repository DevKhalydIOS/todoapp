import 'package:flutter/material.dart';

double screenWidht(BuildContext context) => MediaQuery.of(context).size.width;

double screenHeight(BuildContext context) => MediaQuery.of(context).size.height;

//App colors
Color primaryColor = Colors.green;

Color acentColor = Colors.lightGreen;

nextPageRemoveStack(BuildContext context, String pageTag) =>
    Navigator.pushReplacementNamed(
      context,
      pageTag,
    );

///This could return anything
Future<dynamic> showDialogCustom(BuildContext context, Widget dialog) async =>
    await showDialog(
      barrierDismissible: false,
      context: context,
      builder: (context) => dialog,
    );







