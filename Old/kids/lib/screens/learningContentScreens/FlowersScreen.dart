import 'package:flutter/material.dart';
import 'package:kids/screens/itemViewScreens/ItemScreen.dart';

import '../../utils/ItemContainer.dart';

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
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => ItemScreen(
                      title: "BLUEBELL",
                      svgPath: "assets/svg/flowers/bluebell.svg")));
        }
      ],
      [
        "PANSY",
        "assets/svg/flowers/pansy.svg",
        () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => ItemScreen(
                  title: "PANSY",
                  svgPath: "assets/svg/flowers/pansy.svg")));
        }
      ],
      [
        "SUNFLOWER",
        "assets/svg/flowers/sunflower.svg",
        () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => ItemScreen(
                  title: "SUNFLOWER",
                  svgPath: "assets/svg/flowers/sunflower.svg")));
        }
      ],
      [
        "HIBISCUS",
        "assets/svg/flowers/hibiscus.svg",
        () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => ItemScreen(
                  title: "HIBISCUS",
                  svgPath: "assets/svg/flowers/hibiscus.svg")));
        }
      ],
      [
        "COURGETTE",
        "assets/svg/flowers/courgette.svg",
        () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => ItemScreen(
                  title: "COURGETTE",
                  svgPath: "assets/svg/flowers/courgette.svg")));
        }
      ],
      [
        "LILAC",
        "assets/svg/flowers/lilac.svg",
        () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => ItemScreen(
                  title: "LILAC",
                  svgPath: "assets/svg/flowers/lilac.svg")));
        }
      ],
      [
        "NASTURTIUM",
        "assets/svg/flowers/nasturtium.svg",
        () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => ItemScreen(
                  title: "NASTURTIUM",
                  svgPath: "assets/svg/flowers/nasturtium.svg")));
        }
      ],
      [
        "PEA",
        "assets/svg/flowers/pea.svg",
        () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => ItemScreen(
                  title: "PEA",
                  svgPath: "assets/svg/flowers/pea.svg")));
        }
      ],
      [
        "GENISTA",
        "assets/svg/flowers/genista.svg",
        () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => ItemScreen(
                  title: "GENISTA",
                  svgPath: "assets/svg/flowers/genista.svg")));
        }
      ],
      [
        "ANDROMEDA",
        "assets/svg/flowers/andromeda.svg",
        () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => ItemScreen(
                  title: "ANDROMEDA",
                  svgPath: "assets/svg/flowers/andromeda.svg")));
        }
      ],
      [
        "CONSTANTIA",
        "assets/svg/flowers/constantia.svg",
        () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => ItemScreen(
                  title: "CONSTANTIA",
                  svgPath: "assets/svg/flowers/constantia.svg")));
        }
      ],
      [
        "CAMPANULA",
        "assets/svg/flowers/campanula.svg",
        () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => ItemScreen(
                  title: "CAMPANULA",
                  svgPath: "assets/svg/flowers/campanula.svg")));
        }
      ],
    ];
    return GridViewsItems(
      contentList: contentList,
      title: "Flowers",
    );
  }
}
