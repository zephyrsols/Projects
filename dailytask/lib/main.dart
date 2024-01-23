import 'package:daytask/daytask_pages/daytask_authentication/daytask_splash.dart';
import 'package:daytask/daytask_string/stringtranslation.dart';
import 'package:daytask/daytask_theme/daytask_theme.dart';
import 'package:daytask/daytask_theme/daytask_themecontroller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final themedata = Get.put(DayTaskThemecontroler());

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: themedata.isdark
          ? DayTaskMythemes.darkTheme
          : DayTaskMythemes.lightTheme,
      fallbackLocale: const Locale('en', 'US'),
      translations: Apptranslation(),
      locale: const Locale('en', 'US'),
      home: const DayTaskSplash(),
    );
  }
}
