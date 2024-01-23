import 'package:daytask/daytask_globalclass/daytask_prefs.dart';
import 'package:daytask/daytask_theme/daytask_theme.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DayTaskThemecontroler extends GetxController {
  @override
  void onInit() {
    SharedPreferences.getInstance().then((value) {
      isdark = value.getBool(isDarkMode)!;
    });
    update();
    super.onInit();
  }

  var isdark = false;

  Future<void> changeTheme(state) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    isdark = prefs.getBool(isDarkMode) ?? true;
    isdark = !isdark;

    if (state == true) {
      Get.changeTheme(DayTaskMythemes.darkTheme);
      isdark = true;
    } else {
      Get.changeTheme(DayTaskMythemes.lightTheme);
      isdark = false;
    }
    update();
  }
}
