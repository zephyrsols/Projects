import 'package:flutter/material.dart';
import 'package:kids/screens/itemViewScreens/ItemScreen.dart';

import '../../utils/ItemContainer.dart';

class BirdsScreen extends StatefulWidget {
  const BirdsScreen({super.key});

  @override
  State<BirdsScreen> createState() => _BirdsScreenState();
}

class _BirdsScreenState extends State<BirdsScreen> {
  @override
  Widget build(BuildContext context) {
    List contentList = [
      [
        "ARARAT",
        "assets/svg/birds/ararat.svg",
        () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => ItemScreen(
                      title: "ARARAT",
                      svgPath: "assets/svg/birds/ararat.svg")));
        }
      ],
      [
        "BALD EAGLE",
        "assets/svg/birds/bald_eagle.svg",
        () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => ItemScreen(
                      title: "BALD EAGLE",
                      svgPath: "assets/svg/birds/bald_eagle.svg")));
        }
      ],
      [
        "BEEHIMMING BIRD",
        "assets/svg/birds/beehimming_bird.svg",
        () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => ItemScreen(
                      title: "BEEHIMMING BIRD",
                      svgPath: "assets/svg/birds/beehimming_bird.svg")));
        }
      ],
      [
        "CARDINAL",
        "assets/svg/birds/cardinal.svg",
        () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => ItemScreen(
                      title: "CARDINAL",
                      svgPath: "assets/svg/birds/cardinal.svg")));
        }
      ],
      [
        "COMB",
        "assets/svg/birds/comb.svg",
        () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => ItemScreen(
                      title: "COMB", svgPath: "assets/svg/birds/comb.svg")));
        }
      ],
      [
        "COMMON STARLING",
        "assets/svg/birds/common_starling.svg",
        () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => ItemScreen(
                      title: "COMMON STARLING", svgPath: "assets/svg/birds/common_starling.svg")));
        }
      ],
      [
        "EURASIAN HOPE",
        "assets/svg/birds/eurasian_hope.svg",
        () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => ItemScreen(
                      title: "EURASIAN HOPE", svgPath: "assets/svg/birds/eurasian_hope.svg")));
        }
      ],
      [
        "EUROPEAN GOLDFINCH",
        "assets/svg/birds/european_goldfinch.svg",
        () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => ItemScreen(
                      title: "EUROPEAN GOLDFINCH", svgPath: "assets/svg/birds/european_goldfinch.svg")));
        }
      ],
      [
        "EXOTIC",
        "assets/svg/birds/exotic.svg",
        () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => ItemScreen(
                      title: "EXOTIC", svgPath: "assets/svg/birds/exotic.svg")));
        }
      ],
      [
        "GOLDEN PHEASANT",
        "assets/svg/birds/golden_pheasant.svg",
        () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => ItemScreen(
                      title: "GOLDEN PHEASANT", svgPath: "assets/svg/birds/golden_pheasant.svg")));
        }
      ],
      [
        "HOMING PIGEON",
        "assets/svg/birds/homing_pigeon.svg",
        () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => ItemScreen(
                      title: "HOMING PIGEON", svgPath: "assets/svg/birds/homing_pigeon.svg")));
        }
      ],
      [
        "HAWK",
        "assets/svg/birds/hawk.svg",
        () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => ItemScreen(
                      title: "HAWK", svgPath: "assets/svg/birds/hawk.svg")));
        }
      ],
    ];
    return GridViewsItems(
      contentList: contentList,
      title: "Birds",
    );
  }
}
