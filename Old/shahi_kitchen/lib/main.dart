import 'dart:io';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:shahi_kitchen/screens/SplashScreen.dart';

void main() async {
  await Hive.initFlutter();
  WidgetsFlutterBinding.ensureInitialized();
  if (Platform.isAndroid) {
    await Firebase.initializeApp(
        options: const FirebaseOptions(
            apiKey: "AIzaSyDjvLWsrB8TzqolzC18vfxY80JsrtnFzFY",
            appId: "1:813171807072:android:4ec0d0ca7d095c7d540405",
            messagingSenderId: "813171807072",
            projectId: "shashikitchen-5bd72",
            storageBucket: "shashikitchen-5bd72.appspot.com"));
  } else {
    await Firebase.initializeApp();
  }
  final _myCartBox = Hive.openBox("cart");
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    // This line hides the status bar

    return MaterialApp(
      builder: (context, child) {
        return MediaQuery(
            data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
            child: child!);
      },
      theme: ThemeData(
        textTheme: TextTheme(
          bodyText1: TextStyle(),
          bodyText2: TextStyle(),
        ).apply(bodyColor: Colors.white, displayColor: Colors.white),
        scaffoldBackgroundColor: Colors.black,
        fontFamily: "poppins",
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.yellowAccent),
        useMaterial3: true,
      ),
      home: SplashScreen(),
    );
  }
}
