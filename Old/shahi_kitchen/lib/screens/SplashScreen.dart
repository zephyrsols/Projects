import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:shahi_kitchen/screens/DashboardScreen.dart';
import 'package:shahi_kitchen/screens/LoginScreen.dart';
import 'package:shahi_kitchen/screens/NewUserInfoScreen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  FirebaseAuth firebaseAuth = FirebaseAuth.instance;

  @override
  void initState() {
    // TODO: implement initState
    Timer(const Duration(seconds: 3), () {
      if (firebaseAuth.currentUser != null) {
        Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (context) => const DashboardScreen()));
      } else {
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => const LoginScreen()));
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Image.asset("assets/png/shashi_kitchen.png"),
      ),
    );
  }
}
