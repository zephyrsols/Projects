import 'package:flutter/material.dart';

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
          const Padding(
            padding: EdgeInsets.all(25.0),
            child: Icon(
              Icons.account_circle,
              color: Colors.white,
            ),
          )
        ],
      ),
      body: Stack(
        fit: StackFit.expand,
        children: [
          Padding(
            padding: EdgeInsets.all(18.0),
            child: Column(
              children: [
                Row(
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
                  padding: EdgeInsets.only(top: 20),
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
                        child: Container(
                          padding: EdgeInsets.all(15),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(
                                  width: 1, color: pizzaOutlineClr)),
                          child: Icon(
                            Icons.local_pizza,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      Spacer(),
                      GestureDetector(
                        onTap:(){
                          setState(() {
                            pizzaOutlineClr = Colors.white;
                            burgerOutlineClr = Colors.yellowAccent;
                            dealsOutlineClr = Colors.white;
                            extraOutlineClr = Colors.white;
                          });
                        },
                        child: Container(
                          padding: EdgeInsets.all(15),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(
                                  width: 1, color: burgerOutlineClr)),
                          child: Icon(
                            Icons.local_pizza,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      Spacer(),
                      GestureDetector(
                        onTap: (){
                          setState(() {
                            pizzaOutlineClr = Colors.white;
                            burgerOutlineClr = Colors.white;
                            dealsOutlineClr = Colors.yellowAccent;
                            extraOutlineClr = Colors.white;
                          });
                        },
                        child: Container(
                          padding: EdgeInsets.all(15),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(
                                  width: 1, color: dealsOutlineClr)),
                          child: Icon(
                            Icons.local_pizza,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      Spacer(),
                      GestureDetector(
                        onTap: (){
                          setState(() {
                            pizzaOutlineClr = Colors.white;
                            burgerOutlineClr = Colors.white;
                            dealsOutlineClr = Colors.white;
                            extraOutlineClr = Colors.yellowAccent;
                          });
                        },
                        child: Container(
                          padding: EdgeInsets.all(15),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(
                                  width: 1, color: extraOutlineClr)),
                          child: Icon(
                            Icons.local_pizza,
                            color: Colors.white,
                          ),
                        ),
                      ),

                    ],
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
