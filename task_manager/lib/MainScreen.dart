import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:task_manager/CompletedTaskScreen.dart';
import 'package:task_manager/HomeScreen.dart';
import 'package:task_manager/TaskCreaterScreen.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  var index = 0;
  final screens = [HomeScreen(), TaskCreaterSCreen(),CompletedTaskScreen()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      backgroundColor: const Color(0xFF4530B3),
      body: screens[index],
      bottomNavigationBar: CurvedNavigationBar(
        height: 55,
        backgroundColor: Colors.transparent,
        animationDuration: Duration(milliseconds: 300),
        onTap: (index) => setState(() {
          this.index = index;
        }),
        items: [Icon(Icons.home), Icon(Icons.add), Icon(Icons.list)],
      ),
    );
  }
}
