import 'package:flutter/material.dart';
import 'package:state_managment_todoapp/database_moor/moor_database.dart';

class DatabaseNotifier extends ChangeNotifier {

  int _totalTask = 0;
  AppDatabase _dbInstance = new AppDatabase();

  //Default constructor
  DatabaseNotifier();

  //Getters//This a 
   get database => _dbInstance.userDAO;
  int get tasks => _totalTask;

  //Methods
  Stream<List<Task>> getTasks() => database.watchTasks();

  //If its necessary set notifyListeners
  Future<bool> addTask(Task task) async =>
      await database.insertTask(task) >= 0 ? true : false;


  updateTask(Task task)  =>  database.updateTask(task);

  deleteTasksCompletes()  =>  database.deleteTasksCompletes();


  void updateTotalTask(int current) {
    _totalTask = current;
    notifyListeners();
  }


}
