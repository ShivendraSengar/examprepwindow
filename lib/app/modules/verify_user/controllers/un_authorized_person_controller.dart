import 'dart:developer';

import 'package:exam_prep_tool/app/data/irepositry/ilogin_repo.dart';
import 'package:exam_prep_tool/app/data/params/send_otp_params.dart';
import 'package:exam_prep_tool/app/data/repositry/login_repo.dart';
import 'package:exam_prep_tool/app/routes/app_pages.dart';
import 'package:exam_prep_tool/app/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UnAuthorizedPersonController extends GetxController {
  TextEditingController mobile = TextEditingController();
  final LoginRepo repositry = LoginRepoImpl();

  sendotp() async {
    try {
      final param = SendOtpParams()..email = mobile.text;
      final response = await repositry.sendotprespo(param);
      if (response.data != null) {
        print(response.data!.email);
        print(mobile);
        showToastMessage('SUCESS', 'send mesggae succes');
        Get.toNamed(Routes.OTP_SCREEN, arguments: [
          response.data!.email,
          mobile.text,
        ]);
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
