import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:task_manager/screens/ProfileScreen.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:task_manager/util/searchBox.dart';
import 'package:task_manager/util/tasks.dart';

import '../database/database.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final _myBox = Hive.box("myBox");
  var firestore = FirebaseFirestore.instance;
  var auth = FirebaseAuth.instance;
  TaskDatabase taskDatabase = TaskDatabase();

  void deleteTask(int index) {
    setState(() {
      taskDatabase.taskList.removeAt(index);
    });
    taskDatabase.updateDatabase();
  }

  void completeTask(int index) {
    setState(() {
      taskDatabase.taskList[index][4] = true;
      taskDatabase.cmpTaskList.add(taskDatabase.taskList[index]);
      taskDatabase.taskList.removeAt(index);
    });
    taskDatabase.updateDatabase();
  }

  @override
  void initState() {
    //if user first time open the app
    if (_myBox.get("NEWTASKLIST") == null) {
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
      backgroundColor: const Color(0xFF4530B3),
      appBar: AppBar(
        toolbarHeight: 65,
        backgroundColor: const Color(0xFF4530B3),
        leadingWidth: 250,
        leading: Padding(
            padding: EdgeInsets.all(18.0),
            child: FutureBuilder<String>(
              future: getUserName(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  // While the data is loading, you can display a loading indicator or placeholder text
                  return Text(""); // Example of using a loading indicator
                } else if (snapshot.hasError) {
                  // Handle any errors that occur during the fetch operation
                  return Text(
                      'No Name'); // Example of displaying an error message
                } else {
                  // When the data is available, display the user's name
                  return Text(
                    "${snapshot.data}",
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 20),
                  );
                }
              },
            )),
        actions: [
          Padding(
            padding: const EdgeInsets.all(18.0),
            child: Tooltip(
              message: "User",
              child: GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const ProfileScreen()));
                },
                child: SvgPicture.asset(
                  "assets/svg/user_img.svg",
                  height: 25,
                  color: Colors.white,
                ),
              ),
            ),
          )
        ],
      ),
      body: Column(
        children: [
          SearchBox(),
          Expanded(
              child: ListView.builder(
            itemCount: taskDatabase.taskList.length,
            itemBuilder: (context, index) {
              return Tasks(
                  title: taskDatabase.taskList[index][0],
                  description: taskDatabase.taskList[index][1],
                  dueDate: taskDatabase.taskList[index][2],
                  color: taskDatabase.taskList[index][3],
                  isCompleted: taskDatabase.taskList[index][4],
                  deleteFunction: (context) => deleteTask(index),
                  completeFunction: (context) => completeTask(index));
            },
          )),
          SizedBox(
            height: 50,
          )
        ],
      ),
    );
  }

  Future<String> getUserName() async {
    try {
      QuerySnapshot querySnapshot = await firestore
          .collection("userData")
          .where("email", isEqualTo: auth.currentUser!.email)
          .get();
      if (querySnapshot.docs.isNotEmpty) {
        DocumentSnapshot userSnapshot = querySnapshot.docs.first;
        Map<String, dynamic> userData =
            userSnapshot.data() as Map<String, dynamic>;
        return userData['name'] ??
            ''; // Return the name field from userData, or an empty string if it's not available
      } else {
        return ''; // Return an empty string if no user data is found
      }
    } catch (e) {
      print('Error fetching user data: $e');
      return ''; // Handle the error gracefully by returning an empty string
    }
  }
}
