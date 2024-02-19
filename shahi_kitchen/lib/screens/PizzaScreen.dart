import 'package:flutter/material.dart';
import 'package:zoom_tap_animation/zoom_tap_animation.dart';

class PizzaScreen extends StatefulWidget {
  const PizzaScreen({super.key});

  @override
  State<PizzaScreen> createState() => _PizzaScreenState();
}

class _PizzaScreenState extends State<PizzaScreen> {
  String tikkaP = "Small";
  String tikkaPPrice = "499 Rs";
  Color smallP = Colors.redAccent;
  Color mediumP = Colors.white;
  Color largeP = Colors.white;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          pizzaContainer("assets/png/pizza/pizza_1.png", "Tikka", "449",
              "850", "1299"),
          SizedBox(
            height: 10,
          ),
          pizzaContainer("assets/png/pizza/pizza_2.png", "Fajita", "449",
              "850", "1299"),
        ],
      ),
    );
  }

  Widget pizzaContainer(String picture, String pName, String smallPrice,
      String mediumPrice, String largePrice) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15), color: Colors.white),
      padding: const EdgeInsets.all(5),
      child: Row(
        children: [
          Image.asset(
            picture,
            height: 100,
            width: 100,
          ),
          const SizedBox(
            width: 10,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  pName+" Pizza",
                  style: const TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                      fontWeight: FontWeight.w700),
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          tikkaP = "Small";
                          tikkaPPrice = smallPrice + " Rs";
                          smallP = Colors.redAccent;
                          mediumP = Colors.white;
                          largeP = Colors.white;
                        });
                      },
                      child: Container(
                          decoration: BoxDecoration(
                            border: Border.all(width: 1, color: smallP),
                          ),
                          padding: const EdgeInsets.all(5),
                          child: ZoomTapAnimation(
                            child: ZoomTapAnimation(
                              child: const Text(
                                "Small",
                                style: TextStyle(
                                    fontSize: 12,
                                    fontWeight: FontWeight.w200,
                                    color: Colors.black),
                              ),
                            ),
                          )),
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          tikkaP = "Medium";
                          tikkaPPrice = mediumPrice + " Rs";
                          smallP = Colors.white;
                          mediumP = Colors.redAccent;
                          largeP = Colors.white;
                        });
                      },
                      child: Container(
                          decoration: BoxDecoration(
                            border: Border.all(width: 1, color: mediumP),
                          ),
                          padding: const EdgeInsets.all(5),
                          child: ZoomTapAnimation(
                            child: const Text(
                              "Medium",
                              style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w200,
                                  color: Colors.black),
                            ),
                          )),
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          tikkaP = "Large";
                          tikkaPPrice = largePrice + " Rs";
                          smallP = Colors.white;
                          mediumP = Colors.white;
                          largeP = Colors.redAccent;
                        });
                      },
                      child: Container(
                          decoration: BoxDecoration(
                            border: Border.all(width: 1, color: largeP),
                          ),
                          padding: const EdgeInsets.all(5),
                          child: ZoomTapAnimation(
                            child: const Text(
                              "Large",
                              style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w200,
                                  color: Colors.black),
                            ),
                          )),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 5,
                ),
                Row(
                  children: [
                    Text(
                      tikkaPPrice,
                      style: TextStyle(color: Colors.black),
                    ),
                    Spacer(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        GestureDetector(
                          onTap: () {
                            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                                content: Text(
                                    pName +" " + tikkaP + " " + tikkaPPrice)));
                          },
                          child: ZoomTapAnimation(
                            child: Icon(
                              Icons.add_box,
                              color: Colors.black,
                              size: 35,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
