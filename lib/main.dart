import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:state_managment_todoapp/notifiers/db_google_proxy.dart';
import 'package:state_managment_todoapp/notifiers/db_notifier.dart';
import 'package:state_managment_todoapp/notifiers/google_notifier.dart';
import 'package:state_managment_todoapp/screens/page_view_managment.dart';
import 'package:state_managment_todoapp/screens/splash_screen.dart';

void main() => runApp(InitApp());

//Please read this blog https://www.pluralsight.com/guides/how-to-use-gitignore-file
class InitApp extends StatelessWidget {
  //TO-DO
  //SLOGAN: Let's TODO

  @override
  Widget build(BuildContext context) {
    //Docs provider: https://pub.dev/packages/provider
    //Use MultiProvider and ProxyProvider

    return MultiProvider(
      providers: [
        //Single Provider depends what to use
        ChangeNotifierProvider<DatabaseNotifier>(
            create: (_) => DatabaseNotifier()),
        ChangeNotifierProvider<GoogleNotifier>(create: (_) => GoogleNotifier()),
        //If you need both notifiers you can use the proxy provider
        //The number 2 means the number of classes to use
        ProxyProvider2<DatabaseNotifier, GoogleNotifier, GoogleDatabaseProxy>(
          update: (context, dbNotifier, googleNotifier, googleDatabaseProxy) =>
              GoogleDatabaseProxy(
                  dbNotifier: dbNotifier, ggNotifier: googleNotifier),
        )
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'TODO-LIST',
        initialRoute: SplashScreen.tag,
        routes: {
          SplashScreen.tag: (c) => SplashScreen(),
          PageViewManegment.tag: (c) => PageViewManegment(),
        },
      ),
    );
  }
}
