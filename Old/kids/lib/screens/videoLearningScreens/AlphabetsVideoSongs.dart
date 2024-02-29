import 'package:flutter/material.dart';

import '../../utils/ItemContainer.dart';
import '../itemViewScreens/ItemScreen.dart';

class AlphabetsVideoSongs extends StatefulWidget {
  const AlphabetsVideoSongs({super.key});

  @override
  State<AlphabetsVideoSongs> createState() => _AlphabetVideoSongsState();
}

class _AlphabetVideoSongsState extends State<AlphabetsVideoSongs> {
  @override
  Widget build(BuildContext context) {
    List contentList = [
      [
        "Song Name 1",
        "assets/svg/animals/donkey.svg",
            () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) =>
                  ItemScreen(
                      title: "DONKEY", svgPath: "assets/svg/animals/donkey.svg")));
        }
      ],
      [
        "Song Name 2",
        "assets/svg/animals/monkey.svg",
            () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) =>
                  ItemScreen( title: "MONKEY",svgPath: "assets/svg/animals/monkey.svg")));
        }
      ],
      [
        "Song Name 3",
        "assets/svg/animals/cow.svg",
            () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) =>
                  ItemScreen( title:"COW" ,svgPath: "assets/svg/animals/cow.svg")));
        }
      ],
      [
        "Song Name 4",
        "assets/svg/animals/chick.svg",
            () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) =>
                  ItemScreen( title: "CHICK",svgPath: "assets/svg/animals/chick.svg")));
        }
      ],
      [
        "Song Name 5",
        "assets/svg/animals/mouse.svg",
            () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) =>
                  ItemScreen( title: "MOUSE",svgPath: "assets/svg/animals/mouse.svg")));
        }
      ],
      [
        "Song Name 6",
        "assets/svg/animals/turtle.svg",
            () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) =>
                  ItemScreen( title: "TURTLE",svgPath: "assets/svg/animals/turtle.svg")));
        }
      ],
      [
        "Song Name 7",
        "assets/svg/animals/sheep.svg",
            () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) =>
                  ItemScreen( title: "SHEEP",svgPath: "assets/svg/animals/sheep.svg")));
        }
      ],
      [
        "Song Name 8",
        "assets/svg/animals/duck.svg",
            () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) =>
                  ItemScreen( title: "DUCK",svgPath: "assets/svg/animals/duck.svg")));
        }
      ],
      [
        "Song Name 9",
        "assets/svg/animals/pig.svg",
            () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) =>
                  ItemScreen( title: "PIG",svgPath: "assets/svg/animals/pig.svg")));
        }
      ],
      [
        "Song Name 10",
        "assets/svg/animals/alpaca.svg",
            () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) =>
                  ItemScreen( title: "ALPACA",svgPath: "assets/svg/animals/alpaca.svg")));
        }
      ],
      [
        "Song Name 11",
        "assets/svg/animals/horse.svg",
            () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) =>
                  ItemScreen( title:  "HORSE",svgPath: "assets/svg/animals/horse.svg")));
        }
      ],
      [
        "Song Name 12",
        "assets/svg/animals/dog.svg",
            () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) =>
                  ItemScreen( title: "DOG",svgPath: "assets/svg/animals/dog.svg")));
        }
      ],
      [
        "Song Name 13",
        "assets/svg/animals/bat.svg",
            () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) =>
                  ItemScreen( title: "BAT",svgPath: "assets/svg/animals/bat.svg")));
        }
      ],
      [
        "Song Name 14",
        "assets/svg/animals/rabbit.svg",
            () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) =>
                  ItemScreen( title: "RABBIT",svgPath: "assets/svg/animals/rabbit.svg")));
        }
      ],

    ];
    return GridViewsItems(contentList: contentList, title: "ALPHABET VIDEO SONGS",);
  }
}
