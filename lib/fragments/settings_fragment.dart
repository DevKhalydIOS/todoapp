import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:provider/provider.dart';
import 'package:state_managment_todoapp/notifiers/db_google_proxy.dart';
import 'package:state_managment_todoapp/providers/google_sign_in_provider.dart';
import 'package:state_managment_todoapp/utils/utils_functios.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';
import 'package:state_managment_todoapp/widgets/custom_switch.dart';
import 'package:state_managment_todoapp/widgets/space.dart';

class SettingsFragment extends StatelessWidget {
  BuildContext context;
  final googleSignIn = new GoogleSignInProvider();

  //Add a list
  //https://stackoverflow.com/questions/21826342/is-there-a-simple-way-to-combine-two-lists-in-dart
  Widget str() => SafeArea(
        child: SingleChildScrollView(
          child: Column(children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text('Settings',
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: screenHeight(context) * 0.075,
                        fontWeight: FontWeight.bold)),
              ),
            ),
            Space(),
            body(),
          ]),
        ),
      );

  //Update UI
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
                ),
              ),
              Space(
                space: 0.05,
              ),
              SignInButton(
                Buttons.Google,
                text: "Sign in with Google",
                onPressed: () async {

                  GoogleSignInAccount user = await googleSignIn.signIn;

                  if (user == null) {
                    //Show an alert
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
                radius: 30,
                backgroundImage: NetworkImage(userGoogle.photoUrl),
              ),
              Space(),
              Text(
                userGoogle.displayName,
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              Text(userGoogle.email),
              SignInButton(
                Buttons.Google,
                text: "Sign out",
                onPressed: () {
                  //Make provider method and son on with the local storage like signInGoogleUserMethod

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
              isActive: false,
              text: 'Dark Mode',
              onAction: (value) {
                if (value) {
                  print('DarkMode');
                }
              },
            ),
            Space(),
            CustomSwitch(
              iconData: Icons.visibility,
              isActive: false,
              text: 'Hide Notes',
              onAction: (value) {
                if (value) {
                  print('Hide Notes');
                }
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
            ),
          ),
          Text('jrdosmil10@gmail.com'),
          Text('Mobile Developer')
        ],
      );

  @override
  Widget build(BuildContext c) {
    context = c;
    return Scaffold(body: str());
  }
}
