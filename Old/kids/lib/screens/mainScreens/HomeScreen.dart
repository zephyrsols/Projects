import 'package:flutter/material.dart';
import 'package:kids/screens/videoLearningScreens/VideoLearningScreen.dart';
import '../../utils/ItemContainer.dart';
import '../learningContentScreens/LearningContentScreen.dart';

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
                      "Lets start learning", "assets/svg/home_screen/start_learning.svg",
                      () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const LearningContent()));
                  }),
                  const Spacer(),
                  itemContainer(
                      "Video learning", "assets/svg/home_screen/video_learning.svg", () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const VideoLearningScreen()));
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
                      "Look and Choose", "assets/svg/home_screen/look_and_choose.svg", () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const LearningContent()));
                  }),
                  const Spacer(),
                  itemContainer(
                      "Listen and Guess", "assets/svg/home_screen/listen_and_guess.svg",
                      () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const LearningContent()));
                  }),
                  const Spacer(),
                ],
              ),
            ],
          )),
    );
  }
}
