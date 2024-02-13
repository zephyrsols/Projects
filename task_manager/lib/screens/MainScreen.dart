import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:task_manager/screens/CompletedTaskScreen.dart';
import 'package:task_manager/screens/HomeScreen.dart';
import 'package:task_manager/screens/TaskCreaterScreen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  var index = 0;
  final screens = [HomeScreen(), TaskCreaterSCreen(), CompletedTaskScreen()];
  var onBoardingValue = "";


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      backgroundColor: const Color(0xFF4530B3),
      body: WillPopScope(
        child: screens[index],
        onWillPop: () async {
          SystemNavigator.pop();
          return false;
        },
      ),
      bottomNavigationBar: CurvedNavigationBar(
        buttonBackgroundColor: Color(0xFF1DBEF5),
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

  void onBoarding() async {
    var sharedPref = await SharedPreferences.getInstance();
    sharedPref.setString("onBoarding", "1").toString();
  }
}
