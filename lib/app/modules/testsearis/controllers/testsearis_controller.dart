import 'dart:developer';

import 'package:exam_prep_tool/app/data/irepositry/icourses_repo.dart';
import 'package:exam_prep_tool/app/data/irepositry/ipayments_repo.dart';
import 'package:exam_prep_tool/app/data/irepositry/itestseries_repo.dart';
import 'package:exam_prep_tool/app/data/modal/buycourses_modal.dart';
import 'package:exam_prep_tool/app/data/modal/test_series/weekley_testSeries_modal.dart';
import 'package:exam_prep_tool/app/data/modal/vidio_lecturesresponse/vidio_lecturesresponse.dart';
import 'package:exam_prep_tool/app/data/repositry/courses_repo.dart';
import 'package:exam_prep_tool/app/data/repositry/payments_repo.dart';
import 'package:exam_prep_tool/app/data/repositry/testseries_repo.dart';
import 'package:exam_prep_tool/app/routes/app_pages.dart';
import 'package:exam_prep_tool/app/utils/pref_utis.dart';
import 'package:exam_prep_tool/app/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_rx/get_rx.dart';

class TestsearisController extends GetxController
    with SingleGetTickerProviderMixin {
  final TestSeriesRepo repositry1 = TestSeriesRepoIMPL();
  var selectedTestSeries = Rxn<Testseries>();
  RxList<Testseries>? data;

  TabController? tabController;
  var isTestStarted = false.obs;

  void startTest() {
    isTestStarted.value = true;
  }

  // Map to track the test start state for each item
  var testStates = <int, bool>{}.obs;

  // Method to update the state of a test item
  void updateTestState(int index, bool isStarted) {
    testStates[index] = isStarted;
  }
  List<Testseries> allTestSeries = [];

  List<Testseries> get attemptedTests =>
      allTestSeries.where((test) => test.attempted == 'YES').toList();

  var selectedFilter = 'All'.obs;
  var testSeries = <Testseries>[].obs; // Your test series list
  var livetestSeries = <Testseries>[].obs; //
  var filteredTestSeries = <Testseries>[].obs; // Filtered list based on selection

  void filterTestSeries() {
    if (selectedFilter.value == 'All') {
      filteredTestSeries.value = testSeries;
    } else if (selectedFilter.value == 'Attempted') {
      filteredTestSeries.value = testSeries.where((test) => test.attempted == 'YES').toList();
    } else {
      filteredTestSeries.value = testSeries.where((test) => test.attempted != 'YES').toList();
    }
  }


  var tabIndex = 0.obs;
  //TODO: Implement TestsearisController
  final List<String> imgList = [
    'images/course suscription.png',
    'images/course suscription.png',
    'images/course suscription.png',
    'images/course suscription.png',
    'images/course suscription.png',
  ];
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
  // final testSeries = <Testseries>[].obs;
  final count = 0.obs;
  // /////////////////////////////////////////////////////Live test
  void livetest() async {
    try {
      isLoading.value = true;
      print("id ${selectedid.value}");
      print("subject ${selectedSubject.value}");

      var response = await repositry1.weeklytestseries(selectedSubject.value,
          selectedid.value, prefutils.getID().toString(),"live");
      if (response.data != null) {
        livetestSeries.value = response.data!.data ?? [];
        print("TestSeries ${response.data!.toJson()}");
        // If 'response.data.toString()' is a List, you might want to log each item separately
        for (var item in testSeries.value) {
          print(item);
        }
      }
      isLoading.value = false;
    } catch (e) {
      log(e.toString());
    }
  }
////////////////////////weekely test//////////////////////////////////

  weeklytest() async {
    try {
      isLoading.value = true;
      print("id ${selectedid.value}");
      print("subject ${selectedSubject.value}");

      var response = await repositry1.weeklytestseries(selectedSubject.value,
          selectedid.value, prefutils.getID().toString(),"");
      if (response.data != null) {
        testSeries.value = response.data!.data ?? [];
        print("TestSeries ${response.data!.toJson()}");
        // If 'response.data.toString()' is a List, you might want to log each item separately
        for (var item in testSeries.value) {
          print(item);
        }
      }
      isLoading.value = false;
    } catch (e) {
      log(e.toString());
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
    //weeklytest();
    //getList();
    tabController = TabController(length: 3, vsync: this);

    // Add listener to TabController
    tabController!.addListener(() {
      if (tabController!.indexIsChanging) {
        tabIndex.value = tabController!.index;
        refreshTabData(tabController!.index);
      }
    });

    checkcourses();
    //getorderidin();
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

  // Refresh data based on tab index
  void refreshTabData(int index) {
    if (index == 0) {
      fetchPracticeTestSeries(); // Refresh Practice Test Data
    } else if (index == 1) {
      fetchWeeklyTestSeries(); // Refresh Weekly Test Data
    } else if (index == 2) {
      fetchLiveTestSeries(); // Refresh Live Test Data
    }
  }

  void fetchPracticeTestSeries() {
    showpdfview();
    // Add your API call or data fetching logic here for Practice Test
    print("Fetching Practice Test Data");
  }

  void fetchWeeklyTestSeries() {
    // Add your API call or data fetching logic here for Weekly Test
    print("Fetching Weekly Test Data");
    weeklytest();
  }

  void fetchLiveTestSeries() {
    // Add your API call or data fetching logic here for Live Test
    print("Fetching Live Test Data");
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    tabController!.dispose();
    super.onClose();
  }

  void setSelectedTestSeries(Testseries testData) {
    selectedTestSeries.value = testData;
    //Get.toNamed(Routes.TESTACTIVE_SCREEN);
  }
}
