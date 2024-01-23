import 'package:daytask/daytask_globalclass/daytask_color.dart';
import 'package:daytask/daytask_globalclass/daytask_fonts.dart';
import 'package:daytask/daytask_globalclass/daytask_images.dart';
import 'package:daytask/daytask_pages/daytask_calender/daytask_calender.dart';
import 'package:daytask/daytask_pages/daytask_chat/daytask_chat.dart';
import 'package:daytask/daytask_pages/daytask_home/daytask_home.dart';
import 'package:daytask/daytask_pages/daytask_notification/daytask_notification.dart';
import 'package:daytask/daytask_theme/daytask_themecontroller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

// ignore: must_be_immutable
class DayTaskDashboard extends StatefulWidget {
  String? index;

  DayTaskDashboard(this.index, {super.key});

  @override
  State<DayTaskDashboard> createState() => _DayTaskDashboardState();
}

class _DayTaskDashboardState extends State<DayTaskDashboard> {
  dynamic size;
  double height = 0.00;
  double width = 0.00;
  final themedata = Get.put(DayTaskThemecontroler());

  int _selectedItemIndex = 0;

  final List<Widget> _pages = const [
    DayTaskHome(),
    DayTaskChat(),
    DayTaskCalender(),
    DayTaskNotification(),
  ];

  @override
  void initState() {
    super.initState();
  }

  @override
  void setState(fn) {
    if (mounted) super.setState(fn);
  }

  void _onTap(int index) {
    setState(() {
      _selectedItemIndex = index;
    });
  }

  Widget _bottomTabBar() {
    return BottomNavigationBar(
      currentIndex: _selectedItemIndex,
      onTap: _onTap,
      type: BottomNavigationBarType.fixed,
      backgroundColor: themedata.isdark ? DayTaskcolor.dashboard : DayTaskcolor.white,
      selectedLabelStyle: interregular.copyWith(fontSize: 10),
      unselectedLabelStyle: interregular.copyWith(fontSize: 10),
      selectedItemColor: DayTaskcolor.yellow,
      unselectedItemColor: DayTaskcolor.iconcolor,
      elevation: 0,
      items: <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: SvgPicture.asset(
            DayTaskSvgIcons.home,
            height: height / 36,
          ),
          activeIcon: SvgPicture.asset(
            DayTaskSvgIcons.home,
            height: height / 36,
            colorFilter: ColorFilter.mode(DayTaskcolor.yellow, BlendMode.srcIn),
          ),
          label: "Home",
        ),
        BottomNavigationBarItem(
          icon: SvgPicture.asset(
            DayTaskSvgIcons.chat,
            height: height / 36,
          ),
          activeIcon: SvgPicture.asset(
            DayTaskSvgIcons.chat,
            height: height / 36,
            colorFilter: ColorFilter.mode(DayTaskcolor.yellow, BlendMode.srcIn),
          ),
          label: "Chat",
        ),
        BottomNavigationBarItem(
          icon: SvgPicture.asset(
            DayTaskSvgIcons.calendar,
            height: height / 36,
          ),
          activeIcon: SvgPicture.asset(
            DayTaskSvgIcons.calendar,
            height: height / 36,
            colorFilter: ColorFilter.mode(DayTaskcolor.yellow, BlendMode.srcIn),
          ),
          label: "Calender",
        ),
        BottomNavigationBarItem(
          icon: SvgPicture.asset(
            DayTaskSvgIcons.notification,
            height: height / 36,
          ),
          activeIcon: SvgPicture.asset(
            DayTaskSvgIcons.notification,
            colorFilter: ColorFilter.mode(DayTaskcolor.yellow, BlendMode.srcIn),
            height: height / 36,
          ),
          label: "Notification",
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    height = size.height;
    width = size.width;
    return Scaffold(
      bottomNavigationBar: _bottomTabBar(),
      body: _pages[_selectedItemIndex],
    );
  }
}
