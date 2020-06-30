import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:provider/provider.dart';
import 'package:state_managment_todoapp/database_moor/moor_database.dart';
import 'package:state_managment_todoapp/notifiers/db_google_proxy.dart';
import 'package:state_managment_todoapp/notifiers/db_notifier.dart';
import 'package:state_managment_todoapp/providers/google_sign_in_provider.dart';
import 'package:state_managment_todoapp/utils/utils_functios.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';
import 'package:state_managment_todoapp/widgets/alert_platforms.dart';
import 'package:state_managment_todoapp/widgets/custom_switch.dart';
import 'package:state_managment_todoapp/widgets/space.dart';

class SettingsFragment extends StatefulWidget {
  @override
  _SettingsFragmentState createState() => _SettingsFragmentState();
}

class _SettingsFragmentState extends State<SettingsFragment> {
  bool isDarkMode;
  final googleProvider = new GoogleSignInProvider();

  @override
  void initState() {
    isDarkMode = Provider.of<DatabaseNotifier>(context, listen: false)
            .userData
            .isDarkMode ??
        false;

    super.initState();
  }

  Widget str() => SafeArea(
        child: SingleChildScrollView(
          child: Column(children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text('Settings',
                    style: TextStyle(
                        color: isDarkMode ? Colors.white : Colors.black,
                        fontSize: screenHeight(context) * 0.055,
                        fontWeight: FontWeight.bold)),
              ),
            ),
            Space(),
            body(),
          ]),
        ),
      );

  Widget body() => Consumer<GoogleDatabaseProxy>(
        builder: (context, object, child) {
          //Contains the user local data
          final userData = object.databaseNotifier.userData;

          //Contains the user account
          final userGoogle = object.ggNotifier.user;

          //Validations with Google User
          List<Widget> googleInfo = [];

          if (userGoogle == null) {
            final googleNoData = [
              Space(
                space: 0.02,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Text(
                  'Sign in with Google to save in the cloud',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: isDarkMode ? Colors.white : Colors.black,
                  ),
                ),
              ),
              Space(
                space: 0.05,
              ),
              SignInButton(
                isDarkMode ? Buttons.GoogleDark : Buttons.Google,
                text: "Sign in with Google",
                onPressed: () async {
                  GoogleSignInAccount user = await googleProvider.signIn;

                  if (user == null) {
                    String title = 'An error has occurred';
                    String description =
                        'Looks like the connection with Google Servers failed. Please try again or check your internet connection';

                    final alert = AlertPlatform(
                      title: title,
                      description: description,
                      isVisibleNegativeBtn: false,
                      textPositive: 'OK',
                    );

                    await showDialogCustom(context, alert);

                    return;
                  }

                  await signInGoogleUser(context, user, userData);
                },
              )
            ];
            googleInfo.addAll(googleNoData);
          } else {
            //There is an user logged
            final googleData = [
              Space(),
              CircleAvatar(
                radius: 60,
                backgroundImage: NetworkImage(userGoogle.photoUrl),
              ),
              Space(
                space: 0.025,
              ),
              Text(
                userGoogle.displayName,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: isDarkMode ? Colors.white : Colors.black,
                ),
              ),
              Text(
                userGoogle.email,
                style: TextStyle(
                  color: isDarkMode ? Colors.white : Colors.black,
                ),
              ),
              Space(
                space: 0.025,
              ),
              SignInButton(
                isDarkMode ? Buttons.GoogleDark : Buttons.Google,
                text: "Sign out",
                onPressed: () async {
                  await googleProvider.signOut();
                  //Update Provider
                  await signOutGoogleUser(context, userData);
                },
              )
            ];
            googleInfo.addAll(googleData);
          }

          final listComplement = [
            Space(
              space: 0.05,
            ),
            CustomSwitch(
              iconData: Icons.wb_sunny,
              isActive: userData.isDarkMode,
              text: 'Dark Mode',
              onAction: (isDarkMode) async {
                //Getting the data and updating one field in this case DarkMode
                UserDataData userUpdate =
                    userData.copyWith(isDarkMode: isDarkMode);

                //Updating the database
                await Provider.of<DatabaseNotifier>(context, listen: false)
                    .database
                    //UserDataData data
                    .updateDataUser(userUpdate);

                //Updating provider
                Provider.of<DatabaseNotifier>(context, listen: false)
                    .updateInfoUserLocal(userUpdate);
              },
            ),
            Space(),
            ListTile(
              title: Text('Unhide Notes',
                  style: TextStyle(
                    color: isDarkMode ? Colors.black : Colors.white,
                  )),
              leading: Icon(Icons.visibility,color: isDarkMode ? Colors.white : Colors.grey),
              onTap: () async {
                await Provider.of<DatabaseNotifier>(context, listen: false)
                    .database
                    .updateHideNotes();
              },
            ),
            Space(
              space: 0.1,
            ),
            infoAboutDeveloper()
          ];

          List<Widget> widgets = googleInfo + listComplement;

          //Show the local user data
          return Column(
            children: widgets,
          );
        },
      );

  Widget infoAboutDeveloper() => Column(
        children: [
          Text(
            'Rolando Garcia',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: isDarkMode ? Colors.black : Colors.white,
            ),
          ),
          Text(
            'jrdosmil10@gmail.com',
            style: TextStyle(
              color: isDarkMode ? Colors.black : Colors.white,
            ),
          ),
          Text('Mobile Developer',
              style: TextStyle(
                color: isDarkMode ? Colors.black : Colors.white,
              ))
        ],
      );

  @override
  Widget build(BuildContext c) {
    return Consumer<DatabaseNotifier>(builder: (context, db, child) {
      isDarkMode = db.userData.isDarkMode;

      return Scaffold(
        body: str(),
        backgroundColor: isDarkMode ? Colors.black : Colors.white,
      );
    });
  }
}
