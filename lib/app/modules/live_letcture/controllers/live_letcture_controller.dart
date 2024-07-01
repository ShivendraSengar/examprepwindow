import 'dart:async';

import 'package:exam_prep_tool/app/data/modal/live_lectures_list.dart';
import 'package:get/get.dart';
import 'dart:developer';
import 'package:exam_prep_tool/app/data/irepositry/ipayments_repo.dart';
import 'package:exam_prep_tool/app/data/modal/buycourses_modal.dart';
import 'package:exam_prep_tool/app/data/modal/course.dart';
import 'package:exam_prep_tool/app/data/repositry/courses_repo.dart';
import 'package:exam_prep_tool/app/data/repositry/payments_repo.dart';
import 'package:exam_prep_tool/app/utils/const.dart';
import 'package:flutter/material.dart';
import 'package:exam_prep_tool/app/data/irepositry/icourses_repo.dart';
import 'package:exam_prep_tool/app/data/modal/vidio_lecturesresponse/vidio_lecturesresponse.dart';
import 'package:intl/intl.dart';

class LiveLetctureController extends GetxController {
  final GlobalKey dropdownKey = GlobalKey();
  late Timer timer;

  RxString dropdownvalue = "".obs;
  // RxString a = "".obs;
  Rxn<CourseSub?> seleectrdvalue33 = Rxn<CourseSub?>();

  final livelecture = <LetctureDetails>[].obs;

  final TextEditingController meetingid = TextEditingController();
  final TextEditingController password = TextEditingController();
  RxBool isLoading = false.obs;
  var selectedid = "".obs;
  var selectedSubject = "".obs;

  RxBool isVisible = false.obs;
  final RxString formattedDateTime = ''.obs;

  //void formatRawStartDate(String rawStartDate) {
  //  DateTime? dateTime = DateTime.tryParse(rawStartDate);
  //  if (dateTime != null) {
  // Format date
  //String formattedDate = DateFormat("MMM dd, yyyy").format(dateTime);

  //    // Format time
  //    String formattedTime = DateFormat("HH:mm").format(dateTime);

  //    // Update the formattedDateTime value
  //    formattedDateTime.value = '$formattedDate at $formattedTime';
  //  }
  //}

  ////  Date timeparsing

  String formatDate(DateTime? dateTime) {
    if (dateTime == null) return ''; // Handling null case
    final DateFormat formatter = DateFormat('yyyy-MM-dd');
    return formatter.format(dateTime);
  }

  String formatTime(DateTime? dateTime) {
    if (dateTime == null) return ''; // Handling null case

    // Format the time using intl package in 12-hour format
    final DateFormat formatter = DateFormat('hh:mm a');
    return formatter.format(dateTime);
  }

  // purchased coursed

  final PaymentsRepo purchasesCourse = VerfypaymentRepoImpl();
  final userdetais = <CourseSub>[].obs;
  final count = 0.obs;
  checkcourses() async {
    print("id ${prefutils.getID().toString()}");
    try {
      isLoading.value = true;
      var response =
          await purchasesCourse.checkCourseBuy(prefutils.getID().toString());
      if (response.data != null) {
        userdetais.value = response.data!.data ?? [];
        print("Response${response.data.toString()}");
        // If 'response.data.toString()' is a List, you might want to log each item separately
        for (var item in userdetais.value) {
          print(item);
        }
      }
      isLoading.value = false;
    } catch (e) {
      log(e.toString());
    }
  }

  livrlectures() async {
    print("id ${selectedid.toString()}");
    try {
      isLoading.value = true;
      var response =
          await purchasesCourse.livelectureslist(selectedid.toString(),'Bearer ${prefutils.getToken().toString()}');
      if (response.data != null) {
        livelecture.value = response.data!.data ?? [];
        print("Response${response.data.toString()}");
        // If 'response.data.toString()' is a List, you might want to log each item separately
        for (var item in livelecture.value) {
          print(item);
        }
      }
      isLoading.value = false;
    } catch (e) {
      log(e.toString());
    }
  }

  @override
  void onInit() {
    super.onInit();
    checkcourses();
    // livrlectures();
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
