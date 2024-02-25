import 'package:flutter/material.dart';
import 'package:kids/screens/itemViewScreens/ItemScreen.dart';

import '../../utils/ItemContainer.dart';

class NumbersScreen extends StatefulWidget {
  const NumbersScreen({super.key});

  @override
  State<NumbersScreen> createState() => _NumbersScreenState();
}

class _NumbersScreenState extends State<NumbersScreen> {
  @override
  Widget build(BuildContext context) {
    List contentList = [
      [
        "ONE",
        "assets/svg/numbers/one.svg",
        () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => ItemScreen(
                      title: "ONE", svgPath: "assets/svg/numbers/one.svg")));
        }
      ],
      [
        "TWO",
        "assets/svg/numbers/two.svg",
        () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => ItemScreen(
                      title: "TWO", svgPath: "assets/svg/numbers/two.svg")));
        }
      ],
      [
        "THREE",
        "assets/svg/numbers/three.svg",
        () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => ItemScreen(title: "THREE", svgPath: "assets/svg/numbers/three.svg")));
        }
      ],
      [
        "FOUR",
        "assets/svg/numbers/four.svg",
        () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => ItemScreen(title: "FOUR", svgPath: "assets/svg/numbers/four.svg")));
        }
      ],
      [
        "FIVE",
        "assets/svg/numbers/five.svg",
        () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => ItemScreen(title: "FIVE", svgPath: "assets/svg/numbers/five.svg")));
        }
      ],
      [
        "SIX",
        "assets/svg/numbers/six.svg",
        () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => ItemScreen(title: "SIX", svgPath: "assets/svg/numbers/six.svg")));
        }
      ],
      [
        "SEVEN",
        "assets/svg/numbers/seven.svg",
        () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => ItemScreen(title: "SEVEN", svgPath: "assets/svg/numbers/seven.svg")));
        }
      ],
      [
        "EIGHT",
        "assets/svg/numbers/eight.svg",
        () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => ItemScreen(title: "EIGHT", svgPath: "assets/svg/numbers/eight.svg")));
        }
      ],
      [
        "NINE",
        "assets/svg/numbers/nine.svg",
        () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => ItemScreen(title: "NINE", svgPath: "assets/svg/numbers/nine.svg")));
        }
      ],
      [
        "TEN",
        "assets/svg/numbers/ten.svg",
        () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => ItemScreen(title: "TEN", svgPath: "assets/svg/numbers/ten.svg")));
        }
      ],
    ];
    return GridViewsItems(
      contentList: contentList,
      title: "Numbers",
    );
  }
}
