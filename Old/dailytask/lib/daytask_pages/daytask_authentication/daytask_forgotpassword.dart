import 'package:daytask/daytask_globalclass/daytask_color.dart';
import 'package:daytask/daytask_globalclass/daytask_fonts.dart';
import 'package:daytask/daytask_globalclass/daytask_images.dart';
import 'package:daytask/daytask_theme/daytask_themecontroller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class DayTaskForgotPassword extends StatefulWidget {
  const DayTaskForgotPassword({super.key});

  @override
  State<DayTaskForgotPassword> createState() => _DayTaskForgotPasswordState();
}

class _DayTaskForgotPasswordState extends State<DayTaskForgotPassword> {
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
      resizeToAvoidBottomInset: false,
      body: Padding(
        padding:
        EdgeInsets.symmetric(horizontal: width / 36, vertical: height / 36),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: height / 56,
            ),
            // Center(
            //   child: Image.asset(
            //     themedata.isdark ? DayTaskPngImg.appicon : DayTaskPngImg.appicondark,
            //     height: height / 10,
            //   ),
            // ),
            SizedBox(
              height: height / 26,
            ),
            Text(
              "ForgotPassword".tr,
              style: intersemibold.copyWith(
                  fontSize: 26),
            ),
            SizedBox(
              height: height / 96,
            ),
            Text(
              "Email_Address".tr,
              style: interregular.copyWith(
                  fontSize: 18, color: DayTaskcolor.textcolor),
            ),
            SizedBox(
              height: height / 56,
            ),
            TextField(
              style: interregular.copyWith(
                fontSize: 14,
                color: DayTaskcolor.white,
              ),
              decoration: InputDecoration(
                hintStyle: interregular.copyWith(
                  fontSize: 14,
                  color: DayTaskcolor.white,
                ),
                filled: true,
                fillColor: DayTaskcolor.textfield,
                prefixIcon: Padding(
                  padding: const EdgeInsets.all(14),
                  child: SvgPicture.asset(
                    DayTaskSvgIcons.email,
                    height: height / 96,
                  ),
                ),
                hintText: "fazzzil72@gmail.com".tr,
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide.none,
                  borderRadius: BorderRadius.circular(0),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide.none,
                  borderRadius: BorderRadius.circular(0),
                ),
              ),
            ),
            SizedBox(
              height: height / 20,
            ),
            InkWell(
              splashColor: DayTaskcolor.transparent,
              highlightColor: DayTaskcolor.transparent,
              onTap: () {
                /* Navigator.push(context, MaterialPageRoute(
                  builder: (context) {
                    return const DayTaskForgotPassword();
                  },
                ));*/
              },
              child: Container(
                height: height / 15,
                color: DayTaskcolor.yellow,
                child: Center(
                  child: Text(
                    "Send".tr,
                    style: intersemibold.copyWith(
                        fontSize: 18, color: DayTaskcolor.black),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
