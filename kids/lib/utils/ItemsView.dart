import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class ItemsView extends StatefulWidget {
  String title = "";
  String svgPath = "";
  ItemsView({super.key, required this.title,required this.svgPath});

  @override
  State<ItemsView> createState() => _ItemsViewState();
}

class _ItemsViewState extends State<ItemsView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.only(top: 100,left: 20,right: 20),
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/png/screens_bg.png")
          )
        ),
        child: Column(
          children: [
            itemsViewContainer(widget.title, widget.svgPath, () { }),
            SizedBox(height: 20,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(100),
                      gradient: const LinearGradient(
                          colors: [Color(0xffFBB23F), Color(0xffFF8A42)])
                  ),
                  child: SvgPicture.asset("assets/svg/items/speaker.svg"),
                )
              ],
            ),
            Row(
              children: [
                Spacer(),
                Container(
                  padding: EdgeInsets.all(15),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(100),
                      gradient: const LinearGradient(
                          colors: [Color(0xffFBB23F), Color(0xffFF8A42)])
                  ),
                  child: SvgPicture.asset("assets/svg/items/previous.svg"),
                ),
                Spacer(),
                Spacer(),
                Container(
                  padding: EdgeInsets.all(15),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(100),
                      gradient: const LinearGradient(
                          colors: [Color(0xffFBB23F), Color(0xffFF8A42)])
                  ),
                  child: SvgPicture.asset("assets/svg/items/next.svg"),
                ),
                Spacer(),
              ],
            )
          ],
        ),
      ),
    );
  }
}

Widget itemsViewContainer(
    String title, String picture, VoidCallback navigator) {
  return GestureDetector(
    onTap: navigator,
    child: Container(
      width: double.infinity,
      height: 300,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          gradient: const LinearGradient(
              colors: [Color(0xffFBB23F), Color(0xffFF8A42)])),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(height: 200, width: 200, child: SvgPicture.asset(picture)),
          const SizedBox(
            height: 10,
          ),
          Text(
            title,
            textAlign: TextAlign.center,
            style: const TextStyle(color: Colors.white, fontSize: 25),
          ),
        ],
      ),
    ),
  );
}
