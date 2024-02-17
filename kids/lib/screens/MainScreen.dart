import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

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

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(fontFamily: "jua", useMaterial3: true),
      home: Scaffold(
        // bottomNavigationBar: BottomNavigationBar(
        //   backgroundColor: Color(0xffFBB23F),
        //   unselectedItemColor: Colors.white ,
        //   type: BottomNavigationBarType.fixed,
        //   onTap: (index) {
        //     setState(() {
        //       this.index = index;
        //     });
        //   },
        //   currentIndex: index,
        //   items: [
        //     BottomNavigationBarItem(
        //         icon: Icon(Icons.settings), label: "Setting"),
        //     BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
        //     BottomNavigationBarItem(
        //         icon: Icon(Icons.privacy_tip), label: "Privacy")
        //   ],
        // ),
        body: Stack(
          fit: StackFit.expand,
          children: [
            Container(
                height: double.infinity,
                decoration: const BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage("assets/png/main_screen_bg.png"),
                        fit: BoxFit.cover)),
                child: Column(
                  children: [
                    const Padding(
                      padding: EdgeInsets.all(100),
                      child: Text(
                        "Hello",
                        style: TextStyle(
                            fontFamily: "just_another_hand", fontSize: 50),
                      ),
                    ),
                    Row(
                      children: [
                        const Spacer(),
                        Container(
                          height: 150,
                          width: 150,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              gradient: const LinearGradient(colors: [
                                Color(0xffFBB23F),
                                Color(0xffFF8A42)
                              ])),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SvgPicture.asset("assets/svg/start_learning.svg"),
                              const Text(
                                "Lets start learning",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 16),
                              ),
                            ],
                          ),
                        ),
                        const Spacer(),
                        Container(
                          height: 150,
                          width: 150,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              gradient: const LinearGradient(colors: [
                                Color(0xffFBB23F),
                                Color(0xffFF8A42)
                              ])),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SvgPicture.asset("assets/svg/start_learning.svg"),
                              const Text(
                                "Video learning",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 16),
                              ),
                            ],
                          ),
                        ),
                        const Spacer(),
                      ],
                    ),
                    const SizedBox(
                      height: 50,
                    ),
                    Row(
                      children: [
                        const Spacer(),
                        Container(
                          height: 150,
                          width: 150,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              gradient: const LinearGradient(colors: [
                                Color(0xffFBB23F),
                                Color(0xffFF8A42)
                              ])),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SvgPicture.asset("assets/svg/look_and_choose.svg"),
                              const Text(
                                "Look and Choose",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 16),
                              ),
                            ],
                          ),
                        ),
                        const Spacer(),
                        Container(
                          height: 150,
                          width: 150,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              gradient: const LinearGradient(colors: [
                                Color(0xffFBB23F),
                                Color(0xffFF8A42)
                              ])),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SvgPicture.asset("assets/svg/listen_and_guess.svg"),
                              const Text(
                                "Listen and Guess",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 16),
                              ),
                            ],
                          ),
                        ),
                        const Spacer(),
                      ],
                    ),
                  ],
                )),
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
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.settings,
                              color: settingColor,
                            ),
                            Text(
                              "Settings",
                              style: TextStyle(color: settingColor),
                            )
                          ],
                        ),
                      ),
                      Spacer(),
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            index = 0;
                            settingColor = Colors.white;
                            homeColor = Colors.blue;
                            privacyColor = Colors.white;
                          });
                        },
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.home,
                              color: homeColor,
                            ),
                            Text(
                              "Home",
                              style: TextStyle(color: homeColor),
                            )
                          ],
                        ),
                      ),
                      Spacer(),
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            index = 0;
                            settingColor = Colors.white;
                            homeColor = Colors.white;
                            privacyColor = Colors.blue;
                          });
                        },
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.privacy_tip,
                              color: privacyColor,
                            ),
                            Text(
                              "Privacy",
                              style: TextStyle(color: privacyColor),
                            )
                          ],
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
