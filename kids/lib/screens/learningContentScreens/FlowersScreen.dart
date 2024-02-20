import 'package:flutter/material.dart';

import '../../utils/ItemContainer.dart';
import '../mainScreens/MainScreen.dart';

class FlowersScreen extends StatefulWidget {
  const FlowersScreen({super.key});

  @override
  State<FlowersScreen> createState() => _FlowersScreenState();
}

class _FlowersScreenState extends State<FlowersScreen> {
  @override
  Widget build(BuildContext context) {
    List contentList = [
      [
        "BLUEBELL",
        "assets/svg/flowers/bluebell.svg",
            () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => const MainScreen()));
        }
      ],
      [
        "PANSY",
        "assets/svg/flowers/pansy.svg",
            () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => const MainScreen()));
        }
      ],
      [
        "SUNFLOWER",
        "assets/svg/flowers/sunflower.svg",
            () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => const MainScreen()));
        }
      ],
      [
        "HIBISCUS",
        "assets/svg/flowers/hibiscus.svg",
            () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => const MainScreen()));
        }
      ],
      [
        "COURGETTE",
        "assets/svg/flowers/courgette.svg",
            () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => const MainScreen()));
        }
      ],
      [
        "LILAC",
        "assets/svg/flowers/lilac.svg",
            () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => const MainScreen()));
        }
      ],
      [
        "NASTURTIUM",
        "assets/svg/flowers/nasturtium.svg",
            () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => const MainScreen()));
        }
      ],
      [
        "PEA",
        "assets/svg/flowers/pea.svg",
            () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => const MainScreen()));
        }
      ],
      [
        "GENISTA",
        "assets/svg/flowers/genista.svg",
            () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => const MainScreen()));
        }
      ],
      [
        "ANDROMEDA",
        "assets/svg/flowers/andromeda.svg",
            () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => const MainScreen()));
        }
      ],
      [
        "CONSTANTIA",
        "assets/svg/flowers/constantia.svg",
            () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => const MainScreen()));
        }
      ],
      [
        "CAMPANULA",
        "assets/svg/flowers/campanula.svg",
            () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => const MainScreen()));
        }
      ],
    ];
    return GridViewsItems(contentList: contentList,title: "Flowers",);
  }
}
