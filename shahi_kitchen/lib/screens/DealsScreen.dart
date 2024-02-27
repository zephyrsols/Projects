import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:zoom_tap_animation/zoom_tap_animation.dart';

import '../cartDatabase/CartDatabase.dart';
import '../util/DealsList.dart';

class DealsScreen extends StatefulWidget {
  const DealsScreen({super.key});

  @override
  State<DealsScreen> createState() => _DealsScreenState();
}

class _DealsScreenState extends State<DealsScreen> {
  DealsList dealsList = DealsList();
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
      body: Container(
        child: ListView.builder(
            padding: EdgeInsets.only(bottom: 55),
            itemCount: dealsList.list.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.only(top: 10),
                child: Card(
                  color: Colors.white,
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Image.asset(
                            dealsList.list[index][1],
                            height: 100,
                            width: 100,
                          ),
                          Spacer(),
                          Padding(
                            padding: const EdgeInsets.only(bottom: 50),
                            child: Container(
                              decoration: BoxDecoration(
                                  color: Colors.red,
                                  borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(20),
                                      bottomRight: Radius.circular(20))),
                              padding: EdgeInsets.all(5),
                              child: Text(dealsList.list[index][3],
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold)),
                            ),
                          ),
                          Spacer(),
                          Padding(
                            padding: const EdgeInsets.only(top: 10),
                            child: Text(
                              "Rs",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 13,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(right: 10),
                            child: Text(dealsList.list[index][2],
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 25,
                                    fontWeight: FontWeight.bold)),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 10),
                            child: Text(dealsList.list[index][0],
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold)),
                          ),
                          Spacer(),
                          Padding(
                            padding: const EdgeInsets.only(right: 10),
                            child: GestureDetector(
                              onTap: () {
                                setState(() {
                                  cartDatabase.items.add([
                                    "${dealsList.list[index][3]} Deal",
                                    "${dealsList.list[index][2]}",
                                    ""
                                  ]);
                                  cartDatabase.updateDatabase();
                                });
                                ScaffoldMessenger.of(context)
                                    .showSnackBar(SnackBar(
                                        backgroundColor: Colors.transparent,
                                        content: AwesomeSnackbarContent(
                                          title: dealsList.list[index][3] +
                                              " Deal",
                                          message:
                                              "You are ordering ${dealsList.list[index][3]} Deal with price of ${dealsList.list[index][2]}",
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
              );
            }),
      ),
    );
  }
}
