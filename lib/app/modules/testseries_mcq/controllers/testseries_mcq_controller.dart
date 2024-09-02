import 'dart:async';
import 'dart:developer';

import 'package:exam_prep_tool/app/data/irepositry/itestseries_repo.dart';
import 'package:exam_prep_tool/app/data/modal/test_series/random_question_testseries.dart';
import 'package:exam_prep_tool/app/data/modal/test_series/weekley_testSeries_modal.dart';
import 'package:exam_prep_tool/app/data/params/submit_testseries_Ans_params.dart';
import 'package:exam_prep_tool/app/data/repositry/testseries_repo.dart';
import 'package:exam_prep_tool/app/modules/testsearis/controllers/testsearis_controller.dart';
import 'package:exam_prep_tool/app/routes/app_pages.dart';
import 'package:exam_prep_tool/app/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_rx/get_rx.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:intl/intl.dart';

class TestseriesMcqController extends GetxController {
  final TestSeriesRepo repositry1 = TestSeriesRepoIMPL();

  // For Integer answers
// For Integer input field
  var savedAnswers =
      <String, int>{}; // Question ID -> Selected Option Index (for MCQ)
  var savedMsqAnswers = <String,
      List<int>>{}; // Question ID -> List of Selected Option Indexes (for MSQ)
  var savedIntegerAnswers = <String, int>{};
  void loadSavedAnswersForQuestion(String questionId) {
    selectedOptionIndex.value = savedAnswers[questionId] ?? -1;
    selectedOptionIndexes.value = savedMsqAnswers[questionId] ?? [];
    inputAnswer.value.text = savedIntegerAnswers[questionId]?.toString() ?? '';
  }

  RxBool isLoading = false.obs;
  Rx<TextEditingController> inputAnswer = TextEditingController().obs;
  Rx<Duration> duration = Duration().obs;
  Timer? timer;
  RxString startTimeFormatted = ''.obs;
  RxString endTimeFormatted = ''.obs;
  RxDouble usedTime = 0.0.obs;
  var answerlist = [].obs;
  var answeredQuestions = <int>[].obs;
  var markedForReviewQuestions = <int>[].obs;
  var currentQuestionIndex = 0.obs;
  final testSeries = Testseries().obs; // Rx<Testseries>
  final arguments = Get.arguments;
  var selectedOptionIndex = (-1).obs;
  var selectedOptionIndexes = RxList<int>(); //
  var integerAnswer = Rx<int?>(null); // For storing integer type answers

  var reviewMarks = 0.obs;
  // RxDouble incorrectMarks = 0.0.obs;
  RxDouble submitanswermarks = 0.0.obs;
  var attempted = 0.obs;
  // AnswerList
  final answersList = <Map<String, dynamic>>[].obs;

  // void endTest() {
  //  testcontroller. isTestEnded.value = true;
  // }

  var totalMarks = 0.0.obs;
  var incorrectMarks = 0.0.obs;
  var finalMarks = 0.0.obs;
// Save Marks
 // Save marks for the specific test ID
   
  var marksMap = <String, double>{}.obs;

  // Function to calculate and save final marks
  void calculateFinalMarks(String testId) {
    finalMarks.value = totalMarks.value - incorrectMarks.value;

    // Save the final marks for the specific test ID
    marksMap[testId] = finalMarks.value;

    print("Final Marks for Test ID $testId: ${finalMarks.value}");
  }
  // void calculateFinalMarks() {
  //   finalMarks.value = totalMarks.value - incorrectMarks.value;
  //   print("finalMarks.toDouble()${finalMarks.toDouble()}");
  // }
// timer define duration
  void startTimer(int minutes, Function onTimeUp) {
    DateTime startTime = DateTime.now();
    DateTime endTime = startTime.add(Duration(minutes: minutes));

  
  // Calculate used time in minutes
  double usedTime = calculateUsedTime(startTime, endTime);

  print("Used Time: $usedTime minutes");

    // Format the start and end times
    startTimeFormatted.value =
        DateFormat('EEE MMM d yyyy HH:mm:ss \'GMT\'Z').format(startTime);
    endTimeFormatted.value =
        DateFormat('EEE MMM d yyyy HH:mm:ss \'GMT\'Z').format(endTime);

    duration.value = Duration(minutes: minutes);
    timer?.cancel();
    timer = Timer.periodic(Duration(seconds: 1), (timer) {
      if (duration.value.inSeconds > 0) {
        duration.value = duration.value - Duration(seconds: 1);
      } else {
        timer.cancel();
        onTimeUp();
      }
    });
  }

  void stopTimer() {
    if (timer != null) {
      timer?.cancel();
      timer = null;
    }
  }

  // Calculate used time in minutes
  double calculateUsedTime(DateTime startTime, DateTime endTime) {
    Duration usedDuration = endTime.difference(startTime);
    double usedTime = usedDuration.inSeconds / 60.0;
    return usedTime;
  }


  @override
  void onInit() {
    super.onInit();
    if (integerAnswer.value != null) {
      inputAnswer.value.text = integerAnswer.value.toString();
    }
  }

  final TestsearisController testcontroller = Get.find();


  testAnswerquestion() {
    try {
      isLoading.value = false;
      List<Answer> answers =
          answersList.map((item) => Answer.fromJson(item)).toList().obs;
      final param = SubmitAnswerparams()
        ..marksGot = 0
        ..userId = prefUtils.getID().toString()
        ..testId = testcontroller.testSeries[0].id
        ..startTime = startTimeFormatted.value
        ..submit = 'null'
        ..endTime = endTimeFormatted.value
        ..usedTime = usedTime.value
        ..answers = answers;
      var response = repositry1.testSeriesAnswer(
          'Bearer ${prefUtils.getToken().toString()}', param);

      if (response != null) {
        Get.offAll(Routes.HOME);
      }
      isLoading.value = false;
    } catch (e) {
      log(e.toString());
    }
  }

  // ///////////////////////////// submit test

  submitAnswerquestion() {
    try {
      isLoading.value = false;
      List<Answer> answers =
          answersList.map((item) => Answer.fromJson(item)).toList().obs;
      final param = SubmitAnswerparams()
        ..marksGot = 0
        ..userId = prefUtils.getID().toString()
        ..testId = testcontroller.testSeries[0].id
        ..startTime = startTimeFormatted.value
        ..submit = 'yes'
        ..endTime = endTimeFormatted.value
        ..usedTime = usedTime.value
        ..answers = answers;
      var response = repositry1.testSeriesAnswer(
          'Bearer ${prefUtils.getToken().toString()}', param);

      if (response != null) {
        Get.offAll(Routes.HOME);
      }
      isLoading.value = false;
    } catch (e) {
      log(e.toString());
    }
  }

  // Add these getters
  int get attemptedCount => answeredQuestions.length;
  int get notAttemptedCount =>
      (testSeries.value.questions?.length ?? 0) - attemptedCount;

  int get reviewCount => markedForReviewQuestions.length;

  @override
  void onClose() {
    timer?.cancel();
    inputAnswer.value.dispose();
    super.onClose();
  }

  void selectOption(int index, Function onTimeUp) {
    selectedOptionIndex.value = index;
  }

  void submitAnswer(Function onTimeUp) {
    if (selectedOptionIndex.value != -1) {
      answeredQuestions.add(currentQuestionIndex.value);

      // finalMarks.value;
      // incorrectMarks.vlaue.toDouble();
      totalMarks;
    }
    //else {
    //  totalMarks--;
    //  finalMarks.value--;
    //}
    selectedOptionIndex.value = -1;
    if (currentQuestionIndex.value < testSeries.value.questions!.length - 1) {
      currentQuestionIndex.value++;
    } else {
      onTimeUp();
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
    // All AnswerList
  }
}
