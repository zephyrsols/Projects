import 'package:flutter/material.dart';

import '../../utils/ItemContainer.dart';
import '../mainScreens/MainScreen.dart';

class AlphabetsScreen extends StatefulWidget {
  const AlphabetsScreen({super.key});

  @override
  State<AlphabetsScreen> createState() => _AlphabetsScreenState();
}

class _AlphabetsScreenState extends State<AlphabetsScreen> {
  @override
  Widget build(BuildContext context) {
    List contentList = [
      [
        "A",
        "assets/svg/listen_and_guess/alphabet.svg",
            () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => const MainScreen()));
        }
      ],
    ];
    return GridViewsItems(contentList: contentList,title: "Alphabets",);  }
}
