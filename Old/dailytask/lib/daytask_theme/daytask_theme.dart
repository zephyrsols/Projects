import 'package:daytask/daytask_globalclass/daytask_color.dart';
import 'package:daytask/daytask_globalclass/daytask_fonts.dart';
import 'package:flutter/material.dart';

class DayTaskMythemes {
  static final lightTheme = ThemeData(
    primaryColor: DayTaskcolor.black,
    primarySwatch: Colors.grey,
    textTheme: const TextTheme(),
    fontFamily: 'InterRegular',
    scaffoldBackgroundColor: DayTaskcolor.white,
    appBarTheme: AppBarTheme(
      iconTheme: const IconThemeData(color: DayTaskcolor.black),
      centerTitle: true,
      elevation: 0,
      titleTextStyle: interregular.copyWith(
        color: DayTaskcolor.black,
        fontSize: 16,
      ),
      color: DayTaskcolor.transparent,
    ),
  );

  static final darkTheme = ThemeData(
    fontFamily: 'InterRegular',
    brightness: Brightness.dark,
    scaffoldBackgroundColor: DayTaskcolor.bgcolor,
    appBarTheme: AppBarTheme(
      iconTheme: const IconThemeData(color: DayTaskcolor.white),
      centerTitle: true,
      elevation: 0,
      titleTextStyle: interregular.copyWith(
        color: DayTaskcolor.white,
        fontSize: 15,
      ),
      color: DayTaskcolor.transparent,
    ),
  );
}
