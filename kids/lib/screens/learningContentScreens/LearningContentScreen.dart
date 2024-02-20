import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:kids/screens/learningContentScreens/AlphabetsScreen.dart';
import 'package:kids/screens/learningContentScreens/AnimalsScreen.dart';
import 'package:kids/screens/learningContentScreens/BirdsScreen.dart';
import 'package:kids/screens/learningContentScreens/ColorsScreen.dart';
import 'package:kids/screens/learningContentScreens/FlowersScreen.dart';
import 'package:kids/screens/learningContentScreens/FruitsScreen.dart';
import 'package:kids/screens/learningContentScreens/NumbersScreen.dart';
import 'package:kids/screens/learningContentScreens/ShapesScreen.dart';
import 'package:kids/screens/mainScreens/MainScreen.dart';

import '../../utils/ItemContainer.dart';

class LearningContent extends StatefulWidget {
  const LearningContent({super.key});

  @override
  State<LearningContent> createState() => _LearningContentState();
}

class _LearningContentState extends State<LearningContent> {
  @override
  Widget build(BuildContext context) {
    List contentList = [
      [
        "ALPHABETS",
        "assets/svg/listen_and_guess/alphabet.svg",
        () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => const AlphabetsScreen()));
        }
      ],
      [
        "NUMBERS",
        "assets/svg/listen_and_guess/animals.svg",
        () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => const NumbersScreen()));
        }
      ],
      [
        "COLORS",
        "assets/svg/listen_and_guess/colors.svg",
        () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => const ColorsScreen()));
        }
      ],
      [
        "SHAPES",
        "assets/svg/listen_and_guess/shapes.svg",
        () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => const ShapesScreen()));
        }
      ],
      [
        "ANIMALS",
        "assets/svg/listen_and_guess/animals.svg",
        () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => const AnimalsScreen()));
        }
      ],
      [
        "BIRDS",
        "assets/svg/listen_and_guess/birds.svg",
        () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => const BirdsScreen()));
        }
      ],
      [
        "FLOWERS",
        "assets/svg/listen_and_guess/flowers.svg",
        () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => const FlowersScreen()));
        }
      ],
      [
        "FRUITS",
        "assets/svg/listen_and_guess/fruits.svg",
        () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => const FruitsScreen()));
        }
      ]
    ];
    return GridViewsItems(contentList: contentList,title: "PreSchool Kids Learning",);
  }
}
