import 'dart:async';
import 'dart:convert';
import 'dart:developer';

import 'package:exam_prep_tool/app/data/irepositry/iprofile_repo.dart';

import 'package:exam_prep_tool/app/data/modal/profile/edit_profile.dart';
import 'package:exam_prep_tool/app/data/repositry/profile.dart';
import 'package:exam_prep_tool/app/modules/edit_proile/controllers/edit_proile_controller.dart';

import 'package:exam_prep_tool/app/utils/pref_utis.dart';
import 'package:exam_prep_tool/app/utils/utils.dart';
import 'package:http/http.dart' as https;
import 'package:get/get.dart';

class ProilePageController extends GetxController {
  final PrefUtils prefUtils = Get.find();
  // final EditProileController editProileController = Get.find();
  final EditProfileRepo repository = EditProfileImpl();
  late Timer _timer;

  Data? profile;
  RxBool isLoading = false.obs;

  Future<void> getProfileData() async {
    try {
      isLoading.value = true;
      final response = await repository.editUser(
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

  updateProfile() async {
    try {
      // Update the profile data here...

      // Call the method to update the profile controller
      updateProfileController();
    } catch (e) {
      log(e.toString());
    }
  }

  // Update the profile controller with the latest data
  updateProfileController() {
    final profileController = Get.find<ProilePageController>();
    profileController.getProfileData(); // Fetch the updated profile data
  }

  @override
  void onInit() {
    super.onInit();

    _timer = Timer.periodic(const Duration(minutes: 5), (Timer timer) {
      getProfileData();
      updateProfileController();
    });
  }

  @override
  void onReady() {
    super.onReady();
    // Fetch profile data when the page is ready
    getProfileData();
  }

  @override
  void onClose() {
    _timer.cancel(); // Cancel the timer when the controller is closed
    super.onClose();
  }
}
