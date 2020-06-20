import 'package:flutter/material.dart';
import 'package:state_managment_todoapp/database_moor/moor_database.dart';


//Note: This class shouldn't contains future methods beacause there is a class for that
class DatabaseNotifier extends ChangeNotifier {
  int _totalTask = 0;
  AppDatabase _dbInstance = new AppDatabase();
  UserDataData _userData;

  //Default constructor
  DatabaseNotifier();
  //This can be optional

  //Getters//This a
  get database => _dbInstance.userDAO;
  int get tasks => _totalTask;
  UserDataData get userData => _userData ?? null;

  set userData(UserDataData data) => _userData = data;

  
  //Methods
  Stream<List<Task>> watchTasks() => database.watchTasks();

  Future<List<Task>> getTasks() async => await database.getTasks();

  Future<bool> addTask(Task task) async =>
      await database.insertTask(task) >= 0 ? true : false;

  updateTask(Task task) => database.updateTask(task);

  deleteTasksCompletes() => database.deleteTasksCompletes();

  //Notes Functions

  updateNote(Note note) => database.updateNote(note);

  deleteNote(Note note) => database.deleteUniqueNote(note);

  Stream<List<Note>> watchNotes() => database.watchNotes();

  Future<List<Note>> getNotes() async => await database.getNotes();

  Future insertNote(Note note) => database.insertNote(note);

  //UserData Functions
  updateDataUser(UserDataData user) => database.updateDataUser(user);

  insertUser(UserDataData user) => database.insertUser(user);

  //This can throw an error
  Future<List<UserDataData>> getUserData()  async =>  await database.getUserData();

  //TODO: Create a new method that returns the unique user

  Future<UserDataData> userLocal() async {
    final list =  await getUserData();    
    return list[0] ?? null;
  }

  void updateTotalTask(int current) {
    _totalTask = current;
    notifyListeners();
  }
}
