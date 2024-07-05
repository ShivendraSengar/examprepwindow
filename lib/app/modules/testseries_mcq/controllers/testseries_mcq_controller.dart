import 'package:get/get.dart';

class TestseriesMcqController extends GetxController {
  var currentQuestionIndex = 0.obs;
  var selectedOptionIndex = (-1).obs;
  var score = 0.obs;
  var reviewMarkedQuestions =
      <int>[].obs; // List to store indexes of questions marked for review

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
