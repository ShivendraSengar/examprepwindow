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
  RxBool isVisible = false.obs;
  // For Integer answers
// For Integer input field
  var savedAnswers =
      <String, int>{}; // Question ID -> Selected Option Index (for MCQ)
  var savedMsqAnswers = <String,
      List<int>>{}; // Question ID -> List of Selected Option Indexes (for MSQ)
  var savedIntegerAnswers = <String, double>{};
  // Initialize with saved value if exists
  void loadSavedAnswer(String questionId) {
    if (integerAnswer.value != null) {
      inputAnswer.value.text = integerAnswer.value.toString();
    } else if (savedIntegerAnswers.containsKey(questionId)) {
      integerAnswer.value = savedIntegerAnswers[questionId];
      inputAnswer.value.text = integerAnswer.value.toString();
    }
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
  var notvisited = <int>[].obs;
  var currentQuestionIndex = 0.obs;
  final testSeries = Testseries().obs; // Rx<Testseries>
  final arguments = Get.arguments;
  var selectedOptionIndex = (-1).obs;
  var selectedOptionIndexes = RxList<int>(); //
  var integerAnswer = Rx<double?>(null); // For storing integer type answers

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

  void submitAnswer() {
    if (selectedOptionIndex.value != -1 ||
        selectedOptionIndexes.isNotEmpty ||
        integerAnswer.value != null) {
      // Mark question as answered
      answeredQuestions.add(currentQuestionIndex.value);

      // Increment or decrement marks based on correctness
      // Already handled in your button logic (Save and Next, Mark for Review)

      // Reset selected options for next question
      selectedOptionIndex.value = -1;
      selectedOptionIndexes.clear();
      integerAnswer.value = null;

      // Move to next question if available
      if (currentQuestionIndex.value < testSeries.value.questions!.length - 1) {
        currentQuestionIndex.value++;
      } else {
        // onTimeUp(); // Quiz is finished
      }
    } else {
      submitAnswer(); // Skip unanswered questions
    }
  }

  // void submitAnswer() {
  //   if (selectedOptionIndex.value != -1 ||
  //       selectedOptionIndexes.isNotEmpty ||
  //       integerAnswer.value != null) {
  //     // Mark question as answered
  //     answeredQuestions.add(currentQuestionIndex.value);

  //     // Check if question is also marked for review
  //     if (markedForReviewQuestions.contains(currentQuestionIndex.value)) {
  //       // Remove it from marked for review list since it's now answered
  //       markedForReviewQuestions.remove(currentQuestionIndex.value);
  //       if (reviewMarks > 0) {
  //         reviewMarks--; // Decrement review marks because answer is now submitted
  //       }
  //     }

  //     // Reset selected options for next question
  //     selectedOptionIndex.value = -1;
  //     selectedOptionIndexes.clear();
  //     integerAnswer.value = null;

  //     // Move to next question if available
  //     if (currentQuestionIndex.value < testSeries.value.questions!.length - 1) {
  //       currentQuestionIndex.value++;
  //     } else {
  //       // onTimeUp(); // Quiz is finished
  //     }
  //   } else {
  //     submitAnswer(); // Skip unanswered questions
  //   }
  // }

  void previousQuestion() {
    if (currentQuestionIndex.value > 0) {
      currentQuestionIndex.value--;
      selectedOptionIndex.value = -1; // Reset selected option
    }
  }

  void unmarkForReview() {
    // Check if the current question is marked for review
    if (markedForReviewQuestions.contains(currentQuestionIndex.value)) {
      // Remove the question from the marked for review list
      markedForReviewQuestions.remove(currentQuestionIndex.value);
      answeredQuestions.remove(currentQuestionIndex.value);
      // Decrement review marks
      if (reviewMarks > 0) {
        reviewMarks--;
      }

      // Unselect any selected option for MCQ
      if (selectedOptionIndex.value != -1) {
        selectedOptionIndex.value = -1; // Reset the selected option
        savedAnswers.remove(testSeries.value
            .questions![currentQuestionIndex.value].id); // Remove saved answer
      }

      // Unselect any selected options for MSQ
      if (selectedOptionIndexes.isNotEmpty) {
        selectedOptionIndexes.clear(); // Clear all selected MSQ options
        savedMsqAnswers.remove(testSeries
            .value
            .questions![currentQuestionIndex.value]
            .id); // Remove saved MSQ answer
      }

      print("Question unmarked for review and answers unselected.");
    } else {
      print("Question is not marked for review.");
    }
  }

  void saveAndNext() {
    // Check if the current question is within the valid range
    final totalQuestions = testSeries.value.questions!.length;

    if (currentQuestionIndex.value < totalQuestions) {
      // Logic to save the answer goes here (e.g., store the answer value to the API or local list)

      // If the question is marked for review, remove it and update marks
      if (markedForReviewQuestions.contains(currentQuestionIndex.value)) {
        markedForReviewQuestions.remove(currentQuestionIndex.value);
        reviewMarks--; // Decrement review marks when saved
        currentQuestionIndex.value++;
      }

      // Move to next question
      if (currentQuestionIndex.value < totalQuestions - 1) {
        currentQuestionIndex.value++;
      } else {
        print("Quiz finished.");
      }
    } else {
      print("No more questions.");
    }
  }

  void updateCurrentQuestionIndex(int index) {
    currentQuestionIndex.value = index;
    // All AnswerList
  }

  void markForReview() {
    // Total number of questions
    final totalQuestions = testSeries.value.questions!.length;

    // Check if the current question index is within the valid range
    if (currentQuestionIndex.value < totalQuestions) {
      // Add the current question to the marked for review list if not already added
      if (!markedForReviewQuestions.contains(currentQuestionIndex.value)) {
        markedForReviewQuestions.add(currentQuestionIndex.value);
        reviewMarks++;
        answeredQuestions
            .add(currentQuestionIndex.value); // Increment review marks
      }

      // Reset selected option index
      selectedOptionIndex.value = -1;

      // Move to next question
      if (currentQuestionIndex.value < totalQuestions - 1) {
        currentQuestionIndex.value++;
      } else {
        print("Quiz is finished, no more questions to review.");
      }
    } else {
      print("Index out of range: All questions have been reviewed.");
    }
  }
}
