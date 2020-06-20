import 'package:flutter/material.dart';
import 'package:state_managment_todoapp/utils/utils_functios.dart';

class IconApp extends StatelessWidget {
  final double radius, sizeIcon;

  const IconApp({
    this.radius = 30,
    this.sizeIcon = 32.5,
  });
  
  @override
  Widget build(BuildContext context) => CircleAvatar(
        radius: radius,
        backgroundColor: Colors.white,
        child: Icon(Icons.calendar_today, color: primaryColor, size: sizeIcon),
      );

}
