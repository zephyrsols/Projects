import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class VideoItemContainer extends StatefulWidget {
  String title;
  List contentList;

  VideoItemContainer(
      {super.key, required this.contentList, required this.title});

  @override
  State<VideoItemContainer> createState() => _VideoItemContainerState();
}

class _VideoItemContainerState extends State<VideoItemContainer> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(fontFamily: "jua", useMaterial3: true),
      home: Scaffold(
        body: Container(
            height: double.infinity,
            decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("assets/png/screens_bg.png"),
                    fit: BoxFit.cover)),
            child: Padding(
              padding: const EdgeInsets.all(18.0),
              child: Column(
                children: [
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    widget.title,
                    style: TextStyle(
                        fontFamily: "just_another_hand",
                        color: Color(0xFFFBB23F),
                        fontSize: 30),
                  ),
                  Expanded(
                    child: GridView.builder(
                        itemCount: widget.contentList.length,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            mainAxisSpacing: 10,
                            crossAxisSpacing: 10,
                            crossAxisCount: 2),
                        itemBuilder: (context, index) {
                          return itemContainer(
                              widget.contentList[index][0],
                              widget.contentList[index][1],
                              widget.contentList[index][2]);
                        }),
                  ),
                ],
              ),
            )),
      ),
    );
  }
}

Widget itemContainer(String title, String picture, VoidCallback navigator) {
  return GestureDetector(
    onTap: navigator,
    child: Container(
      height: 150,
      width: 150,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          gradient: const LinearGradient(
              colors: [Color(0xffFBB23F), Color(0xffFF8A42)])),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Stack(
            alignment: Alignment.center,
            children: [
              SvgPicture.asset(picture),
              SvgPicture.asset("assets/svg/play_icon.svg")
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
            title,
            textAlign: TextAlign.center,
            style: const TextStyle(color: Colors.white, fontSize: 16),
          ),
        ],
      ),
    ),
  );
}
