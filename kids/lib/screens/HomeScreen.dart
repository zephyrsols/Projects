import 'package:flutter/material.dart';
import '../utils/ItemContainer.dart';
import 'LearningContentScreen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
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
                  "HELLO",
                  style: TextStyle(
                      fontFamily: "just_another_hand",
                      fontSize: 50,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
              ),
              Row(
                children: [
                  const Spacer(),
                  itemContainer(
                      "Lets start learning", "assets/svg/start_learning.svg",
                      () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => LearningContent()));
                  }),
                  const Spacer(),
                  itemContainer(
                      "Video learning", "assets/svg/video_learning.svg", () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => LearningContent()));
                  }),
                  const Spacer(),
                ],
              ),
              const SizedBox(
                height: 50,
              ),
              Row(
                children: [
                  const Spacer(),
                  itemContainer(
                      "Look and Choose", "assets/svg/look_and_choose.svg", () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => LearningContent()));
                  }),
                  const Spacer(),
                  itemContainer(
                      "Listen and Guess", "assets/svg/listen_and_guess.svg",
                      () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => LearningContent()));
                  }),
                  const Spacer(),
                ],
              ),
            ],
          )),
    );
  }
}
