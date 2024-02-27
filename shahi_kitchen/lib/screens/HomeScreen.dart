import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:zoom_tap_animation/zoom_tap_animation.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'BurgerScreen.dart';
import 'DealsScreen.dart';
import 'ExtraFoodScreen.dart';
import 'PizzaScreen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Color pizzaOutlineClr = Colors.yellowAccent;
  Color burgerOutlineClr = Colors.white;
  Color dealsOutlineClr = Colors.white;
  Color extraOutlineClr = Colors.white;

  double homeHeight = 40;
  double cartHeight = 30;
  double userHeight = 30;

  int index = 0;

  List screens = [
    const PizzaScreen(),
    const BurgerScreen(),
    const DealsScreen(),
    const ExtraFoodScreen()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        leadingWidth: 200,
        leading: const Padding(
          padding: EdgeInsets.only(left: 20),
          child: Row(
            children: [
              Text(
                "I want to ",
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w300,
                    color: Colors.white),
              ),
              Text(
                "Eat",
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w800,
                    decoration: TextDecoration.underline,
                    color: Colors.white),
              )
            ],
          ),
        ),
      ),
      body: Stack(
        fit: StackFit.expand,
        children: [
          Padding(
            padding: const EdgeInsets.all(18.0),
            child: Column(
              children: [
                Row(
                  children: [
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          index = 0;
                          pizzaOutlineClr = Colors.yellowAccent;
                          burgerOutlineClr = Colors.white;
                          dealsOutlineClr = Colors.white;
                          extraOutlineClr = Colors.white;
                        });
                      },
                      child: itemContainer(
                          pizzaOutlineClr, "assets/svg/pizza.svg"),
                    ),
                    const Spacer(),
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          index = 1;
                          pizzaOutlineClr = Colors.white;
                          burgerOutlineClr = Colors.yellowAccent;
                          dealsOutlineClr = Colors.white;
                          extraOutlineClr = Colors.white;
                        });
                      },
                      child: itemContainer(
                          burgerOutlineClr, "assets/svg/burger.svg"),
                    ),
                    const Spacer(),
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          index = 2;
                          pizzaOutlineClr = Colors.white;
                          burgerOutlineClr = Colors.white;
                          dealsOutlineClr = Colors.yellowAccent;
                          extraOutlineClr = Colors.white;
                        });
                      },
                      child: itemContainer(
                          dealsOutlineClr, "assets/svg/fries_burger.svg"),
                    ),
                    const Spacer(),
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          index = 3;
                          pizzaOutlineClr = Colors.white;
                          burgerOutlineClr = Colors.white;
                          dealsOutlineClr = Colors.white;
                          extraOutlineClr = Colors.yellowAccent;
                        });
                      },
                      child: itemContainer(
                          extraOutlineClr, "assets/svg/nuggets.svg"),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 5,
                ),
                Expanded(
                    child: AnimatedSwitcher(
                  duration: const Duration(milliseconds: 500),
                  transitionBuilder:
                      (Widget child, Animation<double> animation) {
                    return ScaleTransition(scale: animation, child: child);
                  },
                  child: screens[index],
                )),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget itemContainer(Color color, String svgPicture) {
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(width: 1, color: color)),
      child: ZoomTapAnimation(
        child: SvgPicture.asset(
          svgPicture,
          height: 50,
          width: 50,
        ),
      ),
    );
  }
}
