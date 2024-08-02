import 'dart:async';
import 'dart:convert';
import 'dart:developer';
import 'package:exam_prep_tool/app/data/irepositry/icourses_repo.dart';
import 'package:exam_prep_tool/app/data/irepositry/ipayments_repo.dart';
import 'package:exam_prep_tool/app/data/modal/buycourses_modal.dart';
import 'package:exam_prep_tool/app/data/modal/circulam_lists/circulam_modal.dart';
import 'package:exam_prep_tool/app/data/modal/circulam_lists/circulam_modal.dart';
import 'package:exam_prep_tool/app/data/modal/payments_modal.dart';
import 'package:exam_prep_tool/app/data/modal/vidio_lecturesresponse/vidio_lecturesresponse.dart';
import 'package:exam_prep_tool/app/data/params/paramspayments.dart';
import 'package:exam_prep_tool/app/data/params/veryfy_payments_params.dart';
import 'package:exam_prep_tool/app/data/repositry/courses_repo.dart';
import 'package:exam_prep_tool/app/data/repositry/payments_repo.dart';
import 'package:exam_prep_tool/app/modules/selected_vidiolecture/controllers/selected_vidiolecture_controller.dart';
import 'package:exam_prep_tool/app/routes/app_pages.dart';
import 'package:exam_prep_tool/app/utils/const.dart';
import 'package:exam_prep_tool/app/utils/pref_utis.dart';
import 'package:exam_prep_tool/app/utils/utils.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as https;
//import 'package:razorpay_flutter/razorpay_flutter.dart';
import 'package:razorpay_web/razorpay_web.dart';

import '../../../data/modal/circulam_lists/circulam_modal.dart';
import '../../../data/modal/circulam_lists/circulam_modal.dart';

class CourseSubscribeController extends GetxController {
  final SelectedVidiolectureController vidiolectureController = Get.find();
  final PaymentsRepo repositry1 = VerfypaymentRepoImpl();
  final String url = 'https://exampreptool.com/api/payment/pay';
  final PrefUtils prefutils = Get.find();
  var selectedIndex = 0.obs;
  var selectedid = "".obs;
  // Replace 'your_token_here' with the actual token value
  final String token = prefUtils.getToken().toString();

  final CourseRepo repositry = CoursesRepoIml();
  var showMore = false.obs;

  void toggleShowMore() {
    showMore.value = !showMore.value;
  }

  //var vidiolistcorret = [].obs; // Assume this is populated with video data

  var expandedSubjects = <String, bool>{}.obs;
  final circulumdata = <circulumlist>[].obs;
  final lecteurelist = <CourseSub>[].obs;
  var isExpanded = false.obs;
  Rxn<CourseSub?> seleectrdvalue33 = Rxn<CourseSub?>();
  RxBool isVisible = false.obs;
  Rx<String?> seleectrdvalue3 = Rx<String?>(null);
  var orderid = "";
  var getrecipt = "";
  var signature = "".obs;
  var razorpaymentid = "".obs;
  final getdata = Get.arguments;
  RxBool isLoading = false.obs;
  PaymentsData? paymentsData;
  var selectedSubject = "".obs;
  var amount = 0.obs;
  var image = "".obs;
  var name = "".obs;
  var number = 0.obs;
  var cost = 0.obs;
  var examid = "".obs;
  var durationInMonths = 0.obs;
  var description = "".obs;
  var id = "".obs;
  var courseType = "".obs;
  var offerid = "".obs;
  var vaildDate = "".obs;
  var discountPercent = "".obs;
  final vidiolistcorret = <Vidio>[].obs;

  var subjectList = <String>[].obs;

  // Method to get circular list
  Future<void> getcirculamlist(String id) async {
    print("aaaaa$id");
    try {
      final response = await repositry.circulimdatalist(id);
      if (response.data != null) {
        circulumdata.value = response.data?.data ?? [];
        print("circulam data: ${circulumdata.first.id}");
      } else {
        circulumdata.value = []; // or handle the null case in a different way
      }

      isLoading.value = false;
    } catch (e) {
      log("err $e");
      isLoading.value = false;
    }
  }

// Lectures
  checkcourses() async {
    print("id ${prefutils.getID().toString()}");
    try {
      isLoading.value = true;
      var response =
          await repositry1.checkCourseBuy(prefutils.getID().toString());
      if (response.data != null) {
        lecteurelist.value = response.data!.data ?? [];
        print("Response${response.data.toString()}");
        // If 'response.data.toString()' is a List, you might want to log each item separately
        for (var item in lecteurelist.value) {
          print(item);
        }
      }

      isLoading.value = false;
    } catch (e) {
      log(e.toString());
    }
  }

  Future<void> getVideos(String id) async {
    print('Selected ID: ${id}');
    print('Selected sub: ${selectedSubject.value}');
    isLoading.value = true;

    Completer<void> completer = Completer<void>();

    try {
      final response = await repositry.getvidioList(
          id,
          "",
          // selectedSubject.value,
          uploadTypesss.toString(),
          "title");

      if (response.data != null) {
        print("correctlectureslist ${response.data?.data!.length}");
        vidiolistcorret.value = response.data?.data ?? [];
        //selectedvidolist.value = vidiolistcorret.first!.uploadId!.first!.file!.url;
        // print(
        //     "correctvideolectur subjects ${vidiolistcorret.first.exam!.subjects!}");
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

  void fetchData() {
    final getdata = Get.arguments;
    if (getdata != null && getdata is List && getdata.length > 12) {
      amount = getdata[3];
    } else {
      amount = 0.obs;
    }
  }

  @override
  void onInit() {
    // Calling getcirculamlist function with id value
    // Rest of your code
    //checkcourses();
    final data = Get.arguments;

    if (data != null && data is List && data.length >= 13) {
      final image = data[0];
      final name = data[1];
      final number = data[2];
      final cost = data[3];
      //(amount.value * 100).toString(),
      final durationInMonths = data[4];
      final description = data[5];
      final id = data[6];
      final courseType = data[7];
      final offerid = data[8];
      final vaildDate = data[9];
      final discountPercent = data[10];
      final examId = data[11];

      // Printing the values
      getcirculamlist(data[6]);
      getVideos(data[11]);
      print("id${prefutils.getID()}");
      print("token ${prefutils.getToken()}");
      print('Image: $image');
      print('Name: $name');
      print('Number: $number');
      print('Cost: $cost');
      print('Duration: $durationInMonths months');
      print('Description: $description');
      print('ID: $id');
      print('Course Type: $courseType');
      print('offerid: $orderid');
    } else {
      print('Invalid arguments format');
    }

    print("Signature    $signature");

    amount.value = int.parse(getdata[3].toString());

    print("Subscribe ${amount.value * 100}");

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
