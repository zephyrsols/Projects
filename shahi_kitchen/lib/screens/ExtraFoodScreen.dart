import 'package:flutter/material.dart';
import 'package:zoom_tap_animation/zoom_tap_animation.dart';

import '../util/ExtraFoodList.dart';

class ExtraFoodScreen extends StatefulWidget {
  const ExtraFoodScreen({super.key});

  @override
  State<ExtraFoodScreen> createState() => _ExtraFoodScreenState();
}

class _ExtraFoodScreenState extends State<ExtraFoodScreen> {
  ExtraFoodList extraFoodList = ExtraFoodList();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(bottom: 70),
        child: ListView.builder(itemCount: extraFoodList.list.length, itemBuilder: (context, index) {
          return Card(
              color: Colors.white,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Text(extraFoodList.list[index][0],
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 20,
                            fontWeight: FontWeight.bold)),
                    Spacer(),
                    Padding(
                      padding: const EdgeInsets.only(top: 5),
                      child: Text(
                        "Rs",
                        style: TextStyle(
                            color: Colors.redAccent,
                            fontSize: 13,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    Text(extraFoodList.list[index][1],
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 20,
                            fontWeight: FontWeight.bold)),
                    Spacer(),
                    Padding(
                      padding: const EdgeInsets.only(right: 10),
                      child: GestureDetector(
                        onTap: () {
                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                              content: Text(extraFoodList.list[index][0])));
                        },
                        child: const ZoomTapAnimation(
                          child: Icon(
                            Icons.add_box,
                            color: Colors.black,
                            size: 30,
                          ),
                        ),
                      ),
                    )

                  ],
                ),
              ),
            )
          ;
        }),
      ),
    );
  }
}
