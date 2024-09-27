import 'dart:convert';
import 'dart:developer';

import 'package:exam_prep_tool/app/data/irepositry/icourses_repo.dart';
import 'package:exam_prep_tool/app/data/irepositry/ipayments_repo.dart';
import 'package:exam_prep_tool/app/data/modal/buycourses_modal.dart';
import 'package:exam_prep_tool/app/data/modal/course.dart';

import 'package:exam_prep_tool/app/data/modal/vidio_lecturesresponse/vidio_lecturesresponse.dart';
import 'package:exam_prep_tool/app/data/repositry/courses_repo.dart';
import 'package:exam_prep_tool/app/data/repositry/payments_repo.dart';
import 'package:exam_prep_tool/app/routes/app_pages.dart';
import 'package:exam_prep_tool/app/utils/const.dart';
import 'package:exam_prep_tool/app/utils/pref_utis.dart';
import 'package:exam_prep_tool/app/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as https;

class AirTestseriesController extends GetxController {
  final PrefUtils prefutils = Get.find();
  Rxn<CourseSub> seleectrdvalue = Rxn<CourseSub>();
  Rxn<String> seleectrdvalue1 = Rxn<String>();
  final CourseRepo repositry = CoursesRepoIml();
  List<String> subjectList = <String>[].obs;
  RxBool isVisible = false.obs;
  List<String> pdfview = <String>[].obs;
  final showpdf = <Vidio>[].obs;
  RxBool isLoading = false.obs;
  final GlobalKey dropdownKey = GlobalKey();
  var selectedid = "".obs;
  var selectedSubject = "".obs;
  bool? isTrue = Get.arguments;
  //final data = <Exam>[].obs;
  var selectedUrl = "".obs;
  RxInt selectedIndex = RxInt(1);
  // final courdata = <Datum>[].obs;

  final String token = prefUtils.getToken().toString();
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


  void updateSelectedIndex(int index) {
    selectedIndex.value = index;
  }

  showpdfview() async {
    try {
      //isLoading.value = true;
      //String objectId = selectedid.value.toString();
      ////isVisible.value = true;
      //Completer<void> completer = Completer<void>();
      //isLoading.value = true;
      var response = await repositry.getvidioList(
          selectedid.value, selectedSubject.value, 'testSeries', "");
      if (response.data != null) {
        showpdf.value = response.data!.data ?? [];
      }
    } catch (e) {
      return log(e.toString());
    }
  }
// /////////// Razor pay code

  @override
  void onInit() {

    checkcourses();
   
    final data = Get.arguments;

    if (data != null && data is List && data.length >= 8) {
      // Printing the values

      print("id${prefutils.getID()}");
      print("token ${prefutils.getToken()}");
    } else {
      print('Invalid arguments format');
    }

    Future.delayed(Duration(seconds: 2), () {
      //paymentGetId();
    });

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
}
