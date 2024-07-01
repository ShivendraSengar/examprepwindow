import 'dart:developer';

import 'package:exam_prep_tool/app/data/irepositry/iprofile_repo.dart';
import 'package:exam_prep_tool/app/data/modal/profile/edit_profile.dart';
import 'package:exam_prep_tool/app/data/params/updateProfile_params.dart';
import 'package:exam_prep_tool/app/data/repositry/profile.dart';
import 'package:exam_prep_tool/app/modules/home/views/home_view.dart';
import 'package:exam_prep_tool/app/modules/proile_page/controllers/proile_page_controller.dart';
import 'package:exam_prep_tool/app/modules/proile_page/views/proile_page_view.dart';
import 'package:exam_prep_tool/app/routes/app_pages.dart';
import 'package:exam_prep_tool/app/utils/const.dart';
import 'package:exam_prep_tool/app/utils/pref_utis.dart';
import 'package:exam_prep_tool/app/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:http/http.dart' as https;
import 'package:shared_preferences/shared_preferences.dart';

class EditProileController extends GetxController {
  final PrefUtils prefutils = Get.find();

  final ProilePageController getdata = Get.find();
  final ProilePageController profilecontroller = Get.find();
  final TextEditingController name = TextEditingController();
  final TextEditingController email = TextEditingController();
  final TextEditingController phonenumber = TextEditingController();
  final TextEditingController branch = TextEditingController();
  final TextEditingController exam = TextEditingController();
  final TextEditingController subject = TextEditingController();
  final TextEditingController language = TextEditingController();
  final EditProfileRepo repositry = EditProfileImpl();
  RxBool isLoading = false.obs;

  @override
  void onInit() {
    super.onInit();
    getProfileData();
    fetchDataAndUpdateUI();

    print("email${email.text}");
  }

  fetchDataAndUpdateUI() {
    profilecontroller.update();
  }

  updateProfile() async {
    try {
      final params = UpdateProfileParams()
        ..email = getdata.profile?.studentId?.email
        ..branch = getdata.profile?.branch
        ..exam = exam.text.toString()
        ..id = prefutils.getID().toString()
        ..image = 'ss'
        ..language = [language.text.toString()]
        ..mobile = getdata.profile?.studentId?.mobile.toString()
        ..name = name.text.toString();

      var response = await repositry.updateProfile(
        params,
        'Bearer ${prefutils.getToken().toString()}',
      );

      if (response.data != null) {
        showToastMessage("Sucess", "upload data Sucessfully");
        getProfileData();
        // Get.offNamed(Routes.HOME);
        //  Get.back();
        //  Get.back();
        // Get.back(result: response.data!);
        Get.offAllNamed(Routes.HOME);
      }
      isLoading.value = false;
    } catch (e) {
      log(e.toString());
    }
  }

  Data? profile;

  Future<void> getProfileData() async {
    try {
      isLoading.value = true;
      final response = await repositry.editUser(
        prefUtils.getID().toString(),
        'Bearer ${prefUtils.getToken().toString()}',
      );

      if (response.data != null && response.data!.data != null) {
        profile = response.data!.data!;
        print("Email: ${profile!.studentId!.email}");
        print("Branch: ${profile?.branch}");
      } else {
        print('Error: Response or data is null');
      }
    } catch (e) {
      print('Error: $e');
      // Handle error, e.g., show a snackbar or toast
    } finally {
      isLoading.value = false;
    }
  }

  //updateProfileData() async {
  //  try {
  //    // Your data
  //    final requestBody = {
  //      'branch': profilrcontroller.editProfile.value.data?.branch.toString(),
  //      'email': profilrcontroller.editProfile.value.data?.studentId?.email
  //          .toString(),
  //      'exam': exam.text.toString(),
  //      'image': 'ss',
  //      'language': language.text.toString(),
  //      'mobile': profilrcontroller.editProfile.value.data?.studentId?.mobile
  //          .toString(),
  //      //'mobile': phonenumber.text.toString(),

  //      'name': name.text.toString(),
  //      '_id': prefutils.getID().toString(),
  //    };

  //    // Encode the data in x-www-form-urlencoded format
  //    //String encodedData = data.keys.map((key) {
  //    //  return '${Uri.encodeQueryComponent(key)}=${Uri.encodeQueryComponent(data[key].toString())}';
  //    //}).join('&');

  //    // API endpoint
  //    String apiUrl = 'http://3.16.245.227:4000/api/user/update';

  //    // Send a POST request
  //    var response = await https.post(
  //      Uri.parse(apiUrl),
  //      headers: {
  //        //'Content-Type': 'application/json',
  //        'Authorization': 'Bearer ${prefutils.getToken().toString()}',
  //      },
  //      body: requestBody,
  //    );

  //    // Handle the response
  //    if (response.statusCode == 200) {
  //      print('Success: ${response.body}');
  //      showToastMessage("Sucess", "Update Sucessfully");
  //      Get.toNamed(Routes.HOME);
  //      fetchDataAndUpdateUI();
  //    } else {
  //      print('Error: ${response.statusCode}');
  //    }
  //  } catch (e) {
  //    log(e.toString());
  //  }
  //}

  RxString imagePath = ''.obs;

  void setImagePath(String path) {
    imagePath.value = path;
  }

  void pickImageFromGallery() async {
    final pickedFile =
        await ImagePicker().pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      imagePath.value = pickedFile.path;
      setImagePath(imagePath.value);
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      prefs.setString('imagePath', imagePath.value);
      print("image picker${imagePath}");
    } else {
      print('No image selected.');
    }
  }

  void pickImageFromCamera() async {
    final pickedFile =
        await ImagePicker().pickImage(source: ImageSource.camera);

    if (pickedFile != null) {
      imagePath.value = pickedFile.path;
      setImagePath(imagePath.value);
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      prefs.setString('imagePath', imagePath.value);
    } else {
      print('No image selected.');
    }
  }

  @override
  void onClose() {
    super.onClose();
  }
}
