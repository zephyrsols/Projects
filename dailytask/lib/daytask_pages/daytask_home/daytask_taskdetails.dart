import 'package:daytask/daytask_globalclass/daytask_color.dart';
import 'package:daytask/daytask_globalclass/daytask_fonts.dart';
import 'package:daytask/daytask_globalclass/daytask_images.dart';
import 'package:daytask/daytask_theme/daytask_themecontroller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class DayTaskTaskDetails extends StatefulWidget {
  const DayTaskTaskDetails({super.key});

  @override
  State<DayTaskTaskDetails> createState() => _DayTaskTaskDetailsState();
}

class _DayTaskTaskDetailsState extends State<DayTaskTaskDetails> {
  dynamic size;
  double height = 0.00;
  double width = 0.00;
  final themedata = Get.put(DayTaskThemecontroler());

  List title = [
    "User Interviews",
    "Wireframes",
    "Design System",
    "Icons",
    "Final Mockups"
  ];
  int selected = 0;

  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    height = size.height;
    width = size.width;
    return Scaffold(
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
          "Task_Details".tr,
          style: intermedium.copyWith(fontSize: 20),
        ),
        actions: [
          SvgPicture.asset(
            DayTaskSvgIcons.edit,
            height: height / 36,
            colorFilter: ColorFilter.mode(
                themedata.isdark
                    ? DayTaskcolor.white
                    : DayTaskcolor.black,
                BlendMode.srcIn),
          ),
          SizedBox(
            width: width / 36,
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(
              horizontal: width / 36, vertical: height / 36),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Real Estate App Design".tr,
                style: intersemibold.copyWith(
                    fontSize: 20),
              ),
              SizedBox(
                height: height / 36,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Container(
                        height: height / 17,
                        width: height / 17,
                        color: DayTaskcolor.yellow,
                        child: Padding(
                          padding: const EdgeInsets.all(12),
                          child: SvgPicture.asset(
                            DayTaskSvgIcons.calendarremove,
                            height: height / 36,
                          ),
                        ),
                      ),
                      SizedBox(
                        width: width / 36,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Due Date".tr,
                            style: intermedium.copyWith(
                                fontSize: 11, color: DayTaskcolor.textcolor),
                          ),
                          SizedBox(
                            height: height / 200,
                          ),
                          Text(
                            "20 June".tr,
                            style: intersemibold.copyWith(
                                fontSize: 17),
                          ),
                        ],
                      )
                    ],
                  ),
                  Row(
                    children: [
                      Container(
                        height: height / 17,
                        width: height / 17,
                        color: DayTaskcolor.yellow,
                        child: Padding(
                          padding: const EdgeInsets.all(12),
                          child: SvgPicture.asset(
                            DayTaskSvgIcons.profile2user,
                            height: height / 36,
                          ),
                        ),
                      ),
                      SizedBox(
                        width: width / 36,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Project Team".tr,
                            style: intermedium.copyWith(
                                fontSize: 11, color: DayTaskcolor.textcolor),
                          ),
                          SizedBox(
                            height: height / 200,
                          ),
                          Image.asset(
                            DayTaskPngImg.photos,
                            height: height / 40,
                          ),
                        ],
                      )
                    ],
                  ),
                ],
              ),
              SizedBox(
                height: height / 36,
              ),
              Text(
                "Project_Details".tr,
                style: intermedium.copyWith(
                    fontSize: 18),
              ),
              SizedBox(
                height: height / 56,
              ),
              Text(
                "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled"
                    .tr,
                style: interregular.copyWith(
                    fontSize: 12, color: DayTaskcolor.textcolor),
              ),
              SizedBox(
                height: height / 96,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Project_Progress".tr,
                    style: intermedium.copyWith(
                        fontSize: 18),
                  ),
                  Image.asset(
                    themedata.isdark ? DayTaskPngImg.timingslot : DayTaskPngImg.timingslotdark,
                    height: height / 10,
                  ),
                ],
              ),
              SizedBox(
                height: height / 96,
              ),
              Text(
                "All_Tasks".tr,
                style: intermedium.copyWith(
                    fontSize: 18),
              ),
              SizedBox(
                height: height / 56,
              ),
              ListView.separated(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) {
                    return Container(
                      height: height / 15,
                      color: DayTaskcolor.textfield,
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: width / 36),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              title[index],
                              style: intermedium.copyWith(
                                  fontSize: 18, color: DayTaskcolor.white),
                            ),
                            InkWell(
                              splashColor: DayTaskcolor.transparent,
                              highlightColor: DayTaskcolor.transparent,
                              onTap: () {
                                setState(() {
                                  selected = index;
                                });
                              },
                              child: Container(
                                height: height / 20,
                                width: height / 20,
                                color: DayTaskcolor.yellow,
                                child: Icon(
                                  selected == index
                                      ? Icons.check_circle_outlined
                                      : Icons.circle_outlined,
                                  size: height / 36,
                                  color: DayTaskcolor.black,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                  separatorBuilder: (context, index) {
                    return Container(
                      height: height / 56,
                    );
                  },
                  itemCount: title.length)
            ],
          ),
        ),
      ),
    );
  }
}
