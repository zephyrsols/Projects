import 'package:daytask/daytask_globalclass/daytask_color.dart';
import 'package:daytask/daytask_globalclass/daytask_fonts.dart';
import 'package:daytask/daytask_globalclass/daytask_images.dart';
import 'package:daytask/daytask_pages/daytask_home/daytask_taskdetails.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class DayTaskHome extends StatefulWidget {
  const DayTaskHome({super.key});

  @override
  State<DayTaskHome> createState() => _DayTaskHomeState();
}

class _DayTaskHomeState extends State<DayTaskHome> {
  dynamic size;
  double height = 0.00;
  double width = 0.00;

  int selected = 0;

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
          padding: EdgeInsets.symmetric(horizontal: width / 26),
          child: Row(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Welcome_Back".tr,
                    style: intermedium.copyWith(
                        fontSize: 11.79, color: DayTaskcolor.yellow),
                  ),
                  Text(
                    "Fazil Laghari".tr,
                    style: interbold.copyWith(
                        fontSize: 22),
                  ),
                ],
              ),
              const Spacer(),
              Image.asset(
                DayTaskPngImg.profile,
                height: height / 18,
              ),
            ],
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(
              horizontal: width / 36, vertical: height / 36),
          child: Column(
            children: [
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
                        fillColor: DayTaskcolor.textfield,
                        prefixIcon: Padding(
                          padding: const EdgeInsets.all(14),
                          child: SvgPicture.asset(
                            DayTaskSvgIcons.search,
                            height: height / 96,
                          ),
                        ),
                        hintText: "Seach tasks".tr,
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
                    color: DayTaskcolor.yellow,
                    child: Padding(
                      padding: const EdgeInsets.all(14),
                      child: SvgPicture.asset(
                        DayTaskSvgIcons.filter,
                        height: height / 36,
                      ),
                    ),
                  )
                ],
              ),
              SizedBox(
                height: height / 36,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Completed_Tasks".tr,
                    style: intersemibold.copyWith(
                        fontSize: 20),
                  ),
                  Text(
                    "See_all".tr,
                    style: interregular.copyWith(
                        fontSize: 16, color: DayTaskcolor.yellow),
                  ),
                ],
              ),
              SizedBox(
                height: height / 56,
              ),
              SizedBox(
                height: height / 5,
                child: ListView.separated(
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      return InkWell(
                        splashColor: DayTaskcolor.transparent,
                        highlightColor: DayTaskcolor.transparent,
                        onTap: () {
                          setState(() {
                            selected = index;
                            Navigator.push(context, MaterialPageRoute(
                              builder: (context) {
                                return const DayTaskTaskDetails();
                              },
                            ));
                          });
                        },
                        child: Container(
                          height: height / 5,
                          width: width / 2.4,
                          color: selected == index
                              ? DayTaskcolor.yellow
                              : DayTaskcolor.textfield,
                          child: Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: width / 36, vertical: height / 96),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Real Estate\nWebsite\nDesign".tr,
                                  style: intersemibold.copyWith(
                                      fontSize: 20,
                                      color: selected == index
                                          ? DayTaskcolor.black
                                          : DayTaskcolor.white),
                                ),
                                SizedBox(
                                  height: height / 96,
                                ),
                                Row(
                                  children: [
                                    Text(
                                      "Team members",
                                      style: interregular.copyWith(
                                          fontSize: 11,
                                          color: selected == index
                                              ? DayTaskcolor.black
                                              : DayTaskcolor.white),
                                    ),
                                    const Spacer(),
                                    Image.asset(
                                      DayTaskPngImg.photos,
                                      height: height / 46,
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: height / 96,
                                ),
                                Row(
                                  children: [
                                    Text(
                                      "Completed",
                                      style: interregular.copyWith(
                                          fontSize: 11,
                                          color: selected == index
                                              ? DayTaskcolor.black
                                              : DayTaskcolor.white),
                                    ),
                                    const Spacer(),
                                    Text(
                                      "100%",
                                      style: intersemibold.copyWith(
                                          fontSize: 9,
                                          color: selected == index
                                              ? DayTaskcolor.black
                                              : DayTaskcolor.white),
                                    ),
                                  ],
                                ),
                                Divider(
                                  thickness: height / 200,
                                  color: selected == index
                                      ? DayTaskcolor.dashboard
                                      : DayTaskcolor.white,
                                )
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                    separatorBuilder: (context, index) {
                      return Container(
                        width: width / 36,
                      );
                    },
                    itemCount: 5),
              ),
              SizedBox(
                height: height / 36,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Ongoing_Projects".tr,
                    style: intersemibold.copyWith(
                        fontSize: 20),
                  ),
                  Text(
                    "See_all".tr,
                    style: interregular.copyWith(
                        fontSize: 16, color: DayTaskcolor.yellow),
                  ),
                ],
              ),
              SizedBox(
                height: height / 56,
              ),
              ListView.separated(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) {
                    return Container(
                      color: DayTaskcolor.textfield,
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: width / 36, vertical: height / 96),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Real Estate App Design".tr,
                              style: intersemibold.copyWith(
                                  fontSize: 20, color: DayTaskcolor.white),
                            ),
                            SizedBox(
                              height: height / 96,
                            ),
                            Row(
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Team members",
                                      style: interregular.copyWith(
                                          fontSize: 14,
                                          color: DayTaskcolor.white),
                                    ),
                                    SizedBox(
                                      height: height / 200,
                                    ),
                                    Image.asset(
                                      DayTaskPngImg.photos,
                                      height: height / 46,
                                    ),
                                    SizedBox(
                                      height: height / 120,
                                    ),
                                    Text(
                                      "Due on : 21 March",
                                      style: interregular.copyWith(
                                          fontSize: 14,
                                          color: DayTaskcolor.white),
                                    ),
                                  ],
                                ),
                                const Spacer(),
                                Image.asset(
                                  DayTaskPngImg.timingslot,
                                  height: height / 10,
                                ),
                              ],
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
                  itemCount: 4)
            ],
          ),
        ),
      ),
    );
  }
}
