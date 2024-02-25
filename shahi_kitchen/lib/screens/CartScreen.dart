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
  CartDatabase cartDatabase = CartDatabase();


  @override
  void initState() {
    // TODO: implement initState

      if(_myBox.get("ITEMS") != null){
      setState(() {
        cartDatabase.loadData();
      });
    }else{
      empty = true;
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(18.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: 50,
            ),
            Text(
              "Your Food Items",
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 20),
            ),
            Text(
                "${DateTime.now().day.toString().padLeft(2, "0")}-${DateTime.now().month.toString().padLeft(2, "0")}-${DateTime.now().year}"),
            empty ? Center(
              child: Text("empty",style: TextStyle(color: Colors.white),),
            ):Expanded(
              child: ListView.builder(
                  itemCount: cartDatabase.items.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Row(
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Text(
                                    cartDatabase.items[index][0],
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 20),
                                  ),
                                  Text(
                                    " (${ cartDatabase.items[index][2]})",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.w200,
                                        fontSize: 15),
                                  )
                                ],
                              ),
                              Text(
                                "${ cartDatabase.items[index][1]} Rs",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w200,
                                    fontSize: 15),
                              ),

                            ],
                          ),
                          Spacer(),
                          GestureDetector(
                            onTap: (){
                              setState(() {
                                cartDatabase.items.removeAt(index);
                                cartDatabase.updateDatabase();
                                if(cartDatabase.items.isNotEmpty){
                                  setState(() {
                                    cartDatabase.loadData();
                                  });
                                }else{
                                  empty = true;
                                }
                              });
                            },
                            child: Icon(
                              Icons.delete,
                              color: Colors.white,
                            ),
                          ),

                        ],
                      ),
                    );
                  }),
            ),
          ],
        ),
      ),
    );
  }
}
