import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:shahi_kitchen/cartDatabase/CartDatabase.dart';
import 'package:shahi_kitchen/util/PizzaList.dart';
import 'package:zoom_tap_animation/zoom_tap_animation.dart';

class PizzaScreen extends StatefulWidget {
  const PizzaScreen({super.key});

  @override
  State<PizzaScreen> createState() => _PizzaScreenState();
}

class _PizzaScreenState extends State<PizzaScreen> {
  //title, picture, size, default price, small price, medium price, large price, small border color, medium border color, large border color
  PizzaList pizzaList = PizzaList();
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
        padding: const EdgeInsets.fromLTRB(8, 8, 8, 0),
        child: ListView.builder(
          padding: EdgeInsets.only(bottom: 40),
          itemBuilder: (context, index) {
            return Container(
              margin: const EdgeInsets.only(bottom: 20),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15), color: Colors.white),
              padding: const EdgeInsets.all(5),
              child: Row(
                children: [
                  Image.asset(
                    pizzaList.list[index][1],
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
                          pizzaList.list[index][0] + " Pizza",
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
                                  pizzaList.list[index][2] = "Small";
                                  pizzaList.list[index][3] =
                                      pizzaList.list[index][4];
                                  pizzaList.list[index][7] = Colors.redAccent;
                                  pizzaList.list[index][8] = Colors.white;
                                  pizzaList.list[index][9] = Colors.white;
                                });
                              },
                              child: Container(
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                        width: 1,
                                        color: pizzaList.list[index][7]),
                                  ),
                                  padding: const EdgeInsets.all(5),
                                  child: const ZoomTapAnimation(
                                    child: ZoomTapAnimation(
                                      child: Text(
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
                                  pizzaList.list[index][2] = "Medium";
                                  pizzaList.list[index][3] =
                                      pizzaList.list[index][5];
                                  pizzaList.list[index][7] = Colors.white;
                                  pizzaList.list[index][8] = Colors.redAccent;
                                  pizzaList.list[index][9] = Colors.white;
                                });
                              },
                              child: Container(
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                        width: 1,
                                        color: pizzaList.list[index][8]),
                                  ),
                                  padding: const EdgeInsets.all(5),
                                  child: const ZoomTapAnimation(
                                    child: Text(
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
                                  pizzaList.list[index][2] = "Large";
                                  pizzaList.list[index][3] =
                                      pizzaList.list[index][6];
                                  pizzaList.list[index][7] = Colors.white;
                                  pizzaList.list[index][8] = Colors.white;
                                  pizzaList.list[index][9] = Colors.redAccent;
                                });
                              },
                              child: Container(
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                        width: 1,
                                        color: pizzaList.list[index][9]),
                                  ),
                                  padding: const EdgeInsets.all(5),
                                  child: const ZoomTapAnimation(
                                    child: Text(
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
                              pizzaList.list[index][3] + " Rs",
                              style: const TextStyle(
                                  color: Colors.redAccent,
                                  fontWeight: FontWeight.bold),
                            ),
                            const Spacer(),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      cartDatabase.items.add([
                                        "${pizzaList.list[index][0]} Pizza",
                                        "${pizzaList.list[index][3]}",
                                        "(${pizzaList.list[index][2]})"
                                      ]);
                                      cartDatabase.updateDatabase();
                                    });
                                    ScaffoldMessenger.of(context)
                                        .showSnackBar(SnackBar(
                                            backgroundColor: Colors.transparent,
                                            content: AwesomeSnackbarContent(
                                              title: pizzaList.list[index][0],
                                              message:
                                                  "You are ordering ${pizzaList.list[index][0]} ${pizzaList.list[index][2]} with price of ${pizzaList.list[index][3]}",
                                              contentType: ContentType.success,
                                            )));
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
          },
          itemCount: pizzaList.list.length,
        ),
      ),
    );
  }
}
