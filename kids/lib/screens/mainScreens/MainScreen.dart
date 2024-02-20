import 'package:flutter/material.dart';
import 'package:kids/screens/mainScreens/HomeScreen.dart';
import 'package:kids/screens/mainScreens/PrivacyScreen.dart';
import 'package:kids/screens/mainScreens/SettingsScreen.dart';
import 'package:zoom_tap_animation/zoom_tap_animation.dart';

import '../../utils/ItemContainer.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int index = 1;
  Color settingColor = Colors.white;
  Color homeColor = Colors.blue;
  Color privacyColor = Colors.white;
  List screens = [SettingsScreen(), HomeScreen(), PrivacyScreen()];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(fontFamily: "jua", useMaterial3: true),
      home: Scaffold(
        body: Stack(
          fit: StackFit.expand,
          children: [
            screens[index],
            Positioned(
                bottom: 18,
                left: 18,
                right: 18,
                height: 70,
                child: Container(
                  decoration: BoxDecoration(
                      border:
                          Border.all(width: 2, color: const Color(0xFFFBB23F)),
                      borderRadius: const BorderRadius.only(
                          topRight: Radius.circular(24),
                          topLeft: Radius.circular(24),
                          bottomLeft: Radius.circular(24),
                          bottomRight: Radius.circular(24)),
                      gradient: const LinearGradient(
                          colors: [Color(0xffFBB23F), Color(0xffFF8A42)])),
                  child: Row(
                    children: [
                      Spacer(),
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            index = 0;
                            settingColor = Colors.blue;
                            homeColor = Colors.white;
                            privacyColor = Colors.white;
                          });
                        },
                        child: ZoomTapAnimation(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.settings,
                                color: settingColor,
                                size: 30,
                              ),
                              Text(
                                "Settings",
                                style: TextStyle(color: settingColor),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Spacer(),
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            index = 1;
                            settingColor = Colors.white;
                            homeColor = Colors.blue;
                            privacyColor = Colors.white;
                          });
                        },
                        child: ZoomTapAnimation(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.home,
                                color: homeColor,
                                size: 30,
                              ),
                              Text(
                                "Home",
                                style: TextStyle(color: homeColor),
                              )
                            ],
                          ),
                        ),
                      ),
                      Spacer(),
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            index = 2;
                            settingColor = Colors.white;
                            homeColor = Colors.white;
                            privacyColor = Colors.blue;
                          });
                        },
                        child: ZoomTapAnimation(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.privacy_tip,
                                color: privacyColor,
                                size: 30,
                              ),
                              Text(
                                "Privacy",
                                style: TextStyle(color: privacyColor),
                              )
                            ],
                          ),
                        ),
                      ),
                      Spacer()
                    ],
                  ),
                ))
          ],
        ),
      ),
    );
  }
}
