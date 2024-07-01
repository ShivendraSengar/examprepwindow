import 'dart:developer';

import 'package:exam_prep_tool/app/data/irepositry/ilogin_repo.dart';
import 'package:exam_prep_tool/app/data/params/otpparams.dart';
import 'package:exam_prep_tool/app/data/repositry/login_repo.dart';
import 'package:exam_prep_tool/app/modules/forgetpass_screen/controllers/forgetpass_screen_controller.dart';

import 'package:exam_prep_tool/app/routes/app_pages.dart';
import 'package:exam_prep_tool/app/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OtpScreenController extends GetxController {
  final TextEditingController otp = TextEditingController();
  final email = Get.arguments;
  final LoginRepo repositry = LoginRepoImpl();

  otpverify() async {
    try {
      final param = Otpparams()
        ..mobile = email[1].toString()
        ..otp = otp.text;
      final response = await repositry.otpverify(param);
      if (response.data != null) {
        showToastMessage('SUCESS', 'send mesggae succes');
        Get.toNamed(Routes.LOGIN_SCREEN);
      }
    } catch (err) {
      log("err${err}");
    }
  }

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }
}
