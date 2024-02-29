import 'package:flutter/material.dart';
import 'package:kids/screens/itemViewScreens/ItemScreen.dart';

import '../../utils/ItemContainer.dart';
import '../mainScreens/MainScreen.dart';

class ShapesScreen extends StatefulWidget {
  const ShapesScreen({super.key});

  @override
  State<ShapesScreen> createState() => _ShapesScreenState();
}

class _ShapesScreenState extends State<ShapesScreen> {
  @override
  Widget build(BuildContext context) {
    List contentList = [
      [
        "ARROW",
        "assets/svg/shapes/arrow.svg",
        () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => ItemScreen(
                      title: "ARROW", svgPath: "assets/svg/shapes/arrow.svg")));
        }
      ],
      [
        "CIRCLE",
        "assets/svg/shapes/circle.svg",
        () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => ItemScreen(
                      title: "CIRCLE", svgPath: "assets/svg/shapes/circle.svg")));
        }
      ],
      [
        "CRESCENT",
        "assets/svg/shapes/crescent.svg",
        () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => ItemScreen(
                      title: "CRESCENT", svgPath: "assets/svg/shapes/crescent.svg")));
        }
      ],
      [
        "CROSS",
        "assets/svg/shapes/cross.svg",
        () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => ItemScreen(
                      title: "CROSS", svgPath: "assets/svg/shapes/cross.svg")));
        }
      ],
      [
        "CUBE",
        "assets/svg/shapes/cube.svg",
        () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => ItemScreen(
                      title: "CUBE", svgPath: "assets/svg/shapes/cube.svg")));
        }
      ],
      [
        "CYLINDER",
        "assets/svg/shapes/cylinder.svg",
        () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => ItemScreen(
                      title: "CYLINDER", svgPath: "assets/svg/shapes/cylinder.svg")));
        }
      ],
      [
        "HEXAGON",
        "assets/svg/shapes/hexagon.svg",
        () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => ItemScreen(
                      title: "HEXAGON", svgPath: "assets/svg/shapes/hexagon.svg")));
        }
      ],
      [
        "OVAL",
        "assets/svg/shapes/oval.svg",
        () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => ItemScreen(
                      title: "OVAL", svgPath: "assets/svg/shapes/oval.svg")));
        }
      ],
      [
        "PARALLELOGRAM",
        "assets/svg/shapes/parallelogram.svg",
        () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => ItemScreen(
                      title: "PARALLELOGRAM", svgPath: "assets/svg/shapes/parallelogram.svg")));
        }
      ],
      [
        "PENTAGON",
        "assets/svg/shapes/pentagon.svg",
        () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => ItemScreen(
                      title: "PENTAGON", svgPath: "assets/svg/shapes/pentagon.svg")));
        }
      ],
      [
        "RHOMBUS",
        "assets/svg/shapes/rhombus.svg",
        () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => ItemScreen(
                      title: "RHOMBUS", svgPath: "assets/svg/shapes/rhombus.svg")));
        }
      ],
      [
        "SQUARE",
        "assets/svg/shapes/square.svg",
        () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => ItemScreen(
                      title: "SQUARE", svgPath: "assets/svg/shapes/square.svg")));
        }
      ],
      [
        "STAR",
        "assets/svg/shapes/star.svg",
        () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => ItemScreen(
                      title: "STAR", svgPath: "assets/svg/shapes/star.svg")));
        }
      ],
      [
        "TRIANGLE",
        "assets/svg/shapes/triangle.svg",
        () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => ItemScreen(
                      title: "TRIANGLE", svgPath: "assets/svg/shapes/triangle.svg")));
        }
      ],
    ];
    return GridViewsItems(
      contentList: contentList,
      title: "Shapes",
    );
  }
}
