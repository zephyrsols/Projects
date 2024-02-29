import 'package:daytask/daytask_globalclass/daytask_color.dart';
import 'package:daytask/daytask_globalclass/daytask_fonts.dart';
import 'package:daytask/daytask_globalclass/daytask_images.dart';
import 'package:daytask/daytask_pages/daytask_authentication/daytask_forgotpassword.dart';
import 'package:daytask/daytask_pages/daytask_authentication/daytask_signup.dart';
import 'package:daytask/daytask_pages/daytask_dashboard/daytask_dashboard.dart';
import 'package:daytask/daytask_theme/daytask_themecontroller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class DayTaskSignIn extends StatefulWidget {
  const DayTaskSignIn({super.key});

  @override
  State<DayTaskSignIn> createState() => _DayTaskSignInState();
}

class _DayTaskSignInState extends State<DayTaskSignIn> {
  dynamic size;
  double height = 0.00;
  double width = 0.00;
  final themedata = Get.put(DayTaskThemecontroler());

  bool _obscureText1 = true;

  void _togglePasswordStatus1() {
    setState(() {
      _obscureText1 = !_obscureText1;
    });
  }

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
            //     themedata.isdark
            //         ? DayTaskPngImg.appicon
            //         : DayTaskPngImg.appicondark,
            //     height: height / 10,
            //   ),
            // ),
            SizedBox(
              height: height / 26,
            ),
            Text(
              "Welcome_Back".tr,
              style: intersemibold.copyWith(fontSize: 26),
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
              height: height / 36,
            ),
            Text(
              "Password".tr,
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
              obscureText: _obscureText1,
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
                    DayTaskSvgIcons.lock,
                    height: height / 96,
                  ),
                ),
                suffixIcon: Padding(
                  padding: const EdgeInsets.all(14),
                  child: InkWell(
                    splashColor: DayTaskcolor.transparent,
                    highlightColor: DayTaskcolor.transparent,
                    onTap: () {
                      _togglePasswordStatus1();
                    },
                    child: SvgPicture.asset(
                      _obscureText1
                          ? DayTaskSvgIcons.eyeslash
                          : DayTaskSvgIcons.eye,
                      height: height / 96,
                    ),
                  ),
                ),
                hintText: "123456".tr,
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
              height: height / 96,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                InkWell(
                  splashColor: DayTaskcolor.transparent,
                  highlightColor: DayTaskcolor.transparent,
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(
                      builder: (context) {
                        return const DayTaskForgotPassword();
                      },
                    ));
                  },
                  child: Text(
                    "Forgot_Password".tr,
                    style: intermedium.copyWith(
                        fontSize: 16, color: DayTaskcolor.textcolor),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: height / 20,
            ),
            InkWell(
              splashColor: DayTaskcolor.transparent,
              highlightColor: DayTaskcolor.transparent,
              onTap: () {
                Navigator.push(context, MaterialPageRoute(
                  builder: (context) {
                    return DayTaskDashboard("0");
                  },
                ));
              },
              child: Container(
                height: height / 15,
                color: DayTaskcolor.yellow,
                child: Center(
                  child: Text(
                    "Log_In".tr,
                    style: intersemibold.copyWith(
                        fontSize: 18, color: DayTaskcolor.black),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: height / 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                    height: height / 500,
                    width: width / 3.72,
                    color: DayTaskcolor.textcolor),
                SizedBox(width: width / 56),
                Text(
                  "Or_continue_with".tr,
                  style: intermedium.copyWith(
                      fontSize: 16, color: DayTaskcolor.textcolor),
                ),
                SizedBox(width: width / 56),
                Container(
                    height: height / 500,
                    width: width / 3.72,
                    color: DayTaskcolor.textcolor),
              ],
            ),
            SizedBox(
              height: height / 20,
            ),
            Container(
              height: height / 15,
              decoration: BoxDecoration(
                  border: Border.all(
                      color: themedata.isdark
                          ? DayTaskcolor.white
                          : DayTaskcolor.black)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SvgPicture.asset(
                    DayTaskSvgIcons.google,
                    height: height / 36,
                    colorFilter: ColorFilter.mode(
                        themedata.isdark
                            ? DayTaskcolor.white
                            : DayTaskcolor.black,
                        BlendMode.srcIn),
                  ),
                  SizedBox(
                    width: width / 36,
                  ),
                  Text(
                    "Google".tr,
                    style: intermedium.copyWith(
                        fontSize: 18,
                        color: themedata.isdark
                            ? DayTaskcolor.white
                            : DayTaskcolor.black),
                  ),
                ],
              ),
            ),
            const Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Dont_have_an_account".tr,
                  style: intermedium.copyWith(
                      fontSize: 16, color: DayTaskcolor.textcolor),
                ),
                InkWell(
                  splashColor: DayTaskcolor.transparent,
                  highlightColor: DayTaskcolor.transparent,
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(
                      builder: (context) {
                        return const DayTaskSignUp();
                      },
                    ));
                  },
                  child: Text(
                    "Sign_Up".tr,
                    style: intermedium.copyWith(
                        fontSize: 16, color: DayTaskcolor.yellow),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
