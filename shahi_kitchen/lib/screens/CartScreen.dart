import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:hive_flutter/hive_flutter.dart';

import '../cartDatabase/CartDatabase.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  final _myBox = Hive.box("cart");

  var empty = false;
  var totalGrand = 0;
  CartDatabase cartDatabase = CartDatabase();

  @override
  void initState() {
    // TODO: implement initState
    if (_myBox.get("ITEMS") != null) {
      cartDatabase.loadData();
      if (cartDatabase.items.isNotEmpty) {
        setState(() {
          cartDatabase.loadData();
          for (var x = 0; x < cartDatabase.items.length; x++) {
            totalGrand += int.parse(cartDatabase.items[x][1]);
          }
          empty = false;
        });
      } else {
        empty = true;
      }
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.fromLTRB(18, 18, 18, 85),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(
              height: 50,
            ),
            const Text(
              "Your Food Items",
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 20),
            ),
            Text(
                "${DateTime.now().day.toString().padLeft(2, "0")}-${DateTime.now().month.toString().padLeft(2, "0")}-${DateTime.now().year}"),
            empty
                ? const Center(
                    child: Padding(
                      padding: EdgeInsets.only(top: 250),
                      child: Text(
                        "Nothing in cart!",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  )
                : Expanded(
                    child: Column(
                      children: [
                        Expanded(
                          child: ListView.builder(
                              itemCount: cartDatabase.items.length,
                              itemBuilder: (context, index) {
                                return Padding(
                                  padding: const EdgeInsets.all(10.0),
                                  child: Column(
                                    children: [
                                      Row(
                                        children: [
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Row(
                                                children: [
                                                  Text(
                                                    cartDatabase.items[index]
                                                        [0],
                                                    style: const TextStyle(
                                                        color: Colors.white,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        fontSize: 17),
                                                  ),
                                                  Text(
                                                    " ${cartDatabase.items[index][2]}",
                                                    style: const TextStyle(
                                                        color: Colors.white,
                                                        fontWeight:
                                                            FontWeight.w200,
                                                        fontSize: 13),
                                                  )
                                                ],
                                              ),
                                              Text(
                                                "${cartDatabase.items[index][1]} Rs",
                                                style: const TextStyle(
                                                    color: Colors.white,
                                                    fontWeight: FontWeight.w200,
                                                    fontSize: 13),
                                              ),
                                            ],
                                          ),
                                          const Spacer(),
                                          GestureDetector(
                                            onTap: () {
                                              setState(() {
                                                totalGrand -= int.parse(
                                                    cartDatabase.items[index]
                                                        [1]);
                                                cartDatabase.items
                                                    .removeAt(index);
                                                cartDatabase.updateDatabase();
                                                if (cartDatabase
                                                    .items.isNotEmpty) {
                                                  setState(() {
                                                    cartDatabase.loadData();
                                                  });
                                                } else {
                                                  empty = true;
                                                }
                                                print(_myBox.get("ITEMS"));
                                              });
                                            },
                                            child: const Icon(
                                              Icons.delete,
                                              color: Colors.white,
                                            ),
                                          ),
                                        ],
                                      ),
                                      Container(
                                        height: 0.2,
                                        color: Colors.white,
                                        child: const Row(
                                          children: [],
                                        ),
                                      )
                                    ],
                                  ),
                                );
                              }),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(bottom: 10),
                          child: Container(
                              padding: const EdgeInsets.all(5),
                              decoration: BoxDecoration(
                                  border: Border.all(
                                      width: 1, color: Colors.white)),
                              child: Row(
                                children: [
                                  const Text(
                                    "Total Grand",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 17),
                                  ),
                                  const Spacer(),
                                  const Padding(
                                    padding: EdgeInsets.only(top: 5),
                                    child: Text(
                                      "Rs",
                                      style: TextStyle(
                                          color: Colors.redAccent,
                                          fontSize: 15,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                  Text("$totalGrand",
                                      style: const TextStyle(
                                          color: Colors.white,
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold))
                                ],
                              )),
                        ),
                        ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.white,
                          ),
                          child: const Text(
                            "Checkout",
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.w500),
                          ),
                        ),
                      ],
                    ),
                  ),
          ],
        ),
      ),
    );
  }
}
