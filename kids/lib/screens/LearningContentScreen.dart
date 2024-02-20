import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:kids/screens/MainScreen.dart';

import '../utils/ItemContainer.dart';

class LearningContent extends StatefulWidget {
  const LearningContent({super.key});

  @override
  State<LearningContent> createState() => _LearningContentState();
}

class _LearningContentState extends State<LearningContent> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(fontFamily: "jua", useMaterial3: true),
      home: Scaffold(
        body: Container(
            height: double.infinity,
            decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("assets/png/screens_bg.png"),
                    fit: BoxFit.cover)),
            child: Padding(
              padding: const EdgeInsets.all(18.0),
              child: ListView(
                children: [
                  const Padding(
                    padding: EdgeInsets.all(18.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "PreSchool Kids Learning",
                          style: TextStyle(
                              color: Color(0xffFBB23F),
                              fontFamily: "just_another_hand",
                              fontSize: 30),
                        ),
                      ],
                    ),
                  ),
                  itemRow(
                      "ALPHABETS",
                      "assets/svg//listen_and_guess/alphabet.svg",
                      () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const MainScreen()));
                      },
                      "NUMBERS",
                      "assets/svg/listen_and_guess/alphabet.svg",
                      () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const MainScreen()));
                      }),
                  const SizedBox(
                    height: 50,
                  ),
                  itemRow(
                      "COLORS",
                      "assets/svg/listen_and_guess/colors.svg",
                      () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const MainScreen()));
                      },
                      "SHAPES",
                      "assets/svg/listen_and_guess/shapes.svg",
                      () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const MainScreen()));
                      }),
                  const SizedBox(
                    height: 50,
                  ),
                  itemRow(
                      "ANIMALS",
                      "assets/svg/listen_and_guess/animals.svg",
                      () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const MainScreen()));
                      },
                      "BIRDS",
                      "assets/svg/listen_and_guess/birds.svg",
                      () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const MainScreen()));
                      }),
                  const SizedBox(
                    height: 50,
                  ),
                  itemRow(
                      "FLOWERS",
                      "assets/svg/listen_and_guess/flowers.svg",
                      () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const MainScreen()));
                      },
                      "FRUITS",
                      "assets/svg/listen_and_guess/fruits.svg",
                      () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const MainScreen()));
                      }),
                ],
              ),
            )),
      ),
    );
  }

  Widget itemRow(String title1, String picture1, VoidCallback navigator1,
      String title2, String picture2, VoidCallback navigator2) {
    return Row(
      children: [
        const Spacer(),
        itemContainer(title1, picture1, navigator1),
        const Spacer(),
        itemContainer(title2, picture2, navigator2),
        const Spacer(),
      ],
    );
  }
}
