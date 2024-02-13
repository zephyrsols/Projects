import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter/services.dart';
import 'package:task_manager/screens/LoginScreen.dart';

class OnBoardingScreenThree extends StatefulWidget {
  const OnBoardingScreenThree({super.key});

  @override
  State<OnBoardingScreenThree> createState() => _OnBoardingScreenOneState();
}

class _OnBoardingScreenOneState extends State<OnBoardingScreenThree> {
  @override
  Widget build(BuildContext context) {

    return boardingScreenThree();
  }

  Scaffold boardingScreenThree(){
    return Scaffold(
      backgroundColor: const Color(0xFFDBE9F6),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          children: [
            SvgPicture.asset("assets/svg/on_boarding_img_three.svg"),
            const Text(
              "Color customization",
              style: TextStyle(
                  color: Color(0xFF10194D),
                  fontSize: 25,
                  fontWeight: FontWeight.bold),
            ),
            const Text(
              "Team and project management with\nsolution providing app",
              style: TextStyle(color: Color.fromARGB(255, 1, 1, 2)),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(0, 50, 20, 0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const LoginScreen()));
                    },
                    child: const Text(
                      "Get Started",
                      textAlign: TextAlign.right,
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF10194D)),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
