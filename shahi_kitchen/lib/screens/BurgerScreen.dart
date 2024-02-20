import 'package:flutter/material.dart';
import 'package:zoom_tap_animation/zoom_tap_animation.dart';

class BurgerScreen extends StatefulWidget {
  const BurgerScreen({super.key});

  @override
  State<BurgerScreen> createState() => _BurgerScreenState();
}

class _BurgerScreenState extends State<BurgerScreen> {
  List list = [
    ["Zinger\nBurger", "299"],
    ["BBQ\nBurger", "250"],
    ["Tower\nBurger", "399"],
    ["Shooter\nBurger", "180"],
    ["Chicken\nPatty Burger", " 199"],
    ["Double\nPatty Burger", "350"],
    ["Double\nZ.Burger", "430"]
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(left: 10),
        child: GridView.builder(
          itemCount: list.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
              childAspectRatio: .6),
          itemBuilder: (context,index){
            return Expanded(
              child: Stack(
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
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            list[index][0],
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
                                  fontWeight: FontWeight.bold,),
                            ),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          GestureDetector(
                            onTap: () {
                              ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(content: Text("Burger")));
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
                    left: 1.5,
                    top: -10,
                    child: Image.asset(
                      "assets/png/burger/burger_1.png",
                      height: 150,
                      width: 150,
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),

    );
  }
}
