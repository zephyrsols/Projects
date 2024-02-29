import 'package:daytask/daytask_globalclass/daytask_color.dart';
import 'package:daytask/daytask_globalclass/daytask_fonts.dart';
import 'package:daytask/daytask_globalclass/daytask_images.dart';
import 'package:daytask/daytask_pages/daytask_notification/daytask_profile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class DayTaskNotification extends StatefulWidget {
  const DayTaskNotification({super.key});

  @override
  State<DayTaskNotification> createState() => _DayTaskNotificationState();
}

class _DayTaskNotificationState extends State<DayTaskNotification> {
  dynamic size;
  double height = 0.00;
  double width = 0.00;

  List img = [
    DayTaskPngImg.profile,
    DayTaskPngImg.profile1,
    DayTaskPngImg.profile2,
    DayTaskPngImg.profile3,
  ];
  List title = [
    "Olivia Anna",
    "Emna",
    "Robert Brown",
    "James",
  ];

  List img1 = [
    DayTaskPngImg.profile3,
    DayTaskPngImg.profile4,
    DayTaskPngImg.profile5,
  ];
  List title1 = ["James", "Sophia", "Isabella"];

  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    height = size.height;
    width = size.width;
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text(
          "Notification".tr,
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
              "New".tr,
              style:
                  intermedium.copyWith(fontSize: 20),
            ),
            SizedBox(
              height: height / 56,
            ),
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
                          return const DayTaskProfile();
                        },
                      ));
                    },
                    child: Row(
                      children: [
                        Image.asset(
                          img[index],
                          height: height / 18,
                        ),
                        SizedBox(
                          width: width / 36,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Text(
                                  title[index],
                                  style: intersemibold.copyWith(
                                      fontSize: 14),
                                ),
                                Text(
                                  " left a comment in task",
                                  style: interregular.copyWith(
                                      fontSize: 14,
                                      color: DayTaskcolor.textcolor),
                                ),
                              ],
                            ),
                            Text(
                              "Mobile App Design Project".tr,
                              style: interregular.copyWith(
                                  fontSize: 14, color: DayTaskcolor.yellow),
                            ),
                          ],
                        ),
                        const Spacer(),
                        Text(
                          "43 min".tr,
                          style: intersemibold.copyWith(
                              fontSize: 8),
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
                itemCount: img.length),
            SizedBox(
              height: height / 36,
            ),
            Text(
              "Earlier".tr,
              style:
                  intermedium.copyWith(fontSize: 20),
            ),
            SizedBox(
              height: height / 56,
            ),
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
                          return const DayTaskProfile();
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
                            Row(
                              children: [
                                Text(
                                  title1[index],
                                  style: intersemibold.copyWith(
                                      fontSize: 14),
                                ),
                                Text(
                                  " left a comment in task",
                                  style: interregular.copyWith(
                                      fontSize: 14,
                                      color: DayTaskcolor.textcolor),
                                ),
                              ],
                            ),
                            Text(
                              "Mobile App Design Project".tr,
                              style: interregular.copyWith(
                                  fontSize: 14, color: DayTaskcolor.yellow),
                            ),
                          ],
                        ),
                        const Spacer(),
                        Text(
                          "43 min".tr,
                          style: intersemibold.copyWith(
                              fontSize: 8),
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
          ],
        ),
      ),
    );
  }
}
