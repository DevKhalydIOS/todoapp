import 'package:flutter/material.dart';
import 'package:state_managment_todoapp/utils/utils_functios.dart';

class Space extends StatelessWidget {

  final double space;

  const Space({this.space = 0.01});

  @override
  Widget build(BuildContext context) => SizedBox(
        //If is necessary use the width change this widget11
        height: screenHeight(context) *  space,
      );
}
