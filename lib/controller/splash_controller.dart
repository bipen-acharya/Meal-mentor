import 'dart:async';

import 'package:get/get.dart';
import 'package:meal_mentor/views/auth/login.dart';

class SplashController extends GetxController {
  void onInit() {
    super.onInit();
    Timer(const Duration(seconds: 3), () async {
      Get.off(() => LoginScreen());
    });
  }
}
