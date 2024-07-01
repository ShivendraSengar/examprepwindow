import 'dart:async';
import 'dart:developer';

import 'package:exam_prep_tool/app/data/irepositry/icourses_repo.dart';
import 'package:exam_prep_tool/app/data/irepositry/ipayments_repo.dart';
import 'package:exam_prep_tool/app/data/modal/buycourses_modal.dart';
import 'package:exam_prep_tool/app/data/modal/course.dart';

import 'package:exam_prep_tool/app/data/modal/vidio_lecturesresponse/get_exam_id.dart';

import 'package:exam_prep_tool/app/data/modal/vidio_lecturesresponse/vidio_lecturesresponse.dart';
import 'package:exam_prep_tool/app/data/repositry/courses_repo.dart';
import 'package:exam_prep_tool/app/data/repositry/payments_repo.dart';
import 'package:exam_prep_tool/app/utils/const.dart';
import 'package:exam_prep_tool/app/utils/pref_utis.dart';
//import 'package:exam_prep_tool/app/modules/air_notes/controllers/localization_model.dart';
//import 'package:exam_prep_tool/app/modules/air_notes/controllers/services.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class AirNotesController extends GetxController {
  //Rx<Datum?> seleectrdvalue = Rx<Datum?>(null);
  Rxn<CourseSub> seleectrdvalue = Rxn<CourseSub>();
  Rxn<String> seleectrdvalue1 = Rxn<String>();
  final CourseRepo repositry = CoursesRepoIml();
  Rx<CourseList?> seleectrdfreevalue = Rx<CourseList?>(null);
  final getfreecouse = <CourseList>[].obs;
  List<String> subjectList = <String>[].obs;
  RxBool isVisible = false.obs;
  List<String> pdfview = <String>[].obs;
  final showpdf = <Vidio>[].obs;
  bool? isTrue = Get.arguments;
  RxBool isLoading = false.obs;
  final GlobalKey dropdownKey = GlobalKey();
  var selectedid = "".obs;
  var selectedSubject = "".obs;
  //final data = <Exam>[].obs;
  var selectedUrl = "".obs;
  RxInt selectedIndex = RxInt(1);
  final courdata = <Datum>[].obs;
  //// with out purchae

  final woitutpurchase = <Vidio>[].obs;
  //Rx<PreviousQue?> seleectrdvalue3 = Rx<PreviousQue?>(null);
  Rxn<String> seleectrdvalu4 = Rxn<String>();

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
  // // purchased coursed

  //final PaymentsRepo purchasesCourse = VerfypaymentRepoImpl();
  //final userdetais = <CourseSub>[].obs;
  //final count = 0.obs;
  //checkcourses() async {
  //  print("id ${prefutils.getID().toString()}");
  //  try {
  //    isLoading.value = true;
  //    var response =
  //        await purchasesCourse.checkCourseBuy(prefutils.getID().toString());
  //    if (response.data != null) {
  //      userdetais.value = response.data!.data ?? [];
  //      print("Response${response.data.toString()}");
  //      // If 'response.data.toString()' is a List, you might want to log each item separately
  //      for (var item in userdetais.value) {
  //        print(item);
  //      }
  //    }
  //    isLoading.value = false;
  //  } catch (e) {
  //    log(e.toString());
  //  }
  //}

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

  void updateSelectedIndex(int index) {
    selectedIndex.value = index;
  }

  Future<void> withoutpurchase() async {
    print('Selected ID: ${selectedid.value}');
    isLoading.value = true;

    Completer<void> completer = Completer<void>();

    try {
      final response = await repositry.getvidioList(
          '',
          '',
          "notes",

          // examdat.toString(),
          "");

      if (response.data != null) {
        print("correctvideolectur ${response.data?.data!.length}");
        woitutpurchase.value = response.data?.data ?? [];
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
          selectedid.value, selectedSubject.value, 'notes', "");
      if (response.data != null) {
        showpdf.value = response.data!.data ?? [];
      }
    } catch (e) {
      return log(e.toString());
    }
  }

  @override
  void onInit() {
    print(showpdf.value.length);
    //uplaodtype.value = showpysques;
    Future.delayed(Duration(seconds: 2), () {
      //showpdfview();
    });
    getList();
    withoutpurchase();
    getfreecourseList();
    checkcourses();
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
