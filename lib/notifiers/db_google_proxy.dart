import 'package:flutter/material.dart';
import 'package:state_managment_todoapp/notifiers/db_notifier.dart';
import 'package:state_managment_todoapp/notifiers/google_notifier.dart';

class GoogleDatabaseProxy {

  DatabaseNotifier dbNotifier;
  GoogleNotifier ggNotifier;

  GoogleDatabaseProxy({
    @required this.dbNotifier,
    @required this.ggNotifier,
  });

  ///Notifier
  DatabaseNotifier get databaseNotifier => dbNotifier ?? null;

  GoogleNotifier get googleNotifier => googleNotifier ?? null;


}
