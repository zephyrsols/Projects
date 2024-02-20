import 'package:flutter/material.dart';

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
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => const MainScreen()));
        }
      ],
      [
        "CIRCLE",
        "assets/svg/shapes/circle.svg",
        () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => const MainScreen()));
        }
      ],
      [
        "CRESCENT",
        "assets/svg/shapes/crescent.svg",
        () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => const MainScreen()));
        }
      ],
      [
        "CROSS",
        "assets/svg/shapes/cross.svg",
        () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => const MainScreen()));
        }
      ],
      [
        "CUBE",
        "assets/svg/shapes/cube.svg",
        () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => const MainScreen()));
        }
      ],
      [
        "CYLINDER",
        "assets/svg/shapes/cylinder.svg",
        () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => const MainScreen()));
        }
      ],
      [
        "HEXAGON",
        "assets/svg/shapes/hexagon.svg",
        () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => const MainScreen()));
        }
      ],
      [
        "OVAL",
        "assets/svg/shapes/oval.svg",
        () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => const MainScreen()));
        }
      ],
      [
        "PARALLELOGRAM",
        "assets/svg/shapes/parallelogram.svg",
        () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => const MainScreen()));
        }
      ],
      [
        "PENTAGON",
        "assets/svg/shapes/pentagon.svg",
        () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => const MainScreen()));
        }
      ],
      [
        "RHOMBUS",
        "assets/svg/shapes/rhombus.svg",
        () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => const MainScreen()));
        }
      ],
      [
        "SQUARE",
        "assets/svg/shapes/square.svg",
        () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => const MainScreen()));
        }
      ],
      [
        "STAR",
        "assets/svg/shapes/star.svg",
        () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => const MainScreen()));
        }
      ],
      [
        "TRIANGLE",
        "assets/svg/shapes/triangle.svg",
        () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => const MainScreen()));
        }
      ],
    ];
    return GridViewsItems(
      contentList: contentList,
      title: "Shapes",
    );
  }
}
