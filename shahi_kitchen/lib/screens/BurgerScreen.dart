import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:zoom_tap_animation/zoom_tap_animation.dart';

import '../cartDatabase/CartDatabase.dart';

class BurgerScreen extends StatefulWidget {
  const BurgerScreen({super.key});

  @override
  State<BurgerScreen> createState() => _BurgerScreenState();
}

class _BurgerScreenState extends State<BurgerScreen> {
  List list = [
    ["Zinger", "299", "assets/png/burger/burger_1.png"],
    ["BBQ", "250", "assets/png/burger/burger_2.png"],
    ["Tower", "399", "assets/png/burger/burger_3.png"],
    ["Shooter", "180", "assets/png/burger/burger_4.png"],
    ["Chicken\nPatty", " 199", "assets/png/burger/burger_5.png"],
    ["Double Patty", "350", "assets/png/burger/burger_6.png"],
    ["Double Z.", "430", "assets/png/burger/burger_7.png"]
  ];

  CartDatabase cartDatabase = CartDatabase();
  final _myBox = Hive.box("cart");

  @override
  void initState() {
    // TODO: implement initState
    if (_myBox.get("ITEMS") != null) {
      setState(() {
        cartDatabase.loadData();
      });
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(left: 10, bottom: 0),
        child: GridView.builder(
          padding: EdgeInsets.only(bottom: 45),
          itemCount: list.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
              childAspectRatio: .6),
          itemBuilder: (context, index) {
            return Stack(
              children: [
                Positioned(
                  top: 10,
                  child: Container(
                    width: 130,
                    padding: EdgeInsets.only(
                        top: 90, bottom: 10, right: 10, left: 10),
                    margin: EdgeInsets.only(top: 20),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                            topRight: Radius.circular(100),
                            topLeft: Radius.circular(100),
                            bottomRight: Radius.circular(50),
                            bottomLeft: Radius.circular(50))),
                    child: Column(
                      children: [
                        Text(
                          list[index][0] + "\nBurger",
                          style: const TextStyle(
                              color: Colors.black,
                              fontSize: 16,
                              fontWeight: FontWeight.w700),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Center(
                          child: Text(
                            list[index][1],
                            style: const TextStyle(
                              color: Colors.redAccent,
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              cartDatabase.items.add([
                                "${list[index][0]} Burger",
                                "${list[index][1]}",
                                ""
                              ]);
                              cartDatabase.updateDatabase();
                            });
                            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                                backgroundColor: Colors.transparent,
                                content: AwesomeSnackbarContent(
                                  title: list[index][0] + "Burger",
                                  message:
                                      "You are ordering ${list[index][0]} Burger with price of ${list[index][1]}",
                                  contentType: ContentType.success,
                                )));
                          },
                          child: const ZoomTapAnimation(
                            child: Icon(
                              Icons.add_box,
                              color: Colors.black,
                              size: 30,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Positioned(
                  left: -2,
                  top: -10,
                  child: Image.asset(
                    list[index][2],
                    height: 140,
                    width: 140,
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
