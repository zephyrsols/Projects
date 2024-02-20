import 'package:flutter/material.dart';

import '../../utils/ItemContainer.dart';
import '../mainScreens/MainScreen.dart';
class AnimalsScreen extends StatefulWidget {
  const AnimalsScreen({super.key});

  @override
  State<AnimalsScreen> createState() => _AnimalsScreenState();
}

class _AnimalsScreenState extends State<AnimalsScreen> {
  @override
  Widget build(BuildContext context) {
    List contentList = [
      [
        "DONKEY",
        "assets/svg/animals/donkey.svg",
            () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => const MainScreen()));
        }
      ],
      [
        "MONKEY",
        "assets/svg/animals/monkey.svg",
            () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => const MainScreen()));
        }
      ],
      [
        "COW",
        "assets/svg/animals/cow.svg",
            () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => const MainScreen()));
        }
      ],
      [
        "CHICK",
        "assets/svg/animals/chick.svg",
            () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => const MainScreen()));
        }
      ],
      [
        "MOUSE",
        "assets/svg/animals/mouse.svg",
            () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => const MainScreen()));
        }
      ],
      [
        "TURTLE",
        "assets/svg/animals/turtle.svg",
            () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => const MainScreen()));
        }
      ],
      [
        "SHEEP",
        "assets/svg/animals/sheep.svg",
            () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => const MainScreen()));
        }
      ],
      [
        "DUCK",
        "assets/svg/animals/duck.svg",
            () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => const MainScreen()));
        }
      ],
      [
        "PIG",
        "assets/svg/animals/pig.svg",
            () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => const MainScreen()));
        }
      ],
      [
        "ALPACA",
        "assets/svg/animals/alpaca.svg",
            () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => const MainScreen()));
        }
      ],
      [
        "HORSE",
        "assets/svg/animals/horse.svg",
            () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => const MainScreen()));
        }
      ],
      [
        "DOG",
        "assets/svg/animals/dog.svg",
            () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => const MainScreen()));
        }
      ],
      [
        "BAT",
        "assets/svg/animals/bat.svg",
            () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => const MainScreen()));
        }
      ],
      [
        "RABBIT",
        "assets/svg/animals/rabbit.svg",
            () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => const MainScreen()));
        }
      ],

    ];
    return GridViewsItems(contentList: contentList,title: "Animals",);  }
}
