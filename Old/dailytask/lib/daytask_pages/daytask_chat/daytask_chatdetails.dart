import 'package:daytask/daytask_globalclass/daytask_color.dart';
import 'package:daytask/daytask_globalclass/daytask_fonts.dart';
import 'package:daytask/daytask_globalclass/daytask_images.dart';
import 'package:daytask/daytask_theme/daytask_themecontroller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class DayTaskChatDetails extends StatefulWidget {
  const DayTaskChatDetails({super.key});

  @override
  State<DayTaskChatDetails> createState() => _DayTaskChatDetailsState();
}

class _DayTaskChatDetailsState extends State<DayTaskChatDetails> {
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
      appBar: AppBar(
        leadingWidth: width / 1,
        leading: Padding(
          padding: EdgeInsets.symmetric(horizontal: width / 36),
          child: Row(
            children: [
              InkWell(
                splashColor: DayTaskcolor.transparent,
                highlightColor: DayTaskcolor.transparent,
                onTap: () {
                  Navigator.pop(context);
                },
                child: SvgPicture.asset(
                  DayTaskSvgIcons.arrowleft,
                  height: height / 36,
                  colorFilter: ColorFilter.mode(
                      themedata.isdark
                          ? DayTaskcolor.white
                          : DayTaskcolor.black,
                      BlendMode.srcIn),
                ),
              ),
              SizedBox(
                width: width / 10,
              ),
              Image.asset(
                DayTaskPngImg.profile,
                height: height / 18,
              ),
              SizedBox(
                width: width / 36,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: height / 66,
                  ),
                  Text(
                    "Olivia Anna",
                    style: intersemibold.copyWith(
                        fontSize: 14),
                  ),
                  Text(
                    "Online".tr,
                    style: interregular.copyWith(
                        fontSize: 14, color: DayTaskcolor.textcolor),
                  ),
                ],
              ),
              const Spacer(),
              SvgPicture.asset(
                DayTaskSvgIcons.video,
                height: height / 36,
                colorFilter: ColorFilter.mode(
                    themedata.isdark
                        ? DayTaskcolor.white
                        : DayTaskcolor.black,
                    BlendMode.srcIn),
              ),
              SizedBox(
                width: width / 26,
              ),
              SvgPicture.asset(
                DayTaskSvgIcons.callcalling,
                height: height / 36,
                colorFilter: ColorFilter.mode(
                    themedata.isdark
                        ? DayTaskcolor.white
                        : DayTaskcolor.black,
                    BlendMode.srcIn),
              ),
            ],
          ),
        ),
      ),
      body: Padding(
        padding:
            EdgeInsets.symmetric(horizontal: width / 36, vertical: height / 36),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              color: DayTaskcolor.dashboard,
              child: Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: width / 36, vertical: height / 56),
                child: Text(
                  "Hi, please check the new task.",
                  style: intermedium.copyWith(
                      fontSize: 16, color: DayTaskcolor.white),
                ),
              ),
            ),
            SizedBox(
              height: height / 36,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(
                  color: DayTaskcolor.yellow,
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: width / 36, vertical: height / 56),
                    child: Text(
                      "Hi, please check the new task.",
                      style: intermedium.copyWith(
                          fontSize: 16, color: DayTaskcolor.black),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: height / 36,
            ),
            Container(
              color: DayTaskcolor.dashboard,
              child: Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: width / 36, vertical: height / 56),
                child: Text(
                  "Got it. Thanks.",
                  style: intermedium.copyWith(
                      fontSize: 16, color: DayTaskcolor.white),
                ),
              ),
            ),
            SizedBox(
              height: height / 56,
            ),
            Container(
              color: DayTaskcolor.dashboard,
              child: Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: width / 36, vertical: height / 56),
                child: Text(
                  "Hi, please check the last task, that I\nhave completed.",
                  style: intermedium.copyWith(
                      fontSize: 16, color: DayTaskcolor.white),
                ),
              ),
            ),
            SizedBox(
              height: height / 36,
            ),
            Image.asset(
              DayTaskPngImg.chatimg,
              height: height / 7,
              width: width / 2,
              fit: BoxFit.fill,
            ),
            SizedBox(
              height: height / 36,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(
                  color: DayTaskcolor.yellow,
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: width / 36, vertical: height / 56),
                    child: Text(
                      "Got it. Will check it soon.",
                      style: intermedium.copyWith(
                          fontSize: 16, color: DayTaskcolor.black),
                    ),
                  ),
                ),
              ],
            ),
            const Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  width: width / 1.3,
                  child: TextField(
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
                      fillColor: DayTaskcolor.dashboard,
                      prefixIcon: Padding(
                        padding: const EdgeInsets.all(14),
                        child: SvgPicture.asset(
                          DayTaskSvgIcons.elementequal,
                          height: height / 96,
                        ),
                      ),
                      suffixIcon: Padding(
                        padding: const EdgeInsets.all(14),
                        child: SvgPicture.asset(
                          DayTaskSvgIcons.send,
                          height: height / 96,
                        ),
                      ),
                      hintText: "Type a message".tr,
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
                ),
                Container(
                  height: height / 14,
                  width: height / 14,
                  color: DayTaskcolor.dashboard,
                  child: Padding(
                    padding: const EdgeInsets.all(14),
                    child: SvgPicture.asset(
                      DayTaskSvgIcons.microphone,
                      height: height / 36,
                    ),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
