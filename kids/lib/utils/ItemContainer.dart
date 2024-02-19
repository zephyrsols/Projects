import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

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
          SvgPicture.asset(picture),
          SizedBox(height: 10,),
          Text(
            title,
            style: TextStyle(color: Colors.white, fontSize: 16),
          ),
        ],
      ),
    ),
  );
}