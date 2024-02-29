import 'package:flutter/material.dart';

import '../../utils/ItemContainer.dart';
import '../itemViewScreens/ItemScreen.dart';
import '../mainScreens/MainScreen.dart';

class ColorsScreen extends StatefulWidget {
  const ColorsScreen({super.key});

  @override
  State<ColorsScreen> createState() => _ColorsScreenState();
}

class _ColorsScreenState extends State<ColorsScreen> {
  @override
  Widget build(BuildContext context) {
    List contentList = [
      [
        "AQUA",
        "assets/svg/colors/aqua.svg",
        () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => ItemScreen(
                  title: "AQUA",
                  svgPath: "assets/svg/colors/aqua.svg")));
        }
      ],
      [
        "AZURE RADIANCE",
        "assets/svg/colors/azure_radiance.svg",
        () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => ItemScreen(
                      title: "AZURE RADIANCE",
                      svgPath: "assets/svg/colors/azure_radiance.svg")));
        }
      ],
      [
        "BLUE",
        "assets/svg/colors/blue.svg",
        () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => ItemScreen(
                  title: "BLUE",
                  svgPath: "assets/svg/colors/blue.svg")));
        }
      ],
      [
        "CHARTREUSE",
        "assets/svg/colors/chartreuse.svg",
        () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => ItemScreen(
                  title: "CHARTREUSE",
                  svgPath: "assets/svg/colors/chartreuse.svg")));
        }
      ],
      [
        "ELECTRIC VOILET",
        "assets/svg/colors/electric_voilet.svg",
        () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => ItemScreen(
                  title: "ELECTRIC VOILET",
                  svgPath: "assets/svg/colors/electric_voilet.svg")));
        }
      ],
      [
        "GREEN",
        "assets/svg/colors/green.svg",
        () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => ItemScreen(
                  title: "GREEN",
                  svgPath: "assets/svg/colors/green.svg")));
        }
      ],
      [
        "MAGENTA",
        "assets/svg/colors/magenta.svg",
        () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => ItemScreen(
                  title: "MAGENTA",
                  svgPath: "assets/svg/colors/magenta.svg")));
        }
      ],
      [
        "ORANGE",
        "assets/svg/colors/orange.svg",
        () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => ItemScreen(
                  title: "ORANGE",
                  svgPath: "assets/svg/colors/orange.svg")));
        }
      ],
      [
        "RED",
        "assets/svg/colors/red.svg",
        () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => ItemScreen(
                  title: "RED",
                  svgPath: "assets/svg/colors/red.svg")));
        }
      ],
      [
        "ROSE",
        "assets/svg/colors/rose.svg",
        () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => ItemScreen(
                  title: "ROSE",
                  svgPath: "assets/svg/colors/rose.svg")));
        }
      ],
      [
        "SPRING GREEN",
        "assets/svg/colors/spring_green.svg",
        () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => ItemScreen(
                  title: "SPRING GREEN",
                  svgPath: "assets/svg/colors/spring_green.svg")));
        }
      ],
      [
        "YELLOW",
        "assets/svg/colors/yellow.svg",
        () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => ItemScreen(
                  title: "YELLOW",
                  svgPath: "assets/svg/colors/yellow.svg")));
        }
      ],
    ];
    return GridViewsItems(
      contentList: contentList,
      title: "Colors",
    );
  }
}
