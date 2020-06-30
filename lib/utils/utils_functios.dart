import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:provider/provider.dart';
import 'package:state_managment_todoapp/database_moor/moor_database.dart';
import 'package:state_managment_todoapp/notifiers/db_notifier.dart';
import 'package:state_managment_todoapp/notifiers/google_notifier.dart';

double screenWidht(BuildContext context) => MediaQuery.of(context).size.width;

double screenHeight(BuildContext context) => MediaQuery.of(context).size.height;

//App colors
Color primaryColor = Colors.green;

Color acentColor = Colors.lightGreen;

Color primaryColorDark = Colors.black87;


nextPageRemoveStack(BuildContext context, String pageTag) =>
    Navigator.pushReplacementNamed(
      context,
      pageTag,
    );

///This could return anything
Future<dynamic> showDialogCustom(BuildContext context, Widget dialog,
        {bool barrierDismissible = false}) async =>
    await showDialog(
      barrierDismissible: barrierDismissible,
      context: context,
      builder: (context) => dialog,
    );

///This method is for update the user when is signIn
///User local is to update the local storage or save the data stored
///UserGoogle is the current user
Future signInGoogleUser(BuildContext context, GoogleSignInAccount userGoogle,
    UserDataData userLocal) async {

  //Update the provider
  Provider.of<GoogleNotifier>(context, listen: false).signInUserGoogle(userGoogle);

  //The idtoken could be diffent so this can throw an error
  String userID = userGoogle.id;

  //Updating the local db
  UserDataData _updateUser = userLocal.copyWith(
    id: userID,
    isGoogleSignIn: true,
  );

  await Provider.of<DatabaseNotifier>(context, listen: false)
      .database
      .updateDataUser(_updateUser);
  
  //Updating the provider with the new data
  Provider.of<DatabaseNotifier>(context, listen: false)
      .updateInfoUserLocal(_updateUser);
}

///This method make the same thing that the above method but a opposite way
Future signOutGoogleUser(BuildContext context, UserDataData userLocal) async {

  Provider.of<GoogleNotifier>(context, listen: false).signOutUserGoogle();

  //The new object
  UserDataData u = userLocal.copyWith(
    id: 'user_' + getDate(),
    isGoogleSignIn: false,
  );


  //Updating in provider and in the local storage
  await Provider.of<DatabaseNotifier>(context, listen: false).database
      .updateDataUser(u);

   Provider.of<DatabaseNotifier>(context, listen: false)
      .updateInfoUserLocal(u);

}
