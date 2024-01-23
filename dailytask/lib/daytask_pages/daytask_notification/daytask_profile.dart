import 'package:daytask/daytask_globalclass/daytask_color.dart';
import 'package:daytask/daytask_globalclass/daytask_fonts.dart';
import 'package:daytask/daytask_globalclass/daytask_images.dart';
import 'package:daytask/daytask_pages/daytask_authentication/daytask_signin.dart';
import 'package:daytask/daytask_theme/daytask_themecontroller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class DayTaskProfile extends StatefulWidget {
  const DayTaskProfile({super.key});

  @override
  State<DayTaskProfile> createState() => _DayTaskProfileState();
}

class _DayTaskProfileState extends State<DayTaskProfile> {
  dynamic size;
  double height = 0.00;
  double width = 0.00;
  final themedata = Get.put(DayTaskThemecontroler());

  bool isDark = true;

  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    height = size.height;
    width = size.width;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        leading: Padding(
          padding: EdgeInsets.symmetric(
              horizontal: width / 36, vertical: height / 46),
          child: InkWell(
            splashColor: DayTaskcolor.transparent,
            highlightColor: DayTaskcolor.transparent,
            onTap: () {
              Navigator.pop(context);
            },
            child: SvgPicture.asset(
              DayTaskSvgIcons.arrowleft,
              height: height / 96,
              colorFilter: ColorFilter.mode(
                  themedata.isdark ? DayTaskcolor.white : DayTaskcolor.black,
                  BlendMode.srcIn),
            ),
          ),
        ),
        title: Text(
          "Profile".tr,
          style: intermedium.copyWith(fontSize: 20),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(
              horizontal: width / 36, vertical: height / 36),
          child: Column(
            children: [
              Stack(
                children: [
                  Center(
                    child: SizedBox(
                      height: height / 7,
                      width: height / 7,
                      child: ClipOval(
                        child: Image.asset(
                          DayTaskPngImg.profileicon,
                          fit: BoxFit.fitHeight,
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                      bottom: 0,
                      right: 125,
                      child: Container(
                        height: height / 23,
                        width: height / 23,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50),
                          color: DayTaskcolor.black,
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(6),
                          child: SvgPicture.asset(
                            DayTaskSvgIcons.addsquare,
                            height: height / 46,
                          ),
                        ),
                      ))
                ],
              ),
              SizedBox(
                height: height / 16,
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
                      DayTaskSvgIcons.useradd,
                      height: height / 96,
                    ),
                  ),
                  suffixIcon: Padding(
                    padding: const EdgeInsets.all(14),
                    child: SvgPicture.asset(
                      DayTaskSvgIcons.edit,
                      height: height / 96,
                      colorFilter: ColorFilter.mode(
                          DayTaskcolor.textcolor, BlendMode.srcIn),
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
                      DayTaskSvgIcons.usertag,
                      height: height / 96,
                    ),
                  ),
                  suffixIcon: Padding(
                    padding: const EdgeInsets.all(14),
                    child: SvgPicture.asset(
                      DayTaskSvgIcons.edit,
                      height: height / 96,
                      colorFilter: ColorFilter.mode(
                          DayTaskcolor.textcolor, BlendMode.srcIn),
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
                      DayTaskSvgIcons.locktag,
                      height: height / 96,
                    ),
                  ),
                  suffixIcon: Padding(
                    padding: const EdgeInsets.all(14),
                    child: SvgPicture.asset(
                      DayTaskSvgIcons.edit,
                      height: height / 96,
                      colorFilter: ColorFilter.mode(
                          DayTaskcolor.textcolor, BlendMode.srcIn),
                    ),
                  ),
                  hintText: "12345".tr,
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
                height: height / 56,
              ),
              Container(
                height: height / 14,
                color: DayTaskcolor.textfield,
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: width / 26),
                  child: Row(
                    children: [
                      SvgPicture.asset(
                        DayTaskSvgIcons.task,
                        height: height / 36,
                      ),
                      SizedBox(
                        width: width / 26,
                      ),
                      Text(
                        "My Tasks".tr,
                        style: interregular.copyWith(
                          fontSize: 14,
                          color: DayTaskcolor.white,
                        ),
                      ),
                      const Spacer(),
                      SvgPicture.asset(
                        DayTaskSvgIcons.arrowdown,
                        height: height / 36,
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: height / 56,
              ),
              Container(
                height: height / 14,
                color: DayTaskcolor.textfield,
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: width / 26),
                  child: Row(
                    children: [
                      SvgPicture.asset(
                        DayTaskSvgIcons.securitycard,
                        height: height / 36,
                      ),
                      SizedBox(
                        width: width / 26,
                      ),
                      Text(
                        "Privacy".tr,
                        style: interregular.copyWith(
                          fontSize: 14,
                          color: DayTaskcolor.white,
                        ),
                      ),
                      const Spacer(),
                      SvgPicture.asset(
                        DayTaskSvgIcons.arrowdown,
                        height: height / 36,
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: height / 56,
              ),
              Container(
                height: height / 14,
                color: DayTaskcolor.textfield,
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: width / 26),
                  child: Row(
                    children: [
                      SvgPicture.asset(
                        DayTaskSvgIcons.setting,
                        height: height / 36,
                      ),
                      SizedBox(
                        width: width / 26,
                      ),
                      Text(
                        "Setting".tr,
                        style: interregular.copyWith(
                          fontSize: 14,
                          color: DayTaskcolor.white,
                        ),
                      ),
                      const Spacer(),
                      SvgPicture.asset(
                        DayTaskSvgIcons.arrowdown,
                        height: height / 36,
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: height / 56,
              ),
              Container(
                height: height / 14,
                color: DayTaskcolor.textfield,
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: width / 26),
                  child: Row(
                    children: [
                      Icon(
                        Icons.logout_outlined,
                        size: height / 36,
                        color: DayTaskcolor.textcolor,
                      ),
                      SizedBox(
                        width: width / 26,
                      ),
                      Text(
                        "Dark Mode".tr,
                        style: interregular.copyWith(
                          fontSize: 14,
                          color: DayTaskcolor.white,
                        ),
                      ),
                      const Spacer(),
                      SizedBox(
                        height: height / 36,
                        child: Switch(
                            activeColor: DayTaskcolor.white,
                            onChanged: (state) {
                              setState(() {
                                themedata.changeTheme(state);
                                isDark = state;
                                themedata.update();
                              });
                            },
                            value: themedata.isdark),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: height / 56,
              ),
              InkWell(
                splashColor: DayTaskcolor.transparent,
                highlightColor: DayTaskcolor.transparent,
                onTap: () {
                  _showbottomsheet();
                },
                child: Container(
                  height: height / 14,
                  color: DayTaskcolor.textfield,
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: width / 26),
                    child: Row(
                      children: [
                        Icon(
                          Icons.swap_vert_outlined,
                          size: height / 36,
                          color: DayTaskcolor.textcolor,
                        ),
                        SizedBox(
                          width: width / 26,
                        ),
                        Text(
                          "Change Layout".tr,
                          style: interregular.copyWith(
                            fontSize: 14,
                            color: DayTaskcolor.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: height / 26,
              ),
              InkWell(
                splashColor: DayTaskcolor.transparent,
                highlightColor: DayTaskcolor.transparent,
                onTap: () {
                  Alertdialog();
                },
                child: Container(
                  height: height / 14,
                  color: DayTaskcolor.yellow,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SvgPicture.asset(
                        DayTaskSvgIcons.logoutcurve,
                        height: height / 36,
                      ),
                      SizedBox(
                        width: width / 26,
                      ),
                      Text(
                        "Logout".tr,
                        style: interregular.copyWith(
                          fontSize: 14,
                          color: DayTaskcolor.black,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Alertdialog() {
    showDialog(
        builder: (context) => AlertDialog(
              title: Text("DayTask".tr,
                  textAlign: TextAlign.center,
                  style: intersemibold.copyWith(fontSize: 18)),
              content: Text(
                "Are you sure to logout this account?",
                style: interregular.copyWith(fontSize: 13),
              ),
              actionsAlignment: MainAxisAlignment.end,
              actions: [
                ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: DayTaskcolor.yellow),
                    onPressed: () {
                      Get.back();
                    },
                    child: Text(
                      "No",
                      style: interregular.copyWith(color: DayTaskcolor.black),
                    )),
                ElevatedButton(
                  onPressed: () async {
                    Navigator.push(context, MaterialPageRoute(
                      builder: (context) {
                        return const DayTaskSignIn();
                      },
                    ));
                  },
                  style: ElevatedButton.styleFrom(
                      backgroundColor: DayTaskcolor.yellow),
                  child: Text("Yes",
                      style: interregular.copyWith(color: DayTaskcolor.black)),
                )
              ],
            ),
        context: context);
  }

  _showbottomsheet() {
    showModalBottomSheet(
        context: context,
        builder: (BuildContext context) {
          return StatefulBuilder(
              builder: (BuildContext context, StateSetter setState) {
                return Container(
                  decoration: BoxDecoration(
                    // color: Colors.white,
                    borderRadius: BorderRadius.circular(7),
                  ),
                  height: height / 4,
                  child: Column(
                    children: [
                      Container(
                        margin: const EdgeInsets.only(
                          top: 10,
                          bottom: 10,
                        ),
                        child: Text('select_application_layout'.tr,
                            style: interbold.copyWith(
                              fontSize: 14,
                            )),
                      ),
                      const Divider(),
                      SizedBox(
                        height: height / 26,
                        child: InkWell(
                          highlightColor: DayTaskcolor.transparent,
                          splashColor: DayTaskcolor.transparent,
                          onTap: () async {
                            await Get.updateLocale(const Locale('en', 'US'));
                            // ignore: use_build_context_synchronously
                            Navigator.of(context).pop();
                          },
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'ltr'.tr,
                                style: interregular.copyWith(
                                  fontSize: 16,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      const Divider(),
                      SizedBox(
                        height: height / 26,
                        child: InkWell(
                          highlightColor: DayTaskcolor.transparent,
                          splashColor: DayTaskcolor.transparent,
                          onTap: () async {
                            await Get.updateLocale(const Locale('ar', 'ab'));
                            // ignore: use_build_context_synchronously
                            Navigator.of(context).pop();
                          },
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'rtl'.tr,
                                style: interregular.copyWith(
                                  fontSize: 16,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      const Divider(),
                      SizedBox(
                        height: height / 26,
                        child: InkWell(
                          highlightColor: DayTaskcolor.transparent,
                          splashColor: DayTaskcolor.transparent,
                          onTap: () async {
                            Navigator.of(context).pop();
                          },
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'cancel'.tr,
                                style: interregular.copyWith(
                                  fontSize: 16,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              });
        });
  }
}
