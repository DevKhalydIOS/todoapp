# A TODO app

My TODO App made with Flutter

## Features

-Online Mode
-Offline Mode
-Google Sign In
-Payment Method (Donations)

### Create the dabase

**Note**: We need to add a line like this:

```dart
part 'your_file_name.g.dart';
```

First we need create the draft table in this case the 'drafts' (Read the code commetns)

**Example (Draft Table)**

```dart

class Tasks extends Table {

  //See the docs to see more info about the columns
  //Type of columns
  TextColumn get id => text()();
  //When you use named means that is the field name
  TextColumn get initDate => text().named('init_date').withDefault(Constant(getDate()))();
  TextColumn get endDate => text().named('end_date').nullable()();
  TextColumn get task => text()();
  BoolColumn get isComplete => boolean().withDefault(const Constant(false))();

  @override
  Set<Column> get primaryKey => {id, isComplete};

}

```

Then we need to create a class to handle the Database

**Example (Handler)**

```dart
//This annotation tells the code generator which tables this DB works with
@UseMoor(tables: [Tasks,Notes,UserData],daos: [UserDAO])
// _$AppDatabase is the name of the generated class
class AppDatabase extends _$AppDatabase {

  AppDatabase()
      // Specify the location of the database file
      : super((FlutterQueryExecutor.inDatabaseFolder(
          path: 'db.sqlite',
          // Good for debugging - prints SQL in the console
          logStatements: true,
        )));

  // Bump this when changing tables and columns.
  @override
  int get schemaVersion => 2;
}
```

One time finish this step you have to run the follow command: `flutter packages pub run build_runner watch`. With this command you can observe the changes and create the files necessaries automatically

After this command has finished. The file `your_file_name.g.dart` was generated with the code necessary

### Handle the database

**Note**: We need to add a line like this:

```dart
part 'your_file_name.g.dart';
```

To make the request to the database we need to create a handler to do that

**Example**

```dart
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


}
```

If you already the command `flutter packages pub run build_runner watch` running the missing file should be created. If this not happens check the documentation

### Implementation

With the provider package this was used.

**Example**

```dart
return ChangeNotifierProvider(
      //Listen all app
      create: (_) => DatabaseNotifier(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'TODO-LIST',
        initialRoute: SplashScreen.tag,
        routes: {
          SplashScreen.tag: (c) => SplashScreen(),
          PageViewManegment.tag : (c) => PageViewManegment(),
        },
      ),
    );
```

Where `DatabaseNotifier()` is the database handler.

**Example**
```dart
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
```

From the above file the databse is hadled

## Resources

To store data. Moor package was used.

[Prees here to see the docs](https://moor.simonbinder.eu/docs/)

A blog to see how to implement that library

[Prees here to see the blog](https://resocoder.com/2019/06/26/moor-room-for-flutter-tables-queries-fluent-sqlite-database/)
