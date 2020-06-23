/*
Every DAO has to extend a DatabaseAccessor class. The possibility to access the database 
tables will come from a generated mixin, which, in our case, will be called _$TaskDaoMixin.

The benefit of using a DAO is the separation of queries, so we will move all of the queries 
from the AppDatabase to the newly created TaskDao. Additionally, we will annotate the TaskDao with @UseDao

 */
import 'package:moor_flutter/moor_flutter.dart';
import 'package:state_managment_todoapp/database_moor/moor_database.dart';

part 'dao_app.g.dart';

//Funtions to access to database
//DAO = Data Access Objects
@UseDao(tables: [Tasks, Notes, UserData])
class UserDAO extends DatabaseAccessor<AppDatabase> with _$UserDAOMixin {

  final AppDatabase db;

  UserDAO(this.db) : super(db);
  
  //Fix by the docs https://moor.simonbinder.eu/docs/getting-started/writing_queries/
  updateTask(Task task) async => await
      (update(tasks)..where((t) => t.id.equals(task.id))).write(task);

  //Delete
  deleteTasksCompletes() => (delete(tasks)..where((t) => t.isComplete)).go();

  //Functions to be called
  Future<List<Task>> getTasks() async => await select(tasks).get();
  //Task is the class generated and tasks is the getter

  Stream<List<Task>> watchTasks() => select(tasks).watch();

  //Note: Task is the class generated no the class who extends from Table else from DataClass
  Future<int> insertTask(Task task) async => await into(tasks).insert(task);
  //Table name and the class

  //Note Functions
  Future updateNote(Note note) async => await 
      (update(notes)..where((t) => t.id.equals(note.id))).write(note);

  Future deleteUniqueNote(Note note) async => await
      (delete(notes)..where((t) => t.id.equals(note.id))).delete(note);

  Stream<List<Note>> watchNotes()   => select(notes).watch();

  Future insertNote(Note note) async => await into(notes).insert(note);

  Future<List<Note>> getNotes() async => await select(notes).get();

  //UserData functions
  //Note: Always try to write with an extra 's' a
  //table to avoid this type of erros

  ///Update all the table in this case that dont metters.
  Future updateDataUser(UserDataData d) async => await update(userData).write(d);

  ///Use a unique time
  Future insertUser(UserDataData d) async => await into(userData).insert(d);

  ///The first item should be the user to storage
  Future<List<UserDataData>> getUserData() async => await select(userData).get();
}
