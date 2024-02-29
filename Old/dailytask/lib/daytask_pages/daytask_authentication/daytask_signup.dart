import 'package:daytask/daytask_globalclass/daytask_color.dart';
import 'package:daytask/daytask_globalclass/daytask_fonts.dart';
import 'package:daytask/daytask_globalclass/daytask_images.dart';
import 'package:daytask/daytask_pages/daytask_authentication/daytask_signin.dart';
import 'package:daytask/daytask_pages/daytask_dashboard/daytask_dashboard.dart';
import 'package:daytask/daytask_theme/daytask_themecontroller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class DayTaskSignUp extends StatefulWidget {
  const DayTaskSignUp({super.key});

  @override
  State<DayTaskSignUp> createState() => _DayTaskSignUpState();
}

class _DayTaskSignUpState extends State<DayTaskSignUp> {
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

  Color getColor(Set<MaterialState> states) {
    const Set<MaterialState> interactiveStates = <MaterialState>{
      MaterialState.pressed,
      MaterialState.hovered,
      MaterialState.focused,
    };
    if (states.any(interactiveStates.contains)) {
      return DayTaskcolor.yellow;
    }
    return DayTaskcolor.yellow;
  }

  bool isChecked = true;

  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    height = size.height;
    width = size.width;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SingleChildScrollView(
        child: Padding(
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
                "Create_your_account".tr,
                style: intersemibold.copyWith(
                    fontSize: 26),
              ),
              SizedBox(
                height: height / 96,
              ),
              Text(
                "Full_Name".tr,
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
                      DayTaskSvgIcons.user,
                      height: height / 96,
                    ),
                  ),
                  hintText: "Fazil Laghari".tr,
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
                height: height / 120,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Checkbox(
                    checkColor: DayTaskcolor.white,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(2)),
                    side: BorderSide(
                      color: DayTaskcolor.yellow,
                      width: 1.5,
                    ),
                    fillColor: MaterialStateProperty.resolveWith(getColor),
                    value: isChecked,
                    onChanged: (bool? value) {
                      setState(
                            () {
                          isChecked = value!;
                        },
                      );
                    },
                  ),
                  SizedBox(
                    width: width/1.25,
                    child: Text(
                      "I have read & agreed to DayTask Privacy Policy, Terms & Condition".tr,
                      style: interregular.copyWith(fontSize: 14, color: DayTaskcolor.textcolor),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: height / 26,
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
                      "Sign_Up".tr,
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
              SizedBox(
                height: height / 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Already_have_an_account".tr,
                    style: intermedium.copyWith(
                        fontSize: 16, color: DayTaskcolor.textcolor),
                  ),
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
                    child: Text(
                      "Log_In".tr,
                      style: intermedium.copyWith(
                          fontSize: 16, color: DayTaskcolor.yellow),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
