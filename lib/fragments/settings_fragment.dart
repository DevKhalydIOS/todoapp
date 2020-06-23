import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:state_managment_todoapp/notifiers/db_google_proxy.dart';
import 'package:state_managment_todoapp/providers/google_sign_in_provider.dart';

class SettingsFragment extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Scaffold(body: test());

  Widget test() => Consumer<GoogleDatabaseProxy>(
        builder: (context, object, child) {
          //Contains the queries a some other data

          final localDB = object.databaseNotifier.userData;
          //Contains the user account
          final userGoogle = object.ggNotifier.user;

          print(localDB);
          
          print(userGoogle);

          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                //Get the data when the user enter into the app with Google Sign in
                if (localDB != null) Text(localDB.id +'${localDB.isGoogleSignIn}'),
                if (userGoogle != null) Text(userGoogle.displayName),
                SizedBox(
                  height: 45,
                ),
                FlatButton(
                    onPressed: () async {

                      final ggSignInProvider = new GoogleSignInProvider();

                      bool isSigned = await ggSignInProvider.isSignedIn;

                      //TODO: Update the local user in the db


                      if (isSigned) {
                        print('There is an user');
                        await ggSignInProvider.signOut();
                      } else {
                        print('There is not an user');
                      }
                    },
                    child: Text('Sign out'))
              ],
            ),
          );
        },
      );
}
