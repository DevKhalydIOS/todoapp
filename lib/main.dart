import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:state_managment_todoapp/notifiers/db_notifier.dart';
import 'package:state_managment_todoapp/screens/page_view_managment.dart';
import 'package:state_managment_todoapp/screens/splash_screen.dart';

import 'fragments/task_screen.dart';

void main() => runApp(InitApp());

//Please read this blog https://www.pluralsight.com/guides/how-to-use-gitignore-file
class InitApp extends StatelessWidget {

  //TO-DO
  //SLOGAN: Let's TODO

  @override
  Widget build(BuildContext context) {

    //Docs provider: https://pub.dev/packages/provider
    //Use MultiProvider and ProxyProvider

    return ChangeNotifierProvider(
      //Listen all app
      create: (_) => DatabaseNotifier(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'TODO-LIST',
        initialRoute: SplashScreen.tag,
        routes: {
          SplashScreen.tag: (c) => SplashScreen(),
          PageViewManegment.tag : (c) => PageViewManegment(),
        },
      ),
    );
  }
}
