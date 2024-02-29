import 'package:flutter/material.dart';
import 'package:kids/screens/itemViewScreens/ItemScreen.dart';

import '../../utils/ItemContainer.dart';

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
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => ItemScreen(
                      title: "APPLE", svgPath: "assets/svg/fruits/apple.svg")));
        }
      ],
      [
        "PEAR",
        "assets/svg/fruits/pear.svg",
        () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => ItemScreen(
                  title: "PEAR", svgPath: "assets/svg/fruits/pear.svg")));
        }
      ],
      [
        "BANANA",
        "assets/svg/fruits/banana.svg",
        () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => ItemScreen(
                  title: "BANANA", svgPath: "assets/svg/fruits/banana.svg")));
        }
      ],
      [
        "WATERMELON",
        "assets/svg/fruits/watermelon.svg",
        () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => ItemScreen(
                  title: "WATERMELON", svgPath: "assets/svg/fruits/watermelon.svg")));
        }
      ],
      [
        "CHERRY",
        "assets/svg/fruits/cherry.svg",
        () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => ItemScreen(
                  title: "CHERRY", svgPath: "assets/svg/fruits/cherry.svg")));
        }
      ],
      [
        "GRAPES",
        "assets/svg/fruits/grapes.svg",
        () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => ItemScreen(
                  title: "GRAPES", svgPath: "assets/svg/fruits/grapes.svg")));
        }
      ],
      [
        "MANGO",
        "assets/svg/fruits/mango.svg",
        () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => ItemScreen(
                  title: "MANGO", svgPath: "assets/svg/fruits/mango.svg")));
        }
      ],
      [
        "PAPAYA",
        "assets/svg/fruits/papaya.svg",
        () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => ItemScreen(
                  title: "PAPAYA", svgPath: "assets/svg/fruits/papaya.svg")));
        }
      ],
      [
        "PINEAPPLE",
        "assets/svg/fruits/pineapple.svg",
        () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => ItemScreen(
                  title: "PINEAPPLE", svgPath: "assets/svg/fruits/pineapple.svg")));
        }
      ],
      [
        "STRAWBERRY",
        "assets/svg/fruits/strawberry.svg",
        () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => ItemScreen(
                  title: "STRAWBERRY", svgPath: "assets/svg/fruits/strawberry.svg")));
        }
      ],
      [
        "PEACH",
        "assets/svg/fruits/peach.svg",
        () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => ItemScreen(
                  title: "PEACH", svgPath: "assets/svg/fruits/peach.svg")));
        }
      ],
      [
        "PUMPKIN",
        "assets/svg/fruits/pumpkin.svg",
        () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => ItemScreen(
                  title: "PUMPKIN", svgPath: "assets/svg/fruits/pumpkin.svg")));
        }
      ],
      [
        "MANGOSTEEN",
        "assets/svg/fruits/mangosteen.svg",
        () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => ItemScreen(
                  title: "MANGOSTEEN", svgPath: "assets/svg/fruits/mangosteen.svg")));
        }
      ],
    ];
    return GridViewsItems(
      contentList: contentList,
      title: "Fruits",
    );
  }
}
