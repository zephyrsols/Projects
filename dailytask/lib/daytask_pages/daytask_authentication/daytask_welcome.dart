import 'package:daytask/daytask_globalclass/daytask_color.dart';
import 'package:daytask/daytask_globalclass/daytask_fonts.dart';
import 'package:daytask/daytask_globalclass/daytask_images.dart';
import 'package:daytask/daytask_pages/daytask_authentication/daytask_signin.dart';
import 'package:daytask/daytask_theme/daytask_themecontroller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DayTaskWelcome extends StatefulWidget {
  const DayTaskWelcome({super.key});

  @override
  State<DayTaskWelcome> createState() => _DayTaskWelcomeState();
}

class _DayTaskWelcomeState extends State<DayTaskWelcome> {
  dynamic size;
  double height = 0.00;
  double width = 0.00;
  final themedata = Get.put(DayTaskThemecontroler());

  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    height = size.height;
    width = size.width;
    return Scaffold(
      body: Padding(
        padding:
            EdgeInsets.symmetric(horizontal: width / 36, vertical: height / 36),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: height / 56,
            ),
            // Image.asset(
            //   themedata.isdark ? DayTaskPngImg.appicon : DayTaskPngImg.appicondark,
            //   height: height / 12,
            // ),
            SizedBox(
              height: height / 36,
            ),
            Container(
              color: themedata.isdark ? DayTaskcolor.white : DayTaskcolor.bgcolor,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: width / 26),
                child: Image.asset(
                  DayTaskPngImg.welcome,
                  height: height / 3,
                  width: width / 1,
                  fit: BoxFit.fill,
                ),
              ),
            ),
            SizedBox(
              height: height / 36,
            ),
            Text(
              "Manage\nyour\nTask with",
              style:
                  interbold.copyWith(fontSize: 50),
            ),
            Text(
              "DayTask",
              style:
                  interbold.copyWith(fontSize: 50, color: DayTaskcolor.yellow),
            ),
            const Spacer(),
            InkWell(
              splashColor: DayTaskcolor.transparent,
              highlightColor: DayTaskcolor.transparent,
              onTap: () {
                Navigator.push(context, MaterialPageRoute(
                  builder: (context) {
                    return const DayTaskSignIn();
                  },
                ));
              },
              child: Container(
                height: height / 15,
                color: DayTaskcolor.yellow,
                child: Center(
                  child: Text(
                    "Lets_Start".tr,
                    style: intersemibold.copyWith(
                        fontSize: 18, color: DayTaskcolor.black),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
