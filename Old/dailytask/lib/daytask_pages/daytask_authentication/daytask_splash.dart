import 'package:daytask/daytask_globalclass/daytask_images.dart';
import 'package:daytask/daytask_pages/daytask_authentication/daytask_welcome.dart';
import 'package:flutter/material.dart';

class DayTaskSplash extends StatefulWidget {
  const DayTaskSplash({Key? key}) : super(key: key);

  @override
  State<DayTaskSplash> createState() => _DayTaskSplashState();
}

class _DayTaskSplashState extends State<DayTaskSplash> {
  @override
  void initState() {
    super.initState();
    goup();
  }

  goup() async {
    var navigator = Navigator.of(context);
    await Future.delayed(const Duration(seconds: 5));
    navigator.push(MaterialPageRoute(
      builder: (context) {
        return const DayTaskWelcome();
      },
    ));
  }

  dynamic size;
  double height = 0.00;
  double width = 0.00;

  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    height = size.height;
    width = size.width;
    return Scaffold(
      body: Center(
          child: Image.asset(
        DayTaskPngImg.splash,
        height: height / 6,
        fit: BoxFit.fitHeight,
      )),
    );
  }
}
