import 'package:flutter/material.dart';

import '../../utils/ItemContainer.dart';
import '../mainScreens/MainScreen.dart';

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
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => const MainScreen()));
        }
      ],
      [
        "BALD EAGLE",
        "assets/svg/birds/bald_eagle.svg",
            () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => const MainScreen()));
        }
      ],
      [
        "BEEHIMMING BIRD",
        "assets/svg/birds/beehimming_bird.svg",
            () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => const MainScreen()));
        }
      ],
      [
        "CARDINAL",
        "assets/svg/birds/cardinal.svg",
            () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => const MainScreen()));
        }
      ],
      [
        "COMB",
        "assets/svg/birds/comb.svg",
            () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => const MainScreen()));
        }
      ],
      [
        "COMMON STARLING",
        "assets/svg/birds/common_starling.svg",
            () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => const MainScreen()));
        }
      ],
      [
        "EURASIAN HOPE",
        "assets/svg/birds/eurasian_hope.svg",
            () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => const MainScreen()));
        }
      ],
      [
        "EUROPEAN GOLDFINCH",
        "assets/svg/birds/european_goldfinch.svg",
            () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => const MainScreen()));
        }
      ],
      [
        "EXOTIC",
        "assets/svg/birds/exotic.svg",
            () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => const MainScreen()));
        }
      ],
      [
        "GOLDEN PHEASANT",
        "assets/svg/birds/golden_pheasant.svg",
            () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => const MainScreen()));
        }
      ],
      [
        "HOMING PIGEON",
        "assets/svg/birds/homing_pigeon.svg",
            () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => const MainScreen()));
        }
      ],
      [
        "HAWK",
        "assets/svg/birds/hawk.svg",
            () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => const MainScreen()));
        }
      ],
    ];
    return GridViewsItems(
      contentList: contentList,
      title: "Birds",
    );
  }
}
