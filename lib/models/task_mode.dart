//This type of classes always should be created
import 'package:flutter/cupertino.dart';
import 'package:state_managment_todoapp/widgets/checkbox_tile_custom.dart';

class TaskNotifier extends ChangeNotifier {
  //Read
  //https://pub.dev/packages/provider#-readme-tab-
  List<CheckBoxTile> _taskList = new List();

  List<CheckBoxTile> get taskList => _taskList;

  void deleteAnItem(CheckBoxTile item) {
    _taskList.remove(item);
    notifyListeners();
  }

  void addAnItem(CheckBoxTile item) {
    _taskList.add(item);
    notifyListeners();
  }

}