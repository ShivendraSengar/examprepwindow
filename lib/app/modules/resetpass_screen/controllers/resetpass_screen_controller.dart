import 'dart:developer';
import 'package:exam_prep_tool/app/data/irepositry/ilogin_repo.dart';
import 'package:exam_prep_tool/app/data/params/forgetpassparams.dart';
import 'package:exam_prep_tool/app/data/repositry/login_repo.dart';
import 'package:exam_prep_tool/app/modules/forgetpass_screen/controllers/forgetpass_screen_controller.dart';
import 'package:exam_prep_tool/app/routes/app_pages.dart';
import 'package:exam_prep_tool/app/utils/const.dart';
import 'package:exam_prep_tool/app/utils/pref_utis.dart';
import 'package:exam_prep_tool/app/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:velocity_x/velocity_x.dart';

class ResetpassScreenController extends GetxController {
  final TextEditingController otp = TextEditingController();
   Rx<TextEditingController> newpassword = TextEditingController().obs;
   Rx<TextEditingController> confirmnewpassword = TextEditingController().obs;
  final ForgetpassScreenController mobilenumber = Get.find();
  final email = Get.arguments;
  final PrefUtils prefUtils = Get.find();
  final LoginRepo repositry = LoginRepoImpl();

  var password = ''.obs;
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

  String obscureEmail(String email) {
    if (email == null || email.isEmpty) {
      return '';
    }

    int atIndex = email.indexOf('@');
    if (atIndex < 0) {
      return email;
    }

    String hiddenPart = email.substring(0, atIndex);
    String visiblePart = email.substring(atIndex);

    // Display only the first and last character of the hidden part
    String obscuredHiddenPart =
        '${hiddenPart[0]}${'*' * (hiddenPart.length - 2)}${hiddenPart[hiddenPart.length - 1]}';

    return obscuredHiddenPart + visiblePart;
  }

  forgetpass() async {
    try {
      final param = Forgetpassparams()
        ..otp = otp.text
        ..confirmPassword = confirmnewpassword.value.text
        ..email = email[1].toString()
        ..newPassword = newpassword.value.text;

      // Print all parameters
      print('OTP: ${param.otp}');
      print('Confirm Password: ${param.confirmPassword}');
      print('Email: ${param.email}');
      print('New Password: ${param.newPassword}');

      final response = await repositry.fogretpass(param);

      if (response.data != null) {
        showToastMessage('SUCCESS', 'create succes fully');

        // Navigate to the login screen after a delay (for the user to see the success message)
        Future.delayed(Duration(seconds: 2), () {
          Get.toNamed(Routes.LOGIN_SCREEN);
        });
      } else {
        // Print an error message if response.data is null
        print('Error: Response data is null');
      }
    } catch (err) {
      // Handle errors, for example, show an error message
      log("Errorssss: $err");
      showToastMessage('ERROR', 'An error occurred. Please try again.');
    }
  }

  resetPassword() {
    if (newpassword.value.text.isBlank == true ||
        confirmnewpassword.value.text.isBlank == true) {
      Get.snackbar(
        "Error",
        "Fields required",
      );
      return;
    }
    if (newpassword.value.text != confirmnewpassword.value.text) {
      Get.snackbar(
        "Error",
        "Password doesn't match",
      );
      return;
    }
    if (newpassword.value.text.length < 8) {
      Get.snackbar(
        "Error",
        "Password is not long enough min 10 characters is required",
        backgroundColor: Colors.red,
      );
      return;
    }
  }

  @override
  void onInit() {
    print('Confirm pass${password.value.text.toString()}');
    super.onInit();
  }
}
