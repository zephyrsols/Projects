import 'package:hive_flutter/hive_flutter.dart';

class TaskDatabase {
  List taskList = [];
  List cmpTaskList = [];

  //reference box
  final _myBox = Hive.box("myBox");

  //first time open app
  void createInitialData() {
    taskList = [
      ["Second Task", "Checking the description 2", "12 Feb", 0x80fa00ff, false]
    ];
    cmpTaskList = [
      ["First Task", "Checking the description", "13 Feb", 0x80fbbc05, false],
    ];
  }

  //load data from the database
  void loadData() {
    taskList = _myBox.get("NEWTASKLIST");
    cmpTaskList = _myBox.get("CMPASKLIST");

  }

  //update the database
  void updateDatabase() {
    _myBox.put("NEWTASKLIST", taskList);
    _myBox.put("CMPASKLIST", cmpTaskList);
  }
}
