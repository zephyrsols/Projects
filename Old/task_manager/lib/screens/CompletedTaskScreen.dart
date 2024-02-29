import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:task_manager/database/database.dart';
import 'package:task_manager/util/completeTasks.dart';

class CompletedTaskScreen extends StatefulWidget {
  const CompletedTaskScreen({super.key});

  @override
  State<CompletedTaskScreen> createState() => _CompletedTaskScreenState();
}

class _CompletedTaskScreenState extends State<CompletedTaskScreen> {
  final _myBox = Hive.box("myBox");
  TaskDatabase taskDatabase = TaskDatabase();

  void deleteTask(int index) {
    setState(() {
      taskDatabase.cmpTaskList.removeAt(index);
    });
    taskDatabase.updateDatabase();
  }
  @override
  void initState() {
    //if user first time open the app
    if (_myBox.get("CMPASKLIST") == null) {
      taskDatabase.createInitialData();
    } else {
      //if user already opened the app
      taskDatabase.loadData();
    }
    setState(() {});
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color(0xFFDBE9F6),
        appBar: AppBar(
          toolbarHeight: 65,
          backgroundColor: const Color(0xFFDBE9F6),
          title: const Text(
            "Completed  Tasks",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
          ),
        ),
        body: ListView.builder(
          itemCount: taskDatabase.cmpTaskList.length,
          itemBuilder: (context, index) {
            return CompleteTasks(
                title: taskDatabase.cmpTaskList[index][0],
                description: taskDatabase.cmpTaskList[index][1],
                dueDate: taskDatabase.cmpTaskList[index][2],
                color: taskDatabase.cmpTaskList[index][3],
                isCompleted: taskDatabase.cmpTaskList[index][4],
                deleteFunction: (context) => deleteTask(index));
          },
        ));
  }
}
