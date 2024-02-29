import 'package:daytask/daytask_globalclass/daytask_color.dart';
import 'package:daytask/daytask_globalclass/daytask_fonts.dart';
import 'package:daytask/daytask_globalclass/daytask_images.dart';
import 'package:daytask/daytask_pages/daytask_calender/daytask_createnewtask.dart';
import 'package:daytask/daytask_theme/daytask_themecontroller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class DayTaskCreateNewTask extends StatefulWidget {
  const DayTaskCreateNewTask({super.key});

  @override
  State<DayTaskCreateNewTask> createState() => _DayTaskCreateNewTaskState();
}

class _DayTaskCreateNewTaskState extends State<DayTaskCreateNewTask> {
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
                  themedata.isdark
                      ? DayTaskcolor.white
                      : DayTaskcolor.black,
                  BlendMode.srcIn),
            ),
          ),
        ),
        title: Text(
          "Create_New_Task".tr,
          style: intermedium.copyWith(fontSize: 20),
        ),
      ),
      body: Padding(
        padding:
            EdgeInsets.symmetric(horizontal: width / 36, vertical: height / 36),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Task_Title".tr,
              style: intersemibold.copyWith(
                  fontSize: 20),
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
                hintText: "Hi-Fi Wireframe".tr,
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
              "Task_Details".tr,
              style: intersemibold.copyWith(
                  fontSize: 20),
            ),
            SizedBox(
              height: height / 56,
            ),
            TextField(
              style: interregular.copyWith(
                fontSize: 11,
                color: DayTaskcolor.white,
              ),
              maxLines: 3,
              decoration: InputDecoration(
                hintStyle: interregular.copyWith(
                  fontSize: 11,
                  color: DayTaskcolor.white,
                ),
                filled: true,
                fillColor: DayTaskcolor.textfield,
                hintText:
                    "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s,"
                        .tr,
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
              "Add_team_members".tr,
              style: intersemibold.copyWith(
                  fontSize: 20),
            ),
            SizedBox(
              height: height / 56,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                    height: height / 15,
                    width: width / 2.75,
                    color: DayTaskcolor.textfield,
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: width / 36),
                      child: Row(
                        children: [
                          Image.asset(
                            DayTaskPngImg.profile1,
                            height: height / 36,
                          ),
                          SizedBox(
                            width: width / 56,
                          ),
                          Text(
                            "Sophia".tr,
                            style: intermedium.copyWith(
                                fontSize: 14, color: DayTaskcolor.white),
                          ),
                          const Spacer(),
                          SvgPicture.asset(
                            DayTaskSvgIcons.closesquare,
                            height: height / 36,
                          ),
                        ],
                      ),
                    )),
                Container(
                    height: height / 15,
                    width: width / 2.75,
                    color: DayTaskcolor.textfield,
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: width / 36),
                      child: Row(
                        children: [
                          Image.asset(
                            DayTaskPngImg.profile,
                            height: height / 36,
                          ),
                          SizedBox(
                            width: width / 56,
                          ),
                          Text(
                            "Robert".tr,
                            style: intermedium.copyWith(
                                fontSize: 14, color: DayTaskcolor.white),
                          ),
                          const Spacer(),
                          SvgPicture.asset(
                            DayTaskSvgIcons.closesquare,
                            height: height / 36,
                          ),
                        ],
                      ),
                    )),
                Container(
                  height: height / 15,
                  width: height / 15,
                  color: DayTaskcolor.yellow,
                  child: Padding(
                    padding: const EdgeInsets.all(12),
                    child: SvgPicture.asset(
                      DayTaskSvgIcons.addsquare,
                      height: height / 30,
                      colorFilter:
                          const ColorFilter.mode(DayTaskcolor.black, BlendMode.srcIn),
                    ),
                  ),
                )
              ],
            ),
            SizedBox(
              height: height / 36,
            ),
            Text(
              "Time_Date".tr,
              style: intersemibold.copyWith(
                  fontSize: 20),
            ),
            SizedBox(
              height: height / 56,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                    height: height / 15,
                    width: width / 2.2,
                    color: DayTaskcolor.textfield,
                    child: Padding(
                      padding: EdgeInsets.only(right: width / 36),
                      child: Row(
                        children: [
                          Container(
                            height: height / 15,
                            width: height / 15,
                            color: DayTaskcolor.yellow,
                            child: Padding(
                              padding: const EdgeInsets.all(12),
                              child: SvgPicture.asset(
                                DayTaskSvgIcons.clock,
                                height: height / 30,
                                colorFilter:
                                const ColorFilter.mode(DayTaskcolor.black, BlendMode.srcIn),
                              ),
                            ),
                          ),
                          SizedBox(
                            width: width / 26,
                          ),
                          Text(
                            "10:30 AM".tr,
                            style: intermedium.copyWith(
                                fontSize: 18, color: DayTaskcolor.white),
                          ),
                        ],
                      ),
                    )),
                Container(
                    height: height / 15,
                    width: width / 2.2,
                    color: DayTaskcolor.textfield,
                    child: Padding(
                      padding: EdgeInsets.only(right: width / 36),
                      child: Row(
                        children: [
                          Container(
                            height: height / 15,
                            width: height / 15,
                            color: DayTaskcolor.yellow,
                            child: Padding(
                              padding: const EdgeInsets.all(12),
                              child: SvgPicture.asset(
                                DayTaskSvgIcons.calendar1,
                                height: height / 30,
                                colorFilter:
                                const ColorFilter.mode(DayTaskcolor.black, BlendMode.srcIn),
                              ),
                            ),
                          ),
                          SizedBox(
                            width: width / 46,
                          ),
                          Text(
                            "15/11/2022".tr,
                            style: intermedium.copyWith(
                                fontSize: 18, color: DayTaskcolor.white),
                          ),
                        ],
                      ),
                    )),
              ],
            ),SizedBox(
              height: height / 16,
            ),
            Center(
              child: Text(
                "Add_New".tr,
                style: intermedium.copyWith(
                    fontSize: 18),
              ),
            ),
            const Spacer(),
            Container(
              height: height / 15,
              color: DayTaskcolor.yellow,
              child: Center(
                child: Text(
                  "Create".tr,
                  style: intersemibold.copyWith(
                    fontSize: 18,
                    color: DayTaskcolor.black,
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
