import 'dart:developer';
import 'package:exam_prep_tool/app/data/irepositry/icourses_repo.dart';
import 'package:exam_prep_tool/app/data/modal/notes_filterlist/notes_fiterlist.dart';
import 'package:exam_prep_tool/app/data/modal/subjectfilterlist/subjectfilter.dart';
import 'package:exam_prep_tool/app/data/repositry/courses_repo.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AirNotesController extends GetxController {
  final CourseRepo repositry = CoursesRepoIml();

  List<String> subjectList = <String>[].obs;
  RxBool isVisible = false.obs;

  final showpdf = <filterNotes>[].obs;
  bool? isTrue = Get.arguments;
  RxBool isLoading = false.obs;

  var selectedid = "".obs;

  var selectedUrl = "".obs;

  Rxn<String> selectedValue = Rxn<String>(); // To hold selected subject's name
  Rxn<SelectedSubjectlist> selectedSubject1 =
      Rxn<SelectedSubjectlist>(); // To hold full selected subject
  final courdata1 = <SelectedSubjectlist>[]
      .obs; // To hold dropdown data // To hold selected value

  var filterSubject = "".obs;

// subject filter list
  getsubjectList() async {
    isLoading.value = true;

    try {
      final response = await repositry.getsSubjectfilterlist('priority');
      if (response.data != null) {
        print("subject ${response.data!.toJson()}");

        courdata1.value = response.data!.data ?? [];
        // pages.value = response.data!.data ?? [];
      } else {
        print("Data is null");
        courdata1.value = []; // or handle the null case in a different way
      }
      isLoading.value = false;
    } catch (e) {
      log("err $e");
      isLoading.value = false;
    }
  }

  showpdfview() async {
    try {
      var response = await repositry.getpyqlist(
        selectedValue.value.toString(),
        'notes',
      );
      if (response.data != null) {
        showpdf.value = response.data!.data ?? [];
      }
    } catch (e) {
      return log(e.toString());
    }
  }

  @override
  void onInit() {
    getsubjectList();

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
