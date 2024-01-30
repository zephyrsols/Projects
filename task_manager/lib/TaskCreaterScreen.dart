import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class TaskCreaterSCreen extends StatefulWidget {
  const TaskCreaterSCreen({super.key});

  @override
  State<TaskCreaterSCreen> createState() => _TaskCreaterSCreenState();
}

class _TaskCreaterSCreenState extends State<TaskCreaterSCreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFDBE9F6),
      appBar: AppBar(
        backgroundColor: const Color(0xFFDBE9F6),
        leading: Padding(
          padding: const EdgeInsets.all(18.0),
          child: GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: SvgPicture.asset("assets/svg/back_img.svg")),
        ),
        title: Text(
          "Create Task",
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
        ),
      ),
    );
  }
}
