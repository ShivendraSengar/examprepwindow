import 'dart:async';
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
import 'package:get/get.dart';
import 'package:http/http.dart' as https;

class SelectedVidiolectureController extends GetxController {
  final GlobalKey dropdownKey = GlobalKey();
  final courdata = <Datum>[].obs;
  final CourseRepo repositry = CoursesRepoIml();
  RxString dropdownvalue = "".obs;
  // RxString a = "".obs;
  Rx<CourseSub?> seleectrdvalue33 = Rx<CourseSub?>(null);
  Rx<Datum?> seleectrdvalue = Rx<Datum?>(null);
  Rx<Datum?> seleectrdvalue1 = Rx<Datum?>(null);
  Rx<String?> seleectrdvalue3 = Rx<String?>(null);
// Extract exam names

  final vidiolist = <Vidio>[].obs;
  final vidiolistcorret = <Vidio>[].obs;
  var subjectList = <String>[].obs;
  RxBool isLoading = false.obs;
  var selectedid = "".obs;
  var selectedSubject = "".obs;

  RxBool isVisible = false.obs;
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

  //// purchased coursed

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

  Future<void> getVideos() async {
    print('Selected ID: ${selectedid.value}');
    isLoading.value = true;

    Completer<void> completer = Completer<void>();

    try {
      final response = await repositry.getvidioList(
          selectedid.value, selectedSubject.value, uploadTypesss.toString(), ""
          // examdat.toString(),
          );

      if (response.data != null) {
        print("correctvideolectur ${response.data?.data!.length}");
        vidiolistcorret.value = response.data?.data ?? [];
        //selectedvidolist.value = vidiolistcorret.first!.uploadId!.first!.file!.url;

        //print(
        //    "correctvideolectur subjects ${vidiolistcorret.first.exam!.subjects!}");
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

  var selectexam = <String>[].obs;
  var exm = "".obs;
  var subject = <String>[].obs; // Make it observable
  var subj = "".obs; // Make it observable

  @override
  void onInit() {
    Future.delayed(Duration(seconds: 2), () {});
    checkcourses();

    getList();
    checkcourses();

    // var subjects;
    // subject.addAll([vidiolist.first.exam!.length.toString()]);
    // subj.value = subject[0]; // Set the initial value
    // print("object  ${selectedid.value}");

    super.onInit();
  }

  @override
  void onClose() {
    //videoPlayerController!.dispose();
    //youtubeController.dispose();
    super.onClose();
  }

  @override
  void onReady() {
    super.onReady();
  }
}
