import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shahi_kitchen/screens/PizzaScreen.dart';
import 'package:zoom_tap_animation/zoom_tap_animation.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  Color pizzaOutlineClr = Colors.yellowAccent;
  Color burgerOutlineClr = Colors.white;
  Color dealsOutlineClr = Colors.white;
  Color extraOutlineClr = Colors.white;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 25),
            child: SvgPicture.asset(
              "assets/svg/user.svg",
              height: 30,
              width: 30,
            ),
          )
        ],
      ),
      body: Stack(
        fit: StackFit.expand,
        children: [
          Padding(
            padding: const EdgeInsets.all(18.0),
            child: Column(
              children: [
                const Row(
                  children: [
                    Text(
                      "I want to ",
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.w300),
                    ),
                    Text(
                      "Eat",
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w800,
                          decoration: TextDecoration.underline),
                    )
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 20),
                  child: Row(
                    children: [
                      GestureDetector(
                        onTap: () {
                          setState(() {
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
                ),
                SizedBox(
                  height: 30,
                ),
                PizzaScreen(),
              ],
            ),
          )
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
