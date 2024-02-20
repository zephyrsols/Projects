import 'package:flutter/material.dart';

import '../../utils/ItemContainer.dart';
import '../mainScreens/MainScreen.dart';

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
        "TWO",
        "assets/svg/numbers/one.svg",
            () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => const MainScreen()));
        }
      ],
      [
        "TWO",
        "assets/svg/numbers/two.svg",
            () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => const MainScreen()));
        }
      ],
      [
        "THREE",
        "assets/svg/numbers/three.svg",
            () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => const MainScreen()));
        }
      ],
      [
        "FOUR",
        "assets/svg/numbers/four.svg",
            () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => const MainScreen()));
        }
      ],
      [
        "FIVE",
        "assets/svg/numbers/five.svg",
            () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => const MainScreen()));
        }
      ],
      [
        "SIX",
        "assets/svg/numbers/six.svg",
            () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => const MainScreen()));
        }
      ],
      [
        "SEVEN",
        "assets/svg/numbers/seven.svg",
            () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => const MainScreen()));
        }
      ],
      [
        "EIGHT",
        "assets/svg/numbers/eight.svg",
            () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => const MainScreen()));
        }
      ],
      [
        "NINE",
        "assets/svg/numbers/nine.svg",
            () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => const MainScreen()));
        }
      ],
      [
        "TEN",
        "assets/svg/numbers/ten.svg",
            () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => const MainScreen()));
        }
      ],
    ];
    return GridViewsItems(contentList: contentList,title: "Numbers",);  }
}
