import 'package:flutter/material.dart';
import 'package:kids/screens/itemViewScreens/ItemScreen.dart';
import '../../utils/ItemContainer.dart';

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
              MaterialPageRoute(builder: (context) =>
                  ItemScreen(
                      title: "DONKEY", svgPath: "assets/svg/animals/donkey.svg")));
        }
      ],
      [
        "MONKEY",
        "assets/svg/animals/monkey.svg",
            () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) =>
                  ItemScreen( title: "MONKEY",svgPath: "assets/svg/animals/monkey.svg")));
        }
      ],
      [
        "COW",
        "assets/svg/animals/cow.svg",
            () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) =>
                  ItemScreen( title:"COW" ,svgPath: "assets/svg/animals/cow.svg")));
        }
      ],
      [
        "CHICK",
        "assets/svg/animals/chick.svg",
            () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) =>
                  ItemScreen( title: "CHICK",svgPath: "assets/svg/animals/chick.svg")));
        }
      ],
      [
        "MOUSE",
        "assets/svg/animals/mouse.svg",
            () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) =>
                  ItemScreen( title: "MOUSE",svgPath: "assets/svg/animals/mouse.svg")));
        }
      ],
      [
        "TURTLE",
        "assets/svg/animals/turtle.svg",
            () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) =>
                  ItemScreen( title: "TURTLE",svgPath: "assets/svg/animals/turtle.svg")));
        }
      ],
      [
        "SHEEP",
        "assets/svg/animals/sheep.svg",
            () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) =>
                  ItemScreen( title: "SHEEP",svgPath: "assets/svg/animals/sheep.svg")));
        }
      ],
      [
        "DUCK",
        "assets/svg/animals/duck.svg",
            () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) =>
                  ItemScreen( title: "DUCK",svgPath: "assets/svg/animals/duck.svg")));
        }
      ],
      [
        "PIG",
        "assets/svg/animals/pig.svg",
            () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) =>
                  ItemScreen( title: "PIG",svgPath: "assets/svg/animals/pig.svg")));
        }
      ],
      [
        "ALPACA",
        "assets/svg/animals/alpaca.svg",
            () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) =>
                  ItemScreen( title: "ALPACA",svgPath: "assets/svg/animals/alpaca.svg")));
        }
      ],
      [
        "HORSE",
        "assets/svg/animals/horse.svg",
            () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) =>
                  ItemScreen( title:  "HORSE",svgPath: "assets/svg/animals/horse.svg")));
        }
      ],
      [
        "DOG",
        "assets/svg/animals/dog.svg",
            () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) =>
                  ItemScreen( title: "DOG",svgPath: "assets/svg/animals/dog.svg")));
        }
      ],
      [
        "BAT",
        "assets/svg/animals/bat.svg",
            () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) =>
                  ItemScreen( title: "BAT",svgPath: "assets/svg/animals/bat.svg")));
        }
      ],
      [
        "RABBIT",
        "assets/svg/animals/rabbit.svg",
            () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) =>
                  ItemScreen( title: "RABBIT",svgPath: "assets/svg/animals/rabbit.svg")));
        }
      ],

    ];
    return GridViewsItems(contentList: contentList, title: "Animals",);
  }
}
