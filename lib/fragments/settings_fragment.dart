import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:state_managment_todoapp/notifiers/db_google_proxy.dart';

class SettingsFragment extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Scaffold(body: test());

  Widget test() => Consumer<GoogleDatabaseProxy>(
        builder: (context, object, child) {
          //Contains the queries a some other data
          final localDB = object.databaseNotifier.userLocal();

          //Contains the user account
          final userGoogle = object.ggNotifier.user;

          print(localDB);

          print(userGoogle);

          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                //Get the data when the user enter into the app with Google Sign in
                if (localDB != null) Text('There is localDb'),
                if (userGoogle != null) Text('There is google user'),
              ],
            ),
          );
        },
      );
}
