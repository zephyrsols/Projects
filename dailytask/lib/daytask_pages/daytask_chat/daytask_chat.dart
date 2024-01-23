import 'package:daytask/daytask_globalclass/daytask_color.dart';
import 'package:daytask/daytask_globalclass/daytask_fonts.dart';
import 'package:daytask/daytask_globalclass/daytask_images.dart';
import 'package:daytask/daytask_pages/daytask_chat/daytask_chatdetails.dart';
import 'package:daytask/daytask_pages/daytask_chat/daytask_newmessage.dart';
import 'package:daytask/daytask_theme/daytask_themecontroller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class DayTaskChat extends StatefulWidget {
  const DayTaskChat({super.key});

  @override
  State<DayTaskChat> createState() => _DayTaskChatState();
}

class _DayTaskChatState extends State<DayTaskChat> {
  dynamic size;
  double height = 0.00;
  double width = 0.00;
  final themedata = Get.put(DayTaskThemecontroler());

  List title = ["Chat", "Groups"];
  int selected = 0;

  List img1 = [
    DayTaskPngImg.profile,
    DayTaskPngImg.profile1,
    DayTaskPngImg.profile2,
    DayTaskPngImg.profile3,
    DayTaskPngImg.profile4,
    DayTaskPngImg.profile5,
  ];
  List title1 = [
    "Olivia Anna",
    "Emna",
    "Robert Brown",
    "James",
    "Sophia",
    "Isabella"
  ];

  List img2 = [
    DayTaskPngImg.profile,
    DayTaskPngImg.profile1,
    DayTaskPngImg.profile2,
    DayTaskPngImg.profile3,
    DayTaskPngImg.profile4,
    DayTaskPngImg.profile5,
    DayTaskPngImg.profile,
    DayTaskPngImg.profile1,
    DayTaskPngImg.profile2,
    DayTaskPngImg.profile3,
    DayTaskPngImg.profile4,
    DayTaskPngImg.profile5,
  ];
  List title2 = [
    "Olivia Anna",
    "Emna",
    "Robert Brown",
    "James",
    "Sophia",
    "Isabella",
    "Olivia Anna",
    "Emna",
    "Robert Brown",
    "James",
    "Sophia",
    "Isabella"
  ];

  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    height = size.height;
    width = size.width;
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text(
          "Messages".tr,
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
          padding:
              EdgeInsets.symmetric(horizontal: width / 36, vertical: height / 36),
          child: Column(
            children: [
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
                          width: width / 2.2,
                          color: selected == index
                              ? DayTaskcolor.yellow
                              : DayTaskcolor.dashboard,
                          child: Center(
                            child: Text(
                              title[index],
                              style: intermedium.copyWith(
                                  fontSize: 14,
                                  color: selected == index
                                      ? DayTaskcolor.black
                                      : DayTaskcolor.white),
                            ),
                          ),
                        ),
                      );
                    },
                    separatorBuilder: (context, index) {
                      return Container(
                        width: width / 26,
                      );
                    },
                    itemCount: title.length),
              ),
              SizedBox(
                height: height / 26,
              ),
              if (selected == 0) ...[
                ListView.separated(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemBuilder: (context, index) {
                      return InkWell(
                        splashColor: DayTaskcolor.transparent,
                        highlightColor: DayTaskcolor.transparent,
                        onTap: () {
                          Navigator.push(context, MaterialPageRoute(
                            builder: (context) {
                              return const DayTaskChatDetails();
                            },
                          ));
                        },
                        child: Row(
                          children: [
                            Image.asset(
                              img1[index],
                              height: height / 18,
                            ),
                            SizedBox(
                              width: width / 36,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  title1[index],
                                  style: intersemibold.copyWith(
                                      fontSize: 14),
                                ),
                                Text(
                                  "Hi, please check the last task, that I....".tr,
                                  style: interregular.copyWith(
                                      fontSize: 14,
                                      color: DayTaskcolor.textcolor),
                                ),
                              ],
                            ),
                            const Spacer(),
                            Text(
                              "43 min".tr,
                              style: intersemibold.copyWith(
                                  fontSize: 8, color: DayTaskcolor.white),
                            ),
                          ],
                        ),
                      );
                    },
                    separatorBuilder: (context, index) {
                      return Container(
                        height: height / 30,
                      );
                    },
                    itemCount: img1.length),
                SizedBox(
                  height: height / 20,
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
                            return const DayTaskNewMessage();
                          },
                        ));
                      },
                      child: Container(
                        height: height / 15,
                        width: width / 2.2,
                        color: DayTaskcolor.yellow,
                        child: Center(
                          child: Text(
                            "Start chat",
                            style: intermedium.copyWith(
                                fontSize: 16, color: DayTaskcolor.black),
                          ),
                        ),
                      ),
                    ),
                  ],
                )
              ],
              if (selected == 1) ...[
                ListView.separated(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemBuilder: (context, index) {
                      return InkWell(
                        splashColor: DayTaskcolor.transparent,
                        highlightColor: DayTaskcolor.transparent,
                        onTap: () {
                          Navigator.push(context, MaterialPageRoute(
                            builder: (context) {
                              return const DayTaskChatDetails();
                            },
                          ));
                        },
                        child: Row(
                          children: [
                            Image.asset(
                              img2[index],
                              height: height / 18,
                            ),
                            SizedBox(
                              width: width / 36,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  title2[index],
                                  style: intersemibold.copyWith(
                                      fontSize: 14),
                                ),
                                Text(
                                  "Hi, please check the last task, that I...."
                                      .tr,
                                  style: interregular.copyWith(
                                      fontSize: 14,
                                      color: DayTaskcolor.textcolor),
                                ),
                              ],
                            ),
                            const Spacer(),
                            Text(
                              "43 min".tr,
                              style: intersemibold.copyWith(
                                  fontSize: 8, color: DayTaskcolor.white),
                            ),
                          ],
                        ),
                      );
                    },
                    separatorBuilder: (context, index) {
                      return Container(
                        height: height / 30,
                      );
                    },
                    itemCount: img2.length),
              ]
            ],
          ),
        ),
      ),
    );
  }
}
