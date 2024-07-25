import 'dart:async';
import 'dart:developer';

import 'package:exam_prep_tool/app/data/irepositry/itestseries_repo.dart';
import 'package:exam_prep_tool/app/data/modal/test_series/random_question_testseries.dart';
import 'package:exam_prep_tool/app/data/modal/test_series/weekley_testSeries.dart';
import 'package:exam_prep_tool/app/data/repositry/testseries_repo.dart';
import 'package:exam_prep_tool/app/modules/testsearis/controllers/testsearis_controller.dart';
import 'package:exam_prep_tool/app/utils/utils.dart';
import 'package:get/get.dart';
import 'package:get/get_rx/get_rx.dart';
import 'package:intl/intl.dart';

class TestseriesMcqController extends GetxController {
//  final TestSeriesRepo repositry1 = TestSeriesRepoIMPL();
//  //RxList<RandomQues>? data;
//  final randomques = <RandomQues>[].obs;
//  RxBool isLoading = false.obs;
//  randomquestion() async {
//    try {
//      isLoading.value = true;

//      var response =
//          await repositry1.randomqueslist("668b8c6d024fee047e44b9a1");
//      if (response.data != null) {
//        randomques.value = response.data!.data ?? [];
//        print("TestSeries ${response.data.toString()}");
//        // If 'response.data.toString()' is a List, you might want to log each item separately
//        for (var item in randomques.value) {
//          print(item);
//        }
//      }
//      isLoading.value = false;
//    } catch (e) {
//      log(e.toString());
//    }
//  }

  var testSeries = Testseries().obs;
  var currentQuestionIndex = 0.obs;
  var selectedOptionIndex = (-1).obs;
  var answeredQuestions = <int>{}.obs;
  var markedForReviewQuestions = <int>{}.obs;
  var totalMarks = 0.obs;
  var finalMarks = 0.obs;
  var reviewMarks = 0.obs;
  //var notattempted = 0.obs;
  var attempted = 0.obs;
  // Add these getters
  int get attemptedCount => answeredQuestions.length;
  int get notAttemptedCount =>
      (testSeries.value.questions?.length ?? 0) - attemptedCount - reviewCount;

  int get reviewCount => markedForReviewQuestions.length;

  Rx<Duration> duration = Duration().obs;
  Timer? timer;
  RxString startTime = ''.obs;
  RxString endTime = ''.obs;

  void startTimer(int minutes, Function onTimeUp) {
    // Set the start time to the current time
    DateTime startTime = DateTime.now();
    DateTime endTime = startTime.add(Duration(minutes: minutes));

    // Print start and end time in the desired format
    String startTimeFormatted =
        DateFormat('EEE MMM d yyyy HH:mm:ss \'GMT\'Z').format(startTime);
    String endTimeFormatted =
        DateFormat('EEE MMM d yyyy HH:mm:ss \'GMT\'Z').format(endTime);

    print('Start Time: $startTimeFormatted');
    print('End Time: $endTimeFormatted');
    duration.value = Duration(minutes: minutes);
    timer?.cancel();
    timer = Timer.periodic(Duration(seconds: 1), (timer) {
      if (duration.value.inSeconds > 0) {
        duration.value = duration.value - Duration(seconds: 1);
      } else {
        timer.cancel();
        onTimeUp();
      }
      // Calculate and set the end time
    });
  }

  @override
  void onClose() {
    timer?.cancel();
    super.onClose();
  }

  void selectOption(int index) {
    selectedOptionIndex.value = index;
  }

  void submitAnswer() {
    if (selectedOptionIndex.value != -1) {
      answeredQuestions.add(currentQuestionIndex.value);
      finalMarks.value++;
      totalMarks++;
    }
    //else {
    //  totalMarks--;
    //  finalMarks.value--;
    //}
    selectedOptionIndex.value = -1;
    if (currentQuestionIndex.value < testSeries.value.questions!.length - 1) {
      currentQuestionIndex.value++;
    } else {
      // Quiz is finished
      // You can navigate to a score screen or show a dialog
    }
  }

  void previousQuestion() {
    if (currentQuestionIndex.value > 0) {
      currentQuestionIndex.value--;
      selectedOptionIndex.value = -1; // Reset selected option
    }
  }

  void markForReview() {
    markedForReviewQuestions.add(currentQuestionIndex.value);
    selectedOptionIndex.value = -1; // Reset selected option
    if (currentQuestionIndex.value < testSeries.value.questions!.length - 1) {
      currentQuestionIndex.value++;
      reviewMarks++;
    } else {
      // Quiz is finished
      // You can navigate to a score screen or show a dialog
    }
  }

  void updateCurrentQuestionIndex(int index) {
    currentQuestionIndex.value = index;
  }
}
