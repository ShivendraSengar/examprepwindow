import 'dart:developer';

import 'package:exam_prep_tool/app/data/irepositry/icourses_repo.dart';
import 'package:exam_prep_tool/app/data/modal/Referralmodal/account_refferal_modal.dart';
import 'package:exam_prep_tool/app/data/modal/Referralmodal/subscription_referal_modal.dart';
import 'package:exam_prep_tool/app/data/repositry/courses_repo.dart';
import 'package:exam_prep_tool/app/utils/pref_utis.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class AccountReferalController extends GetxController {
  final PrefUtils prefutils = Get.find();
  final CourseRepo repositry = CoursesRepoIml();
  final refaraldatalist = <Referral>[].obs;
  final subscriptionrefaraldatalist = <SubReferral>[].obs;

  RxBool isLoading = false.obs;

// hige email percent
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

    // Display only the first three characters and last two characters of the hidden part
    String firstThree = hiddenPart.substring(0, 2);
    String lastTwo = hiddenPart.substring(hiddenPart.length - 2);
    String obscuredHiddenPart =
        '$firstThree${'*' * (hiddenPart.length - 3)}$lastTwo';

    return obscuredHiddenPart + visiblePart;
  }

  getSubscriptionReferData() async {
    print(
        "prefutils.getreferralcode().toString()${prefutils.getToken().toString()}");
    print(
        "prefutils.getreferralcode().toString()${prefutils.getreferralcode().toString()}");
    try {
      isLoading.value = true;
      var response = await repositry.subscriptionreferrallist(
        prefutils.getreferralcode().toString(),
        'Bearer ${prefutils.getToken().toString()}',
      );

      // Assign the response to refaraldatalist.value
      subscriptionrefaraldatalist.value = response.data!.data ?? [];

      // Check if referral data is not null before accessing its length
      if (response.data!.data != null) {
        print("referralcode ${response.data!.data!.length}");

        // If data is a List, log each item separately
        response.data!.data!.forEach((item) {
          log(item.toString());
        });
      }

      isLoading.value = false;
    } catch (e) {
      log(e.toString());
    }
  }

  getReferData() async {
    try {
      isLoading.value = true;
      var response = await repositry.referraldatalist(
        prefutils.getID().toString(),
        'Bearer ${prefutils.getToken().toString()}',
      );

      // Assign the response to refaraldatalist.value
      refaraldatalist.value = response.data!.data ?? [];

      // Check if referral data is not null before accessing its length
      if (response.data!.data != null) {
        print("referralcode ${response.data!.data!.length}");

        // If data is a List, log each item separately
        response.data!.data!.forEach((item) {
          log(item.toString());
        });
      }

      isLoading.value = false;
    } catch (e) {
      log(e.toString());
    }
  }

// Method to parse and format the createdAt date
  final RxString formattedDateTime = ''.obs;

  void formatRawStartDate(String rawStartDate) {
    DateTime? dateTime = DateTime.tryParse(rawStartDate);
    if (dateTime != null) {
      // Format date
      String formattedDate = DateFormat("MMM dd, yyyy").format(dateTime);

      // Format time
      String formattedTime = DateFormat("HH:mm").format(dateTime);

      // Update the formattedDateTime value
      formattedDateTime.value = '$formattedDate at $formattedTime';
    }
  }

  final count = 0.obs;
  @override
  void onInit() {
    super.onInit();
    getSubscriptionReferData();
    getReferData();
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
