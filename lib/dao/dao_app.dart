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
  updateTask(Task task) =>
      (update(tasks)..where((t) => t.id.equals(task.id))).write(task);

  //Delete
  deleteTasksCompletes() => (delete(tasks)..where((t) => t.isComplete)).go();

  //Functions to be called
  Future<List<Task>> getTasks() => select(tasks).get();
  //Task is the class generated and tasks is the getter

  Stream<List<Task>> watchTasks() => select(tasks).watch();

  //Note: Task is the class generated no the class who extends from Table else from DataClass
  Future<int> insertTask(Task task) => into(tasks).insert(task);
  //Table name and the class

  //Note Functions
  updateNote(Note note) =>
      (update(notes)..where((t) => t.id.equals(note.id))).write(note);

  
  deleteUniqueNote(Note note) =>
      (delete(notes)..where((t) => t.id.equals(note.id))).delete(note);


  Stream<List<Note>> watchNotes() => select(notes).watch();


  Future insertNote(Note note) => into(notes).insert(note);

  

}
