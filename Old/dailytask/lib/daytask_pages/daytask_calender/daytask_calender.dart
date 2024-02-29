import 'package:daytask/daytask_globalclass/daytask_color.dart';
import 'package:daytask/daytask_globalclass/daytask_fonts.dart';
import 'package:daytask/daytask_globalclass/daytask_images.dart';
import 'package:daytask/daytask_pages/daytask_calender/daytask_createnewtask.dart';
import 'package:daytask/daytask_theme/daytask_themecontroller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class DayTaskCalender extends StatefulWidget {
  const DayTaskCalender({super.key});

  @override
  State<DayTaskCalender> createState() => _DayTaskCalenderState();
}

class _DayTaskCalenderState extends State<DayTaskCalender> {
  dynamic size;
  double height = 0.00;
  double width = 0.00;
  final themedata = Get.put(DayTaskThemecontroler());

  List date = [
    "1",
    "2",
    "3",
    "4",
    "5",
    "6",
    "7",
    "8",
    "9",
    "10",
    "11",
    "12",
    "13",
    "14",
    "15",
    "16",
    "17",
    "18",
    "19",
    "20",
    "21",
    "22",
    "23",
    "24",
    "25",
    "26",
    "27",
    "28",
    "29",
    "30",
    "31"
  ];
  List day = [
    "Mon",
    "Tue",
    "Wed",
    "Thu",
    "Fri",
    "Sat",
    "Sun",
    "Mon",
    "Tue",
    "Wed",
    "Thu",
    "Fri",
    "Sat",
    "Sun",
    "Mon",
    "Tue",
    "Wed",
    "Thu",
    "Fri",
    "Sat",
    "Sun",
    "Mon",
    "Tue",
    "Wed",
    "Thu",
    "Fri",
    "Sat",
    "Sun",
    "Mon",
    "Tue",
    "Wed"
  ];
  int selected = 0;

  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    height = size.height;
    width = size.width;
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text(
          "Schedule".tr,
          style: intermedium.copyWith(fontSize: 20),
        ),
        actions: [
          InkWell(
            splashColor: DayTaskcolor.transparent,
            highlightColor: DayTaskcolor.transparent,
            onTap: () {
              Navigator.push(context, MaterialPageRoute(
                builder: (context) {
                  return const DayTaskCreateNewTask();
                },
              ));
            },
            child: SvgPicture.asset(
              DayTaskSvgIcons.addsquare,
              height: height / 36,
              colorFilter: ColorFilter.mode(
                  themedata.isdark
                      ? DayTaskcolor.white
                      : DayTaskcolor.black,
                  BlendMode.srcIn),
            ),
          ),
          SizedBox(
            width: width / 36,
          )
        ],
      ),
      body: Padding(
        padding:
            EdgeInsets.symmetric(horizontal: width / 36, vertical: height / 36),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "November".tr,
              style:
                  intersemibold.copyWith(fontSize: 20),
            ),
            SizedBox(
              height: height / 56,
            ),
            SizedBox(
              height: height / 15,
              child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return InkWell(
                      splashColor: DayTaskcolor.transparent,
                      highlightColor: DayTaskcolor.transparent,
                      onTap: () {
                        setState(() {
                          selected = index;
                        });
                      },
                      child: Container(
                        height: height / 15,
                        width: width / 10,
                        color: selected == index
                            ? DayTaskcolor.yellow
                            : DayTaskcolor.dashboard,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              date[index],
                              style: intersemibold.copyWith(
                                  fontSize: 18.82,
                                  color: selected == index
                                      ? DayTaskcolor.black
                                      : DayTaskcolor.white),
                            ),
                            Text(
                              day[index],
                              style: intermedium.copyWith(
                                  fontSize: 9.41,
                                  color: selected == index
                                      ? DayTaskcolor.black
                                      : DayTaskcolor.white),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                  separatorBuilder: (context, index) {
                    return Container(
                      width: width / 26,
                    );
                  },
                  itemCount: date.length),
            ),
            SizedBox(
              height: height / 36,
            ),
            Text(
              "Today’s Tasks".tr,
              style:
                  intersemibold.copyWith(fontSize: 20),
            ),
            SizedBox(
              height: height / 56,
            ),
            Container(
              height: height / 13,
              width: width / 1,
              color: DayTaskcolor.yellow,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: width / 26),
                child: Row(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "User Interviews",
                          style: intermedium.copyWith(
                              fontSize: 18, color: DayTaskcolor.black),
                        ),
                        Text(
                          "16:00 - 18:30".tr,
                          style: interregular.copyWith(
                              fontSize: 12, color: DayTaskcolor.black),
                        ),
                      ],
                    ),
                    const Spacer(),
                    Image.asset(
                      DayTaskPngImg.photos,
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
              height: height / 13,
              width: width / 1,
              color: DayTaskcolor.dashboard,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: width / 26),
                child: Row(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Wireframe",
                          style: intermedium.copyWith(
                              fontSize: 18, color: DayTaskcolor.white),
                        ),
                        Text(
                          "16:00 - 18:30".tr,
                          style: interregular.copyWith(
                              fontSize: 12, color: DayTaskcolor.white),
                        ),
                      ],
                    ),
                    const Spacer(),
                    Image.asset(
                      DayTaskPngImg.photos,
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
              height: height / 13,
              width: width / 1,
              color: DayTaskcolor.dashboard,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: width / 26),
                child: Row(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Icons",
                          style: intermedium.copyWith(
                              fontSize: 18, color: DayTaskcolor.white),
                        ),
                        Text(
                          "16:00 - 18:30".tr,
                          style: interregular.copyWith(
                              fontSize: 12, color: DayTaskcolor.white),
                        ),
                      ],
                    ),
                    const Spacer(),
                    Image.asset(
                      DayTaskPngImg.profile,
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
              height: height / 13,
              width: width / 1,
              color: DayTaskcolor.dashboard,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: width / 26),
                child: Row(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Mockups",
                          style: intermedium.copyWith(
                              fontSize: 18, color: DayTaskcolor.white),
                        ),
                        Text(
                          "16:00 - 18:30".tr,
                          style: interregular.copyWith(
                              fontSize: 12, color: DayTaskcolor.white),
                        ),
                      ],
                    ),
                    const Spacer(),
                    Image.asset(
                      DayTaskPngImg.photos,
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
              height: height / 13,
              width: width / 1,
              color: DayTaskcolor.dashboard,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: width / 26),
                child: Row(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Testing",
                          style: intermedium.copyWith(
                              fontSize: 18, color: DayTaskcolor.white),
                        ),
                        Text(
                          "16:00 - 18:30".tr,
                          style: interregular.copyWith(
                              fontSize: 12, color: DayTaskcolor.white),
                        ),
                      ],
                    ),
                    const Spacer(),
                    Image.asset(
                      DayTaskPngImg.profile,
                      height: height / 36,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
