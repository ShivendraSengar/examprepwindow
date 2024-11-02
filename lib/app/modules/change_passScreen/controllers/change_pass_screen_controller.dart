import 'dart:developer';

import 'package:exam_prep_tool/app/data/irepositry/ilogin_repo.dart';
import 'package:exam_prep_tool/app/data/params/changepass_params.dart';
import 'package:exam_prep_tool/app/data/repositry/login_repo.dart';
import 'package:exam_prep_tool/app/modules/login_screen/controllers/login_screen_controller.dart';
import 'package:exam_prep_tool/app/routes/app_pages.dart';
import 'package:exam_prep_tool/app/utils/pref_utis.dart';
import 'package:exam_prep_tool/app/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ChangePassScreenController extends GetxController {
  TextEditingController oldpass = TextEditingController();
  TextEditingController newpass = TextEditingController();
  TextEditingController confirmnewpass = TextEditingController();
  final LoginRepo repositry = LoginRepoImpl();
  RxBool isLoading = false.obs;
  final PrefUtils prefutils = Get.find();

  final LoginScreenController logincontroller = Get.find();
  final count = 0.obs;
  void changepassword() async {
    try {
      final params = ChangepassParams()
        ..email = logincontroller.email.text
        ..password = oldpass.text
        ..newPassword = newpass.text
        ..reNewpassword = confirmnewpass.text;

      var response = await repositry.changepassword(
          params, 'Bearer ${prefutils.getToken().toString()}');
      if (response.data != null) {
        showToastMessage('SUCCESS', 'send message success');
        Get.toNamed(Routes.HOME);
      }
      isLoading.value = false;
    } catch (e) {
      return log(e.toString());
    }
  }

  @override
  void onInit() {
    //print("aaa${email.toString()}");
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

  void increment() => count.value++;
}
