import 'package:exam_prep_tool/app/data/modal/test_series/weekley_testSeries_modal.dart';
import 'package:exam_prep_tool/app/modules/testseries_mcq/controllers/testseries_mcq_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';

import 'package:exam_prep_tool/app/routes/app_pages.dart';

import 'package:flutter/widgets.dart';

import 'package:get/get.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:velocity_x/velocity_x.dart';

class ActionButtons extends GetView<TestseriesMcqController> {
  const ActionButtons({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      var question = controller
          .testSeries.value.questions?[controller.currentQuestionIndex.value];

      // Load the previously selected answer if available
      if (question != null) {
        controller.selectedOptionIndex.value =
            controller.savedAnswers[question.id] ?? -1;
        controller.selectedOptionIndexes.value =
            controller.savedMsqAnswers[question.id] ?? [];
        controller.inputAnswer.value.text =
            controller.savedIntegerAnswers[question.id]?.toString() ?? '';
      }
      return Align(
        alignment: Alignment.bottomCenter,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            // Previous button
            InkWell(
              onTap: () {
                if (controller.currentQuestionIndex.value > 0) {
                  controller.previousQuestion();
                }
              },
              child: buildButton("Previous"),
            ),
            2.widthBox,

            // Save and Next button
            InkWell(
              onTap: () {
                bool isAnswered = false;
                String? selectedOption;
                bool isCorrect = false;

                // Logic for mcq, msq, and integer types (similar to your original code)
                // Check if the answer is provided and validate it
                if (question!.type == 'mcq') {
                  final selectedOptionIndex =
                      controller.selectedOptionIndex.value;

                  if (selectedOptionIndex != -1) {
                    selectedOption =
                        question.options![selectedOptionIndex].option;
                    isAnswered = true;
                    controller.savedAnswers[question.id.toString()] =
                        selectedOptionIndex;
                  }
                } else if (question.type == 'msq') {
                  if (controller.selectedOptionIndexes.isNotEmpty) {
                    selectedOption = controller.selectedOptionIndexes
                        .map((index) => question.options![index].option)
                        .join(', ');
                    isAnswered = true;
                    isCorrect = controller.selectedOptionIndexes.every(
                      (index) => question.explanation!.text!.contains(
                        question.options![index].option.toString(),
                      ),
                    );
                  }
                } else if (question.type == 'integer') {
                  if (controller.integerAnswer.value != null) {
                    selectedOption = controller.integerAnswer.value.toString();
                    isAnswered = true;
                    isCorrect = question.explanation!.text == selectedOption;
                  }
                }

                if (isAnswered) {
                  if (question.type != 'integer') {
                    isCorrect =
                        question.explanation!.text!.contains(selectedOption!);
                  }

                  final answerData = {
                    "answer": selectedOption,
                    "question": question.id,
                    "isRight": isCorrect,
                  };

                  controller.answersList.add(answerData);

                  if (isCorrect) {
                    controller.totalMarks.value += question.marks!;
                  } else {
                    controller.incorrectMarks.value +=
                        question.negativeMarks!.toDouble();
                  }

                  controller.testAnswerquestion();
                  controller.submitAnswer();
                } else {
                  controller.submitAnswer();
                }
              },
              child: buildButton("Save and Next"),
            ),
            2.widthBox,

            // Mark for Review button
            InkWell(
              onTap: () {
                bool isAnswered = false;
                String? selectedOption;
                bool isCorrect = false;

                // // Similar answer logic as above (mcq, msq, integer types)
                if (question!.type == 'mcq') {
                  final selectedOptionIndex =
                      controller.selectedOptionIndex.value;

                  if (selectedOptionIndex != -1) {
                    selectedOption =
                        question.options![selectedOptionIndex].option;
                    isAnswered = true;
                  }
                } else if (question.type == 'msq') {
                  if (controller.selectedOptionIndexes.isNotEmpty) {
                    selectedOption = controller.selectedOptionIndexes
                        .map((index) => question.options![index].option)
                        .join(', ');
                    isAnswered = true;
                  }
                } else if (question.type == 'integer') {
                  if (controller.integerAnswer.value != null) {
                    selectedOption = controller.integerAnswer.value.toString();
                    isAnswered = true;
                  }
                }

                if (isAnswered) {
                  isCorrect =
                      question.explanation!.text!.contains(selectedOption!);

                  final answerData = {
                    "answer": selectedOption,
                    "question": question.id,
                    "isRight": isCorrect,
                  };

                  controller.answersList.add(answerData);

                  if (isCorrect) {
                    controller.totalMarks.value += question.marks!;
                  } else {
                    controller.incorrectMarks.value +=
                        question.negativeMarks!.toDouble();
                  }

                  controller.markForReview();
                } else {
                  controller.markForReview();
                }
              },
              child: buildButton("Mark for Review"),
            ),

            // Unmark button to remove the question from the "Review" list
            2.widthBox,
            InkWell(
              onTap: () {
                controller
                    .unmarkForReview(); // Implement this method in your controller to handle unmarking logic.
              },
              child: buildButton("Unmark"),
            ),
          ],
        ),
      );
    });
  }

  buildButton(text) {
    return Container(
      alignment: Alignment.center,
      height: 45,
      padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
      decoration: BoxDecoration(
          color: HexColor("#BACDFF"), borderRadius: BorderRadius.circular(5)),
      child: Text(
        text,
        style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
      ),
    );
  }
}
