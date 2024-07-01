import 'dart:developer';

import 'package:exam_prep_tool/app/data/irepositry/icourses_repo.dart';
import 'package:exam_prep_tool/app/data/modal/course.dart';
//es/courses_details.dart';
import 'package:exam_prep_tool/app/data/repositry/courses_repo.dart';
import 'package:exam_prep_tool/app/utils/pref_utis.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SelectCoursesScreenController extends GetxController {
  final GlobalKey dropdownKey = GlobalKey();
  final courdata = <Datum>[].obs;
  final CourseRepo repositry = CoursesRepoIml();
  final PrefUtils prefutils = Get.find();
  RxBool isLoading = false.obs;
  var dropdownvalue;

  // Fetch branch data (you can replace this with your actual API call or data source)

  getList() async {
    isLoading.value = true;
    //final response = await repositry.getcourses();
    //if (response != null && response.data != null) {
    //  // Perform operations with response.data
    //  courdata.value = response.data!.data ?? [];
    //} else {
    //  print("Response or response.data is null");
    //}

    /////////
    try {
      final response = await repositry.getcourses(prefutils.getID().toString(),'priority');
      if (response.data != null) {
        print("course ${response.data!.data!.length}");

        courdata.value = response.data!.data ?? [];
        // pages.value = response.data!.data ?? [];
      } else {
        print("Data is null");
        courdata.value = []; // or handle the null case in a different way
      }
      isLoading.value = false;
    } catch (e) {
      log("err $e");
      isLoading.value = false;
    }
  }

  @override
  void onInit() {
    Future.delayed(Duration(seconds: 1), () {
      getList();
    });
    getList();
    // Fetch your data here and assign it to the 'language' list
    //language.addAll(["User1", "User2", "User3"]);
    //lng.value = language[0]; // Set the initial value
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
