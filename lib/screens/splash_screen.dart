import 'dart:io' show Platform;
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:google_sign_in/google_sign_in.dart';

import 'package:state_managment_todoapp/database_moor/moor_database.dart';
import 'package:state_managment_todoapp/notifiers/db_notifier.dart';
import 'package:state_managment_todoapp/providers/google_sign_in_provider.dart';
import 'package:state_managment_todoapp/screens/page_view_managment.dart';
import 'package:state_managment_todoapp/utils/utils_functios.dart';
import 'package:state_managment_todoapp/widgets/alert_platforms.dart';
import 'package:state_managment_todoapp/widgets/icon_app.dart';

class SplashScreen extends StatefulWidget {
  static final tag = 'ss';

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  
  final googleSignIn = new GoogleSignInProvider();

  bool isDarkMode = false;

  @override
  void initState() {
    Future.delayed(Duration(milliseconds: 1650), () async {
      UserDataData user = await getUserActually();

      assert(user != null, 'Please fix the user local');

      //Caution
      if (user == null) {
        //Maybe this can be an error
        debugPrint('Error');
      } else {
        //Saving the user info
        Provider.of<DatabaseNotifier>(context, listen: false)
            .updateInfoUserLocal(user);

       

        bool userHasData = await isUserWithData();

         isDarkMode = Provider.of<DatabaseNotifier>(context, listen: false)
                .userData
                .isDarkMode ??
            false;

        debugPrint('THe user has data $userHasData');

        //Login With Google
        if (!userHasData) await showDialogs(user);
      }

      //Use provider to pass the data
      nextPageRemoveStack(context, PageViewManegment.tag);
    });

    super.initState();
  }

  Future<bool> isUserWithData() async {
    List notes = await Provider.of<DatabaseNotifier>(context, listen: false)
        .database
        .getNotes();

    List task = await Provider.of<DatabaseNotifier>(context, listen: false)
        .database
        .getTasks();

    return notes.isNotEmpty ?? false || task.isNotEmpty ?? false;
  }

  Future showDialogs(UserDataData user) async {
    bool wasShowGoogleSignIn = user.isGoogleSignIn;
    String title = 'Do you want to sign in with Google?';
    String description =
        'This is for a better user experience (Note: You can save your tasks and notes in the cloud)';

    final dialogCupertino = new CupertinoAlertDialog(
      title: Text(title),
      content: Text(description),
      actions: [
        CupertinoDialogAction(
          child: Text('No'),
          onPressed: onNegativePressed,
        ),
        CupertinoDialogAction(
          child: Text('Yes'),
          onPressed: onAffirmativePressed,
        ),
      ],
    );

    final dialogMaterial = new AlertDialog(
      title: Text(title),
      content: Text(description),
      elevation: 16.0,
      actions: [
        FlatButton(onPressed: onNegativePressed, child: Text('No')),
        FlatButton(onPressed: onAffirmativePressed, child: Text('Yes')),
      ],
    );

    bool isFinished = false;

    if (!wasShowGoogleSignIn) {
      isFinished = await showDialog(
        barrierDismissible: false,
        context: context,
        builder: (context) => Platform.isIOS ? dialogCupertino : dialogMaterial,
      );

      //If finished so we need to show the google sign in dialpg
      if (isFinished) {
        //'Show Dialog Google and if this sign in with Google update Database Local'
        GoogleSignInAccount _user;
        try {
          _user = await googleSignIn.signIn;

          if (user == null) {
            //THE user aborted the process
            String _title = "Error with Google Sign In";
            String _description =
                "You can sign in with Google from Settings Page";

            final alert = new AlertPlatform(
              title: _title,
              description: _description,
              isVisibleNegativeBtn: false,
              textPositive: 'OK',
            );

            await showDialogCustom(context, alert);

            return;
          }
        } catch (e) {
          debugPrint('Error MSG: ${e.message}');
          return;
        }

        //Updating provider and the local storage
        await signInGoogleUser(context, _user, user);
      }
      isFinished = true;
    }
    //Those returns can be removed
    return isFinished;
  }

  onAffirmativePressed() => Navigator.pop(context, true);

  onNegativePressed() => Navigator.pop(context, false);

  @override
  Widget build(BuildContext context) => Scaffold(
        backgroundColor: isDarkMode ? primaryColorDark : primaryColor,
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

  Future<UserDataData> getUserActually() async {
    List<UserDataData> data =
        await Provider.of<DatabaseNotifier>(context, listen: false)
            .database
            .getUserData();

    if (data.isEmpty) {
      //Create a new UserDataData object
      final user = new UserDataData(
        id: 'idUser_' + getDate(),
        isDarkMode: false,
        isGoogleSignIn: false,
      );

      //Always use the operator ??  to avoid posible errors

      await Provider.of<DatabaseNotifier>(context, listen: false)
          .database
          .insertUser(user);

      return user;
    } else {
      final user = data[0] ?? null;

      if (user == null) return null;

      return user;
    }
  }
}
