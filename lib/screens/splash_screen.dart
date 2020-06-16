import 'package:flutter/material.dart';
import 'package:state_managment_todoapp/screens/page_view_managment.dart';
import 'package:state_managment_todoapp/utils/utils_functios.dart';
import 'package:state_managment_todoapp/widgets/icon_app.dart';

class SplashScreen extends StatefulWidget {

  static final  tag = 'ss';

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(milliseconds: 2000), () {

      nextPageRemoveStack(context, PageViewManegment.tag);
    });
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        backgroundColor: primaryColor,
        body: str(),
      );

  Widget str() => Container(
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            IconApp(),
            SizedBox(
              height: 35,
            ),
            Text(
              "Let's TODO",
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 60),
            )
          ],
        ),
      );

  actions(){
    //Use database (Moor)
    var isLoggedGoogle = false;
    var hasData = false;

  }
  

}
