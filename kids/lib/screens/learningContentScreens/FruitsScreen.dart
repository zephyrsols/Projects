import 'package:flutter/material.dart';

import '../../utils/ItemContainer.dart';
import '../mainScreens/MainScreen.dart';

class FruitsScreen extends StatefulWidget {
  const FruitsScreen({super.key});

  @override
  State<FruitsScreen> createState() => _FruitsScreenState();
}

class _FruitsScreenState extends State<FruitsScreen> {
  @override
  Widget build(BuildContext context) {
    List contentList = [
      [
        "APPLE",
        "assets/svg/fruits/apple.svg",
            () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => const MainScreen()));
        }
      ],
      [
        "PEAR",
        "assets/svg/fruits/pear.svg",
            () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => const MainScreen()));
        }
      ],
      [
        "BANANA",
        "assets/svg/fruits/banana.svg",
            () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => const MainScreen()));
        }
      ],
      [
        "WATERMELON",
        "assets/svg/fruits/watermelon.svg",
            () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => const MainScreen()));
        }
      ],
      [
        "CHERRY",
        "assets/svg/fruits/cherry.svg",
            () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => const MainScreen()));
        }
      ],
      [
        "GRAPES",
        "assets/svg/fruits/grapes.svg",
            () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => const MainScreen()));
        }
      ],
      [
        "MANGO",
        "assets/svg/fruits/mango.svg",
            () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => const MainScreen()));
        }
      ],
      [
        "PAPAYA",
        "assets/svg/fruits/papaya.svg",
            () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => const MainScreen()));
        }
      ],
      [
        "PINEAPPLE",
        "assets/svg/fruits/pineapple.svg",
            () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => const MainScreen()));
        }
      ],
      [
        "STRAWBERRY",
        "assets/svg/fruits/strawberry.svg",
            () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => const MainScreen()));
        }
      ],
      [
        "PEACH",
        "assets/svg/fruits/peach.svg",
            () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => const MainScreen()));
        }
      ],
      [
        "PUMPKIN",
        "assets/svg/fruits/pumpkin.svg",
            () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => const MainScreen()));
        }
      ],
      [
        "MANGOSTEEN",
        "assets/svg/fruits/mangosteen.svg",
            () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => const MainScreen()));
        }
      ],

    ];
    return GridViewsItems(contentList: contentList,title: "Fruits",);
  }
}
