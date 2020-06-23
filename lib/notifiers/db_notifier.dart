import 'package:flutter/material.dart';
import 'package:state_managment_todoapp/database_moor/moor_database.dart';

//Note: This class shouldn't contains future methods beacause there is a class for that
//XP Developer: This just handle values no futures awaiting for it. Just values
class DatabaseNotifier extends ChangeNotifier {
  int _totalTask = 0;
  int _totalNotes = 0;

  AppDatabase _dbInstance = new AppDatabase();
  UserDataData _userData;

  //Default constructor
  DatabaseNotifier();
  //This can be optional

  //Getters//This a
  get database => _dbInstance.userDAO;
  int get tasks => _totalTask;
  int get notes => _totalNotes;

  UserDataData get userData => _userData ?? null;

  set userData(UserDataData data) => _userData = data;

  ///Update the user info. Call this method when update the user data in the local storage
  void updateInfoUserLocal(UserDataData u) => _userData = u;

  void updateTotalTask(int current) {
    _totalTask = current;
    //This need notify to the listeners to update the ui
    notifyListeners();
  }

  void updateTotalNotes(int current) {
    _totalNotes = current;
    //This need notify to the listeners to update the ui
    notifyListeners();
  }


}
