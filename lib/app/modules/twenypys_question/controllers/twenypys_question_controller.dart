import 'dart:async';

import 'dart:developer';
import 'package:exam_prep_tool/app/data/irepositry/ipayments_repo.dart';
import 'package:exam_prep_tool/app/data/modal/buycourses_modal.dart';
import 'package:exam_prep_tool/app/data/modal/course.dart';
import 'package:exam_prep_tool/app/data/modal/subjectfilterlist/subjectfilter.dart';

import 'package:exam_prep_tool/app/data/modal/vidio_lecturesresponse/get_exam_id.dart';
import 'package:exam_prep_tool/app/data/modal/vidio_lecturesresponse/vidio_lecturesresponse.dart';
import 'package:exam_prep_tool/app/data/repositry/payments_repo.dart';
import 'package:get/get.dart';
import 'package:exam_prep_tool/app/data/irepositry/icourses_repo.dart';
//import 'package:exam_prep_tool/app/data/modal/pys_ques.dart';
//import 'package:exam_prep_tool/app/data/modal/pys_question/datum.dart';
import 'package:exam_prep_tool/app/data/repositry/courses_repo.dart';
import 'package:exam_prep_tool/app/utils/const.dart';
import 'package:flutter/material.dart';

class TwenypysQuestionController extends GetxController {
  Rx<CourseList?> seleectrdfreevalue = Rx<CourseList?>(null);
  Rx<CourseSub?> seleectrdvalue = Rx<CourseSub?>(null);
  Rxn<String> seleectrdvalue1 = Rxn<String>();
  final CourseRepo repositry = CoursesRepoIml();
  final getfreecouse = <CourseList>[].obs;
  List<String> subjectList = <String>[].obs;
  RxBool isVisible = false.obs;
  RxBool showAlertBox = true.obs;
  List<String> pdfview = <String>[].obs;
  final showpdf = <Vidio>[].obs;
  bool? isTrue = Get.arguments;
  RxBool isLoading = false.obs;
  final GlobalKey dropdownKey = GlobalKey();
  var selectedid = "".obs;
  var selectedSubject = "".obs;
  var selectedUrl = "".obs;
  final courdata = <Datum>[].obs;

  //// with out purchae

  final woitutpurchase = <Vidio>[].obs;

  Rxn<String> seleectrdvalu4 = Rxn<String>();
  Rxn<String> selectedValue = Rxn<String>(); // To hold selected subject's name
  Rxn<SelectedSubjectlist> selectedSubject1 =
      Rxn<SelectedSubjectlist>(); // To hold full selected subject
  final courdata1 = <SelectedSubjectlist>[]
      .obs; // To hold dropdown data // To hold selected value

  var filterSubject = "".obs;
  // purchased coursed

  final PaymentsRepo purchasesCourse = VerfypaymentRepoImpl();
  final userdetais = <CourseSub>[].obs;
  final count = 0.obs;

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

//Freee courses
  getfreecourseList() async {
    isLoading.value = true;

    try {
      final response = await repositry.getexamid();
      if (response.data != null) {
        print("course ${response.data!.data!.length}");

        getfreecouse.value = response.data!.data ?? [];
        // pages.value = response.data!.data ?? [];
      } else {
        print("Data is null");
        getfreecouse.value = []; // or handle the null case in a different way
      }
      isLoading.value = false;
    } catch (e) {
      log("err $e");
      isLoading.value = false;
    }
  }

//COURSES SELECT PURCHASED
  getList() async {
    isLoading.value = true;

    try {
      final response =
          await repositry.getcourses(prefutils.getID().toString(), 'priority');
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

  //void updateSelectedIndex(int index) {
  //  selectedIndex.value = index;
  //}

  Future<void> withoutpurchase() async {
    print('Selected ID: ${selectedid.value}');
    isLoading.value = true;

    Completer<void> completer = Completer<void>();

    try {
      final response =
          await repositry.getvidioList('', '', preiousqu.toString(), ""

              // examdat.toString(),
              );

      if (response.data != null) {
        print("correctvideolectur ${response.data?.data!.length}");
        showpdf.value = response.data?.data ?? [];
        //selectedvidolist.value = vidiolistcorret.first!.uploadId!.first!.file!.url;
        //print("correctvideolectur subjects ${showpdf.first.exam!.subjects!}");
        print("correctvideolectur ${subjectList}");

        completer.complete();
      }

      isLoading.value = false;
    } catch (e) {
      log("error${e}");
      isLoading.value = false;

      // Completing with an error in case of failure
      completer.completeError(e);
    }

    // Waiting for the Future to complete outside of the try-catch block
    await completer.future;
  }

  showpdfview() async {
    try {
      var response = await repositry.getvidioList(
          '', selectedValue.value.toString(), 'pyq20', '');
      if (response.data != null) {
        showpdf.value = response.data!.data ?? [];
      }
    } catch (e) {
      return log(e.toString());
    }
  }

  @override
  void onInit() {
    // getfreecourseList();
    // getList();
    // withoutpurchase();
    // checkcourses();
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
