import 'dart:developer';

import 'package:exam_prep_tool/app/data/irepositry/itestseries_repo.dart';
import 'package:exam_prep_tool/app/data/modal/test_series/random_question_testseries.dart';
import 'package:exam_prep_tool/app/data/repositry/testseries_repo.dart';
import 'package:exam_prep_tool/app/modules/testsearis/controllers/testsearis_controller.dart';
import 'package:get/get.dart';
import 'package:get/get_rx/get_rx.dart';

class TestseriesMcqController extends GetxController {
  final arguments = Get.arguments;

  final TestsearisController testcontroller = Get.find();
  final TestSeriesRepo repositry1 = TestSeriesRepoIMPL();
  //RxList<RandomQues>? data;
  final randomques = <RandomQues>[].obs;
  RxBool isLoading = false.obs;
  var currentQuestionIndex = 0.obs;
  var selectedOptionIndex = (-1).obs;
  var score = 0.obs;
  var reviewMarkedQuestions =
      <int>[].obs; // List to store indexes of questions marked for review
  randomquestion() async {
    try {
      isLoading.value = true;

      var response =
          await repositry1.randomqueslist("668b8c6d024fee047e44b9a1");
      if (response.data != null) {
        randomques.value = response.data!.data ?? [];
        print("TestSeries ${response.data.toString()}");
        // If 'response.data.toString()' is a List, you might want to log each item separately
        for (var item in randomques.value) {
          print(item);
        }
      }
      isLoading.value = false;
    } catch (e) {
      log(e.toString());
    }
  }

  final List<Question> questions = [
    Question(
      questionText: "What is the capital of France?",
      options: ["Berlin", "London", "Paris", "Rome"],
      correctOptionIndex: 2,
    ),
    Question(
      questionText: "Which planet is known as the Red Planet?",
      options: ["Earth", "Jupiter", "Mars", "Venus"],
      correctOptionIndex: 2,
    ),
    // Add more questions as needed
  ];

  void selectOption(int index) {
    selectedOptionIndex.value = index;
  }

  void submitAnswer() {
    if (selectedOptionIndex.value ==
        questions[currentQuestionIndex.value].correctOptionIndex) {
      score.value++;
    }
    selectedOptionIndex.value = -1;
    if (currentQuestionIndex.value < questions.length - 1) {
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
    if (!reviewMarkedQuestions.contains(currentQuestionIndex.value)) {
      reviewMarkedQuestions.add(currentQuestionIndex.value);
    }
    selectedOptionIndex.value = -1; // Reset selected option
    if (currentQuestionIndex.value < questions.length - 1) {
      currentQuestionIndex.value++;
    } else {
      // Quiz is finished
      // You can navigate to a score screen or show a dialog
    }
  }

  final count = 0.obs;
  @override
  void onInit() {
    //ques = arguments[0];
    randomquestion();
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

  void increment() => count.value++;
}

class Question {
  final String questionText;
  final List<String> options;
  final int correctOptionIndex;

  Question({
    required this.questionText,
    required this.options,
    required this.correctOptionIndex,
  });
}
