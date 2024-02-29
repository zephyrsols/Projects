import 'dart:async';
import 'package:flutter/material.dart';
import 'package:task_manager/screens/LoginScreen.dart';
import 'package:task_manager/screens/MainScreen.dart';
import 'package:flutter/services.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'dart:io';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  if (Platform.isAndroid) {
    await Firebase.initializeApp(
        options: const FirebaseOptions(
            apiKey: "AIzaSyALbEkHYqQHEq_L3hyn-WnBvZthphdzuPw",
            appId: "1:738881884948:android:37721972b54c940869a801",
            messagingSenderId: "738881884948",
            projectId: "tasks-manager-1f40b",
            storageBucket: "tasks-manager-1f40b.appspot.com"));
  } else {
    await Firebase.initializeApp();
  }
  await Hive.initFlutter();

  var box = await Hive.openBox("myBox");
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    theme: ThemeData(useMaterial3: true, fontFamily: "poppins"),
    home: const SplashScreen(),
  ));
}

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  var auth = FirebaseAuth.instance;
  var onBoardingValue = "";

  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 3), () {
      if (auth.currentUser != null) {
        if (onBoardingValue == "1") {
          Navigator.pushReplacement(context,
              MaterialPageRoute(builder: (context) => const MainScreen()));
        } else {
          Navigator.pushReplacement(context,
              MaterialPageRoute(builder: (context) => const MainScreen()));
        }
      } else {
        Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (context) => const LoginScreen()));
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      appBar: AppBar(
        toolbarHeight: 0,
        backgroundColor: Color(0xFFDBE9F6),
      ),
      body: Center(
        child: Image.asset(
          "assets/png/splash_screen_img.png",
        ),
      ),
    );
  }

  void onBoarding() async {
    var sharedPref = await SharedPreferences.getInstance();
    onBoardingValue = sharedPref.getString("onBoarding").toString() ?? "";
  }
}
