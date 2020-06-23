import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:io' show Platform;

///This dialog is for informationb
///(This widget returns an Alert to specify plattform)
class AlertPlatform extends StatelessWidget {
  
  final String title, description, textPositive, textNegative;
  final Function onAffirmativePressed, onNegativePressed;
  final bool isVisibleNegativeBtn;

  const AlertPlatform({
    @required this.title,
    @required this.description,
    this.textPositive,
    this.textNegative,
    this.onAffirmativePressed,
    this.onNegativePressed,
    this.isVisibleNegativeBtn = true,
  });

  @override
  Widget build(BuildContext context) {

    final androidMaterial = AlertDialog(
      title: Text(title),
      content: Text(description),
      elevation: 16.0,
      actions: [
        if (isVisibleNegativeBtn)
          FlatButton(
              onPressed: onNegativePressed ?? () => onNegative(context),
              child: Text(textNegative ?? 'No')),
        FlatButton(
            onPressed: onAffirmativePressed ?? () => onAffirmative(context),
            child: Text(textPositive ?? 'Yes')),
      ],
    );

    final iosCupertino = CupertinoAlertDialog(
      title: Text(title),
      content: Text(description),
      actions: [
        if (isVisibleNegativeBtn)
          CupertinoDialogAction(
            child: Text(textNegative ?? 'No'),
            onPressed: onNegativePressed ?? () => onNegative(context),
          ),
        CupertinoDialogAction(
          child: Text(textPositive ?? 'Yes'),
          onPressed: onAffirmativePressed ?? () => onAffirmative(context),
        ),
      ],
    );

    return Platform.isAndroid ? androidMaterial : iosCupertino;
  }

  onAffirmative(BuildContext context) => Navigator.pop(context, true);

  onNegative(BuildContext context) => Navigator.pop(context, false);
}
