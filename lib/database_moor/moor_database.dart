//Example
import 'package:moor/moor.dart';
import 'package:moor_flutter/moor_flutter.dart';
import 'package:state_managment_todoapp/dao/dao_app.dart';

//When you run flutter packages pub run build_runner watch this file will be create
part 'moor_database.g.dart';//g = generate
//The same file name

//By default, the name of the generated data class will be "Task" (without "s")
//All classes who extends from Table is a Table to Moor
class Tasks extends Table {
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

class Notes extends Table {
  
  TextColumn get id => text()();
  TextColumn get initDate => text().named('init_date').withDefault(Constant(getDate()))();
  TextColumn get note => text()();
  BoolColumn get isHide => boolean().withDefault(const Constant(false))();

   @override
  Set<Column> get primaryKey => {id, isHide};

}


//This maybe just can use one row
class UserData extends Table {

  TextColumn get id => text().withDefault(Constant('user_${getDate()}'))();
  BoolColumn get isDarkMode => boolean().withDefault(const Constant(false))();
  BoolColumn get isGoogleSignIn => boolean().withDefault(const Constant(false))();

  @override
  Set<Column> get primaryKey => {id, isDarkMode};

}


//Class necessary to handle the db
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


//With 'flutter packages pub run build_runner watch' you can observe the changes and create the files necessaries

//Speial function
 String getDate() => DateTime.now().millisecondsSinceEpoch.toString();

 /*

 YAML File
 Libraries to use
 dependencies:
  flutter:
    sdk: flutter
  moor_flutter:



  # The following adds the Cupertino Icons font to your application.
  # Use with the CupertinoIcons class for iOS style icons.
  cupertino_icons: ^0.1.3
  provider: ^4.0.5
  

dev_dependencies:
  flutter_test:
    sdk: flutter
  moor_generator: 
  build_runner:

  The same mode to work

*/










