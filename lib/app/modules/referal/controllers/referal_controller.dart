import 'package:exam_prep_tool/app/data/irepositry/iprofile_repo.dart';
import 'package:exam_prep_tool/app/data/modal/profile/edit_profile.dart';
import 'package:exam_prep_tool/app/data/repositry/profile.dart';
import 'package:exam_prep_tool/app/utils/pref_utis.dart';
import 'package:exam_prep_tool/app/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ReferalController extends GetxController {
  final TextEditingController referralcode = TextEditingController();

  final PrefUtils prefutils = Get.find();

  final EditProfileRepo repository = EditProfileImpl();
  final String token = prefUtils.getToken().toString();
  final String id = prefUtils.getID().toString();
  // Define an RxString to store the name
  RxString name = RxString('');
  var copied = false.obs;

  // Your existing methods...

  // Method to update the name and assign it to the Rx variable
  void updateName(String newName) {
    name.value = newName;
  }

  var isLoading = false.obs; // Observable<bool> for loading state
  var profile = Data().obs; // Observable<Data> for profile data

  //Future<void> fetchProfileData() async {
  //  try {
  //    isLoading.value = true;

  //    final response = await repository.editUser(
  //      prefutils.getID().toString(),
  //      'Bearer ${prefutils.getToken().toString()}',
  //    );

  //    if (response.data != null && response.data!.data != null) {
  //      profile.value = response.data!.data!;
  //      print("Email: ${profile.value.studentId!.email}");
  //      print("Branch: ${profile.value.branch}");
  //    } else {
  //      // Handle the case where response or data is null
  //      print('Error: Response or data is null');
  //    }
  //  } catch (e) {
  //    print('Error: $e');
  //    // Handle error, you can show a snackbar or toast
  //  } finally {
  //    isLoading.value = false;
  //  }
  //}

  @override
  void onInit() {
    super.onInit();
    //fetchProfileData();
    //getprofiledata();
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
