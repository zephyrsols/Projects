import 'package:daytask/daytask_globalclass/daytask_color.dart';
import 'package:daytask/daytask_globalclass/daytask_fonts.dart';
import 'package:daytask/daytask_globalclass/daytask_images.dart';
import 'package:daytask/daytask_pages/daytask_chat/daytask_chatdetails.dart';
import 'package:daytask/daytask_theme/daytask_themecontroller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class DayTaskNewMessage extends StatefulWidget {
  const DayTaskNewMessage({super.key});

  @override
  State<DayTaskNewMessage> createState() => _DayTaskNewMessageState();
}

class _DayTaskNewMessageState extends State<DayTaskNewMessage> {
  dynamic size;
  double height = 0.00;
  double width = 0.00;
  final themedata = Get.put(DayTaskThemecontroler());

  List img = [
    DayTaskPngImg.creategroup,
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
  List title = [
    "Create a group",
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
          "New_Message".tr,
          style: intermedium.copyWith(fontSize: 20),
        ),
        actions: [
          SvgPicture.asset(
            DayTaskSvgIcons.search,
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
          child: ListView.separated(
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
                        img[index],
                        height: height / 18,
                      ),
                      SizedBox(
                        width: width / 36,
                      ),
                      Text(
                        title[index],
                        style: intersemibold.copyWith(
                            fontSize: 14),
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
        ),
      ),
    );
  }
}
