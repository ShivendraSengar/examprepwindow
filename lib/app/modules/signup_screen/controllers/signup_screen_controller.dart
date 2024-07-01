import 'dart:developer';

import 'package:exam_prep_tool/app/data/irepositry/ilogin_repo.dart';
import 'package:exam_prep_tool/app/data/params/signup_params.dart';
import 'package:exam_prep_tool/app/data/repositry/login_repo.dart';
import 'package:exam_prep_tool/app/routes/app_pages.dart';
import 'package:exam_prep_tool/app/utils/utils.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class SignupScreenController extends GetxController {
  final TextEditingController name = TextEditingController();
  final TextEditingController email = TextEditingController();
  final TextEditingController phone = TextEditingController();
  final TextEditingController referral = TextEditingController();
  //final password = TextEditingController();
  //final confirmpass = TextEditingController();
  Rx<TextEditingController> password =
      TextEditingController(text: kDebugMode ? "" : "").obs;

  Rx<TextEditingController> confirmpass =
      TextEditingController(text: kDebugMode ? "" : "").obs;

  final LoginRepo repositry = LoginRepoImpl();
  RxBool isLoading = false.obs;
  //final RxBool isPasswordValid = false.obs;
  final passwordVisible = false.obs;

// var password = ''.obs;

  // Validation flags
  var isPasswordEmpty = true.obs;
  var isPasswordValid = true.obs;

  // Function to validate password
  void validatePassword(String value) {
    isPasswordEmpty(value.isEmpty);
    isPasswordValid(_isPasswordValid(value));
  }

  // Function to check if the password meets the criteria
  bool _isPasswordValid(String value) {
    // Implement your password validation logic here
    // Example: Minimum 8 characters, at least one uppercase, one lowercase, one number, and one special character
    RegExp passwordRegex =
        RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$');
    return passwordRegex.hasMatch(value);
  }

  signup() async {
    try {
      final param = SignupParams()
        ..email = email.text
        ..name = name.text
        ..mobile = phone.text
        ..password = password.value.text
        ..referral = referral.text ?? '';
      final response = await repositry.signup(param);
      if (response.data != null) {
        showToastMessage('SUCESS', 'send mesggae succes');
        Get.toNamed(Routes.OTP_SCREEN);
      }
    } catch (err) {
      log("err${err}");
    }
  }

  final count = 0.obs;
  @override
  void onInit() {
    super.onInit();
  }

  resetPassword() {
    if (password.value.text.isBlank == true ||
        confirmpass.value.text.isBlank == true) {
      Get.snackbar(
        "Error",
        "Fields required",
      );
      return;
    }
    if (password.value.text != confirmpass.value.text) {
      Get.snackbar(
        "Error",
        "Password doesn't match",
      );
      return;
    }
    if (password.value.text.length < 8) {
      Get.snackbar(
        "Error",
        "Password is not long enough min 10 characters is required",
        backgroundColor: Colors.red,
      );
      return;
    }
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    name.clear();
    email.clear();
    phone.clear();
    password.value.clear();
    confirmpass.value.clear();
    super.onClose();
  }

  void increment() => count.value++;
}
