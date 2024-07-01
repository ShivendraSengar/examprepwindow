import 'dart:developer';

import 'package:exam_prep_tool/app/data/irepositry/ilogin_repo.dart';
import 'package:exam_prep_tool/app/data/repositry/login_repo.dart';
import 'package:get/get.dart';
//import 'package:exam_prep_tool/app/data/irepositry/ilogin_repositry.dart';
import 'package:exam_prep_tool/app/data/params/send_otp_params.dart';
//import 'package:exam_prep_tool/app/data/repositry/login_repositry.dart';
import 'package:exam_prep_tool/app/routes/app_pages.dart';
import 'package:exam_prep_tool/app/utils/utils.dart';
import 'package:flutter/material.dart';

class ForgetpassScreenController extends GetxController {
  final TextEditingController mobilenumber = TextEditingController();

  final LoginRepo repositry = LoginRepoImpl();

  sendotp() async {
    try {
      final param = SendOtpParams()..email = mobilenumber.text;
      final response = await repositry.sendotprespo(param);
      if (response.data != null) {
        log(response.data!.email.toString());
        log("mobile number${mobilenumber.text}");
        showToastMessage('SUCESS', 'send mesggae succes');

        Get.toNamed(Routes.RESETPASS_SCREEN, arguments: [
          response.data!.email,
          mobilenumber.text,
        ]);
        mobilenumber.clear();
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
    mobilenumber.clear();
    super.onClose();
  }
}
