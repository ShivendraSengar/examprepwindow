import 'dart:developer';
import 'package:exam_prep_tool/app/data/irepositry/ilogin_repo.dart';
import 'package:exam_prep_tool/app/data/modal/login_response/data.dart';
import 'package:exam_prep_tool/app/data/params/loginparams.dart';
import 'package:exam_prep_tool/app/data/repositry/login_repo.dart';
import 'package:exam_prep_tool/app/routes/app_pages.dart';
import 'package:exam_prep_tool/app/utils/pref_utis.dart';
import 'package:exam_prep_tool/app/utils/utils.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class LoginScreenController extends GetxController {
  final TextEditingController email = TextEditingController(
      text: kDebugMode ? "shivendra@testept.com" : "");
  //text: kDebugMode ? "raviranjan.km520@gmail.com" : "");

  final TextEditingController password =
      TextEditingController(text: kDebugMode ? "Hey@12345" : "");
  //TextEditingController(text: kDebugMode ? "Ept@1234" : "");
  final PrefUtils prefUtils = Get.find();
  final LoginRepo repositry = LoginRepoImpl();
  Data? logindata;

  static const String authTokenKey = 'authToken';

  login() async {
    try {
      final param = Loginparams()
        ..email = email.text
        ..password = password.text;

      final response = await repositry.auth(param);

      if (response.data != null) {
        showToastMessage('SUCCESS', 'send message success');
        logindata = response.data?.data ?? Data();
        final token = response.data?.data?.token ?? '';
        prefUtils.saveToken(response.data?.data?.token ?? '');
        prefUtils.saveId(response.data?.data?.id ?? '');
        prefUtils.saveMobile(response.data?.data?.mobile ?? '');
        prefUtils.savereferralcode(response.data?.data?.referral ?? '');

        //prefUtils.saveGuetLogin( ?? '');
        // Save the token using shared_preferences
        //saveTokenToSharedPreferences(token);

        Get.toNamed(Routes.HOME, arguments: [email.text]);

        print("Mobile number${response.data?.data?.mobile}");
        print(response.data?.data?.email);
        print("token: ${response.data?.data?.token}");
        print("token: ${token.toString()}");
      } else if (response.data == 400) {
        // Handle client error
        print("Client error");
      } else if (response.data == 401) {
        Get.toNamed(Routes.UN_AUTHORIZED_PERSON);
        print("Server error");
      } else {
        //
        print("Unexpected status code: ${response.data}");
      }
      //else if (response.data == null) {
      //  showToastMessage('Password not match', 'wrong password');
      //} else {
      //  showToastMessage('EMPTY RESPONSE', 'No data received from the server');

      //  Get.toNamed(Routes.UN_AUTHORIZED_PERSON);
      //}
      //
    } catch (err) {
      //Get.toNamed(Routes.UN_AUTHORIZED_PERSON);
      log("errww $err");
    }
  }

  @override
  void onInit() {
    super.onInit();
  }
}
