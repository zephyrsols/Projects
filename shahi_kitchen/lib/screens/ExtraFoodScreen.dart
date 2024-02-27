import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:zoom_tap_animation/zoom_tap_animation.dart';

import '../cartDatabase/CartDatabase.dart';
import '../util/ExtraFoodList.dart';

class ExtraFoodScreen extends StatefulWidget {
  const ExtraFoodScreen({super.key});

  @override
  State<ExtraFoodScreen> createState() => _ExtraFoodScreenState();
}

class _ExtraFoodScreenState extends State<ExtraFoodScreen> {
  ExtraFoodList extraFoodList = ExtraFoodList();
  var amount = 0;

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
      body: ListView.builder(
          padding: EdgeInsets.only(bottom: 55),
          itemCount: extraFoodList.list.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.only(top: 10),
              child: Card(
                color: Colors.white,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(extraFoodList.list[index][0],
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold)),
                          Padding(
                            padding: const EdgeInsets.only(top: 10),
                            child: Row(
                              children: [
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
                              ],
                            ),
                          ),
                        ],
                      ),
                      Spacer(),
                      Column(
                        children: [
                          Row(
                            children: [
                              GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      if (extraFoodList.list[index][2] != 1) {
                                        extraFoodList.list[index][2] =
                                            --extraFoodList.list[index][2];
                                        extraFoodList.list[index][1] =
                                            (int.parse(extraFoodList.list[index]
                                                        [3]) *
                                                    extraFoodList.list[index]
                                                        [2])
                                                .toString();
                                      }
                                    });
                                  },
                                  child: SizedBox(
                                    height: 30,
                                    width: 25,
                                    child: SvgPicture.asset(
                                      "assets/svg/minus.svg",
                                    ),
                                  )),
                              SizedBox(
                                width: 10,
                              ),
                              Text(
                                extraFoodList.list[index][2].toString(),
                                style: TextStyle(color: Colors.black),
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      extraFoodList.list[index][2] =
                                          ++extraFoodList.list[index][2];
                                      extraFoodList.list[index][1] = (int.parse(
                                                  extraFoodList.list[index]
                                                      [3]) *
                                              extraFoodList.list[index][2])
                                          .toString();
                                    });
                                  },
                                  child: SizedBox(
                                    height: 25,
                                    width: 25,
                                    child: SvgPicture.asset(
                                      "assets/svg/plus.svg",
                                    ),
                                  )),
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.only(right: 10, top: 10),
                            child: GestureDetector(
                              onTap: () {
                                setState(() {
                                  cartDatabase.items.add([
                                    "${extraFoodList.list[index][0]}",
                                    "${extraFoodList.list[index][1]}",
                                    "(${extraFoodList.list[index][2]})",
                                  ]);
                                  cartDatabase.updateDatabase();
                                });
                                ScaffoldMessenger.of(context)
                                    .showSnackBar(SnackBar(
                                        backgroundColor: Colors.transparent,
                                        content: AwesomeSnackbarContent(
                                          title: extraFoodList.list[index][0],
                                          message:
                                              "You are ordering ${extraFoodList.list[index][0]} with price of ${extraFoodList.list[index][1]}",
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
                          )
                        ],
                      )
                    ],
                  ),
                ),
              ),
            );
          }),
    );
  }
}
