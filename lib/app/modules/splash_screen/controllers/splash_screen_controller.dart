import 'dart:async';
import 'dart:developer';

import 'package:exam_prep_tool/app/routes/app_pages.dart';
import 'package:exam_prep_tool/app/utils/utils.dart';
import 'package:get/get.dart';

class SplashScreenController extends GetxController {
  final count = 0.obs;
  final duration = 4;

  @override
  void onInit() async {
    super.onInit();
    await prefUtils.init();
    log("token ${prefUtils.getToken()}");
    Future.delayed(Duration(seconds: duration), () {
      if (prefUtils.getToken()?.isEmpty == true) {
        Get.offAllNamed(Routes.LOGIN_SCREEN);
      } else {
        Get.toNamed(Routes.LOGIN_SCREEN);
      }
    });
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void increment() => count.value++;
}
