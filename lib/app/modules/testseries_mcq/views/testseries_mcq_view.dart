import 'package:exam_prep_tool/app/data/modal/test_series/weekley_testSeries_modal.dart';
import 'package:exam_prep_tool/app/modules/testseries_mcq/views/actionbutton_page.dart';
import 'package:exam_prep_tool/app/modules/testseries_mcq/views/random_question_card_page.dart';
import 'package:exam_prep_tool/app/routes/app_pages.dart';
import 'package:exam_prep_tool/app/themes/app_style.dart';
import 'package:exam_prep_tool/app/utils/const.dart';
import 'package:exam_prep_tool/app/widgets/custom_alert_dialog.dart';
import 'package:exam_prep_tool/app/widgets/custom_colors.dart';
import 'package:exam_prep_tool/gen/assets.gen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_html/flutter_html.dart';

import 'package:get/get.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:velocity_x/velocity_x.dart';

import '../controllers/testseries_mcq_controller.dart';

class TestseriesMcqView extends GetView<TestseriesMcqController> {
  const TestseriesMcqView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final Testseries testSeries = Get.arguments as Testseries;

    controller.testSeries.value = testSeries;
 
    return Scaffold(
      appBar: buildAppbar(),
      body: controller.testSeries.value.questions!.isEmpty
          ? CustomAlertBox(
              title: "No Question",
              message: "Wait For Some time ",
              onOkPressed: () {
                controller.isVisible.value = false;
              })
          : LayoutBuilder(
              builder: (context, constraints) {
                // Check if the screen width is less than 600
                bool isSmallScreen = constraints.maxWidth < 600;
                return SingleChildScrollView(
                  child: Center(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 30),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Card(
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: SizedBox(
                                    height: Get.height,
                                    width: Get.width / 1.7,
                                    child: SingleChildScrollView(
                                      child: Column(
                                        children: [
                                          const SizedBox(height: 20),
                                        
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            // crossAxisAlignment:
                                            //     CrossAxisAlignment.center,
                                            children: [
                                              Obx(() {
                                                var question = controller
                                                        .testSeries
                                                        .value
                                                        .questions?[
                                                    controller
                                                        .currentQuestionIndex
                                                        .value];
                                                var currentQuestion = controller
                                                    .testSeries
                                                    .value
                                                    .questions
                                                    ?.length;
                                                return Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.start,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Padding(
                                                      padding: EdgeInsets.only(
                                                          left: 8,
                                                          right: isSmallScreen
                                                              ? 20
                                                              : 60),
                                                      child: Text(
                                                        'Question : ${controller.currentQuestionIndex.value + 1}',
                                                        style: const TextStyle(
                                                            fontSize: 18,
                                                            fontWeight:
                                                                FontWeight
                                                                    .bold),
                                                      ),
                                                    ),
                                                    Align(
                                                      alignment:
                                                          Alignment.centerLeft,
                                                      child: Text(
                                                        ' ${question!.type}',
                                                        style: const TextStyle(
                                                            fontWeight:
                                                                FontWeight
                                                                    .bold),
                                                      )
                                                          .box
                                                          .roundedSM
                                                          .make()
                                                          .color(Vx.purple600),
                                                    ),
                                                  ],
                                                );
                                              }),
                                              Column(
                                                children: [
                                                  "Marks".text.size(18).make(),
                                                  Row(
                                                    children: [
                                                      Container(
                                                        height: 25,
                                                        width: 45,
                                                        alignment:
                                                            Alignment.center,
                                                        decoration:
                                                            BoxDecoration(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(15),
                                                          color: Colors.red,
                                                        ),
                                                        child: Obx(() {
                                                          return Text(
                                                            ' ${controller.incorrectMarks.value}',
                                                            style:
                                                                const TextStyle(
                                                                    fontSize:
                                                                        16,
                                                                    color: Colors
                                                                        .white),
                                                          );
                                                        }),
                                                      ),
                                                      20.widthBox,
                                                      Obx(() {
                                                        return Container(
                                                          height: 25,
                                                          width: 45,
                                                          alignment:
                                                              Alignment.center,
                                                          decoration:
                                                              BoxDecoration(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        15),
                                                            color: Colors.green,
                                                          ),
                                                          child: Text(controller
                                                              .totalMarks.value
                                                              .toString()),
                                                        );
                                                      }),
                                                    ],
                                                  ).paddingOnly(
                                                      right: isSmallScreen
                                                          ? 20
                                                          : 60), // Adjust padding based on screen size
                                                ],
                                              ),
                                            ],
                                          ),
                                          Obx(() {
                                            var question = controller.testSeries
                                                    .value.questions?[
                                                controller.currentQuestionIndex
                                                    .value];

                                            // Load the previously selected answer if available
                                            if (question != null) {
                                              controller.selectedOptionIndex
                                                      .value =
                                                  controller.savedAnswers[
                                                          question.id] ??
                                                      -1;
                                              controller.selectedOptionIndexes
                                                      .value =
                                                  controller.savedMsqAnswers[
                                                          question.id] ??
                                                      [];
                                              controller.inputAnswer.value
                                                  .text = controller
                                                      .savedIntegerAnswers[
                                                          question.id]
                                                      ?.toString() ??
                                                  '';
                                            }

                                            return SingleChildScrollView(
                                              child: Container(
                                                height: Get.height,
                                                child: Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.start,
                                                  children: [
                                                    if (question != null) ...[
                                                      Html(
                                                        data: """
                                              <pre><code>
                                              ${correctHtmlContent(question.question.toString())}
                                                </code></pre>
                                                                                            """,
                                                        style: {
                                                          "body": Style(
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            whiteSpace:
                                                                WhiteSpace
                                                                    .normal,
                                                            fontSize:
                                                                FontSize(16.0),
                                                          ),
                                                          "pre": Style(
                                                            whiteSpace:
                                                                WhiteSpace
                                                                    .normal,
                                                            fontFamily:
                                                                'monospace',
                                                          ),
                                                          "code": Style(
                                                            fontFamily:
                                                                'monospace',
                                                            whiteSpace:
                                                                WhiteSpace
                                                                    .normal,
                                                            backgroundColor:
                                                                Colors.grey
                                                                    .shade100,
                                                          ),
                                                        },
                                                      ).p(4).w(600),

                                                      8.heightBox,
                                                      if (question.questionImage !=
                                                              null &&
                                                          question
                                                              .questionImage!
                                                              .isNotEmpty)
                                                        Image.network(
                                                          "${imageUrl + question.questionImage.toString()}",
                                                          height: 160,
                                                          errorBuilder:
                                                              (context, error,
                                                                  stackTrace) {
                                                            return const Text(
                                                                ''); // Placeholder text
                                                          },
                                                        )
                                                      else
                                                        const Text(
                                                            ''), // Placeholder text when no image is available
                                                      const SizedBox(height: 2),
                                                      if (question.type!
                                                              .toLowerCase() ==
                                                          'mcq') ...[
                                                        ...List.generate(
                                                            question.options!
                                                                .length,
                                                            (index) {
                                                          return RadioListTile(
                                                            title: Text(question
                                                                .options![index]
                                                                .option
                                                                .toString()),
                                                            value: index,
                                                            groupValue: controller
                                                                .selectedOptionIndex
                                                                .value,
                                                            onChanged:
                                                                (int? value) {
                                                              if (controller
                                                                      .selectedOptionIndex
                                                                      .value ==
                                                                  value) {
                                                                controller
                                                                        .selectedOptionIndex
                                                                        .value =
                                                                    -1; // Unselect the option
                                                                controller
                                                                    .savedAnswers
                                                                    .remove(question
                                                                        .id); // Remove the saved answer
                                                              } else {
                                                                controller
                                                                    .selectedOptionIndex
                                                                    .value = value!;
                                                                controller.savedAnswers[
                                                                        question
                                                                            .id
                                                                            .toString()] =
                                                                    value; // Save selected option
                                                              }
                                                            },
                                                          );
                                                        }),
                                                      ] else if (question.type!
                                                              .toLowerCase() ==
                                                          'msq') ...[
                                                        ...List.generate(
                                                            question.options!
                                                                .length,
                                                            (index) {
                                                          return CheckboxListTile(
                                                            controlAffinity:
                                                                ListTileControlAffinity
                                                                    .leading,
                                                            title: Text(question
                                                                .options![index]
                                                                .option
                                                                .toString()),
                                                            value: controller
                                                                .selectedOptionIndexes
                                                                .contains(
                                                                    index),
                                                            onChanged:
                                                                (bool? value) {
                                                              if (value ==
                                                                  true) {
                                                                controller
                                                                    .selectedOptionIndexes
                                                                    .add(index);
                                                                controller
                                                                        .savedMsqAnswers[
                                                                    question.id
                                                                        .toString()] = controller
                                                                    .selectedOptionIndexes
                                                                    .toList(); // Save selected MSQ options
                                                              } else {
                                                                controller
                                                                    .selectedOptionIndexes
                                                                    .remove(
                                                                        index);
                                                                controller
                                                                        .savedMsqAnswers[
                                                                    question.id
                                                                        .toString()] = controller
                                                                    .selectedOptionIndexes
                                                                    .toList(); // Save updated MSQ options
                                                              }
                                                            },
                                                          );
                                                        }),
                                                      ] else if (question
                                                              .type ==
                                                          'integer') ...[
                                                        TextField(
                                                          controller: controller
                                                              .inputAnswer
                                                              .value,
                                                          decoration:
                                                              const InputDecoration(
                                                                  labelText:
                                                                      "Enter your answer"),
                                                          keyboardType:
                                                              TextInputType
                                                                  .number,
                                                          onChanged: (value) {
                                                            // Try parsing as an int first, if fails, parse as double
                                                            final intValue =
                                                                int.tryParse(
                                                                    value);
                                                            if (intValue !=
                                                                null) {
                                                              // If successfully parsed as int
                                                              controller
                                                                      .integerAnswer
                                                                      .value =
                                                                  intValue
                                                                      .toDouble(); // Store as double
                                                            } else {
                                                              // Otherwise, try parsing as double
                                                              controller
                                                                      .integerAnswer
                                                                      .value =
                                                                  double
                                                                      .tryParse(
                                                                          value);
                                                            }

                                                            // Save the value (either int converted to double, or double) in savedIntegerAnswers map
                                                            controller.savedIntegerAnswers[
                                                                    question.id
                                                                        .toString()] =
                                                                controller
                                                                        .integerAnswer
                                                                        .value ??
                                                                    0.0; // Default to 0.0 if parsing fails
                                                          },
                                                        ),
                                                      ],
                                                      Spacer(),
                                                      // ActionButtons()

                                                      Align(
                                                        alignment: Alignment
                                                            .bottomCenter,
                                                        child: Row(
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .start,
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .spaceBetween,
                                                          children: [
                                                            // Previous button
                                                            InkWell(
                                                              onTap: () {
                                                                if (controller
                                                                        .currentQuestionIndex
                                                                        .value >
                                                                    0) {
                                                                  controller
                                                                      .previousQuestion();
                                                                }
                                                              },
                                                              child: buildButton(
                                                                  "Previous"),
                                                            ),
                                                            2.widthBox,

                                                            // Save and Next button
                                                            InkWell(
                                                              onTap: () {
                                                                bool
                                                                    isAnswered =
                                                                    false;
                                                                String?
                                                                    selectedOption;
                                                                bool isCorrect =
                                                                    false;

                                                                // Logic for mcq, msq, and integer types (similar to your original code)
                                                                // Check if the answer is provided and validate it
                                                                if (question
                                                                        .type ==
                                                                    'mcq') {
                                                                  final selectedOptionIndex =
                                                                      controller
                                                                          .selectedOptionIndex
                                                                          .value;

                                                                  if (selectedOptionIndex !=
                                                                      -1) {
                                                                    selectedOption = question
                                                                        .options![
                                                                            selectedOptionIndex]
                                                                        .option;
                                                                    isAnswered =
                                                                        true;
                                                                    controller
                                                                            .savedAnswers[
                                                                        question
                                                                            .id
                                                                            .toString()] = selectedOptionIndex;
                                                                  }
                                                                } else if (question
                                                                        .type ==
                                                                    'msq') {
                                                                  if (controller
                                                                      .selectedOptionIndexes
                                                                      .isNotEmpty) {
                                                                    selectedOption = controller
                                                                        .selectedOptionIndexes
                                                                        .map((index) => question
                                                                            .options![
                                                                                index]
                                                                            .option)
                                                                        .join(
                                                                            ', ');
                                                                    isAnswered =
                                                                        true;
                                                                    isCorrect =
                                                                        controller
                                                                            .selectedOptionIndexes
                                                                            .every(
                                                                      (index) => question
                                                                          .explanation!
                                                                          .text!
                                                                          .contains(
                                                                        question
                                                                            .options![index]
                                                                            .option
                                                                            .toString(),
                                                                      ),
                                                                    );
                                                                  }
                                                                } else if (question
                                                                        .type ==
                                                                    'integer') {
                                                                  if (controller
                                                                          .integerAnswer
                                                                          .value !=
                                                                      null) {
                                                                    selectedOption = controller
                                                                        .integerAnswer
                                                                        .value
                                                                        .toString();
                                                                    isAnswered =
                                                                        true;
                                                                    isCorrect = question
                                                                            .explanation!
                                                                            .text ==
                                                                        selectedOption;
                                                                  }
                                                                }

                                                                if (isAnswered) {
                                                                  if (question
                                                                          .type !=
                                                                      'integer') {
                                                                    isCorrect = question
                                                                        .explanation!
                                                                        .text!
                                                                        .contains(
                                                                            selectedOption!);
                                                                  }

                                                                  final answerData =
                                                                      {
                                                                    "answer":
                                                                        selectedOption,
                                                                    "question":
                                                                        question
                                                                            .id,
                                                                    "isRight":
                                                                        isCorrect,
                                                                  };

                                                                  controller
                                                                      .answersList
                                                                      .add(
                                                                          answerData);

                                                                  if (isCorrect) {
                                                                    controller
                                                                            .totalMarks
                                                                            .value +=
                                                                        question
                                                                            .marks!;
                                                                  } else {
                                                                    controller
                                                                            .incorrectMarks
                                                                            .value +=
                                                                        question
                                                                            .negativeMarks!
                                                                            .toDouble();
                                                                  }

                                                                  controller
                                                                      .testAnswerquestion();
                                                                  controller
                                                                      .submitAnswer();
                                                                } else {
                                                                  controller
                                                                      .submitAnswer();
                                                                }
                                                              },
                                                              child: buildButton(
                                                                  "Save and Next"),
                                                            ),
                                                            2.widthBox,

                                                            // Mark for Review button
                                                            InkWell(
                                                              onTap: () {
                                                                bool
                                                                    isAnswered =
                                                                    false;
                                                                String?
                                                                    selectedOption;
                                                                bool isCorrect =
                                                                    false;

                                                                // Similar answer logic as above (mcq, msq, integer types)
                                                                if (question
                                                                        .type ==
                                                                    'mcq') {
                                                                  final selectedOptionIndex =
                                                                      controller
                                                                          .selectedOptionIndex
                                                                          .value;

                                                                  if (selectedOptionIndex !=
                                                                      -1) {
                                                                    selectedOption = question
                                                                        .options![
                                                                            selectedOptionIndex]
                                                                        .option;
                                                                    isAnswered =
                                                                        true;
                                                                  }
                                                                } else if (question
                                                                        .type ==
                                                                    'msq') {
                                                                  if (controller
                                                                      .selectedOptionIndexes
                                                                      .isNotEmpty) {
                                                                    selectedOption = controller
                                                                        .selectedOptionIndexes
                                                                        .map((index) => question
                                                                            .options![
                                                                                index]
                                                                            .option)
                                                                        .join(
                                                                            ', ');
                                                                    isAnswered =
                                                                        true;
                                                                  }
                                                                } else if (question
                                                                        .type ==
                                                                    'integer') {
                                                                  if (controller
                                                                          .integerAnswer
                                                                          .value !=
                                                                      null) {
                                                                    selectedOption = controller
                                                                        .integerAnswer
                                                                        .value
                                                                        .toString();
                                                                    isAnswered =
                                                                        true;
                                                                  }
                                                                }

                                                                if (isAnswered) {
                                                                  isCorrect = question
                                                                      .explanation!
                                                                      .text!
                                                                      .contains(
                                                                          selectedOption!);

                                                                  final answerData =
                                                                      {
                                                                    "answer":
                                                                        selectedOption,
                                                                    "question":
                                                                        question
                                                                            .id,
                                                                    "isRight":
                                                                        isCorrect,
                                                                  };

                                                                  controller
                                                                      .answersList
                                                                      .add(
                                                                          answerData);

                                                                  if (isCorrect) {
                                                                    controller
                                                                            .totalMarks
                                                                            .value +=
                                                                        question
                                                                            .marks!;
                                                                  } else {
                                                                    controller
                                                                            .incorrectMarks
                                                                            .value +=
                                                                        question
                                                                            .negativeMarks!
                                                                            .toDouble();
                                                                  }

                                                                  controller
                                                                      .markForReview();
                                                                } else {
                                                                  controller
                                                                      .markForReview();
                                                                }
                                                              },
                                                              child: buildButton(
                                                                  "Mark for Review"),
                                                            ),

                                                            // Unmark button to remove the question from the "Review" list
                                                            2.widthBox,
                                                            InkWell(
                                                              onTap: () {
                                                                controller
                                                                    .unmarkForReview(); // Implement this method in your controller to handle unmarking logic.
                                                              },
                                                              child:
                                                                  buildButton(
                                                                      "Unmark"),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                    
                                                    
                                                    ],
                                                  ],
                                                ).w(Get.width / 2),
                                              ),
                                            );
                                          }),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              // Conditionally display RandomQuestionPage based on screen width
                              if (!isSmallScreen) ...[
                                20.widthBox,
                                const RandomQuestionPage(),
                              ],
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
    );
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

  buildAppbar() {
    return AppBar(
      elevation: 0,
      iconTheme: const IconThemeData(color: Colors.white),
      title: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Image.asset(
            Assets.images.headerLogo.path,
            height: 40,
            width: 110,
            fit: BoxFit.contain,
          ),
          "Exam Prep Tool"
              .text
              .size(20)
              .textStyle(AppStyle.txtPoppinsSemiBold16White90002)
              .color(Vx.white)
              .make(),
        ],
      ),
      flexibleSpace: Container(
        decoration: BoxDecoration(gradient: lineargrdient),
      ),
      leading: IconButton(
        icon: const Icon(Icons.arrow_back),
        onPressed: () {
          Get.back();
        },
      ),
    );
  }

  
void onSomeEvent() {
    // Test ID ko retrieve karein (for example purposes)
    String testId = controller.testcontroller.testSeries[0].id.toString();

    // Delay to allow build to complete
    Future.delayed(Duration.zero, () {
    // Calculate and save final marks
    controller.calculateFinalMarks(testId);

    // Navigate to the next page
    Get.toNamed(Routes.TESTSERIES_VALUE_ANALYSIS, arguments: {
      "finalMarks": controller.marksMap[testId],
      "testId": testId,
    });
    });
}

  String _stripHtmlTags(String html) {
    RegExp exp = RegExp(r"<[^>]*>", multiLine: true, caseSensitive: false);
    return html.replaceAll(exp, '');
  }

  String correctHtmlContent(String html) {
    return html
        .replaceAll('&lt;', '<')
        .replaceAll('&gt;', '>')
        .replaceAll('<pre>', '')
        .replaceAll('</pre>', '')
        .replaceAll('<stdio.h>', '&lt;stdio.h&gt;')
        .replaceAll('</stdio.h>', '');
  }

  buildAnswerContainer(text, color) {
    return Container(
      alignment: Alignment.center,
      padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
      height: 45,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(width: 1, color: color)),
      child: Text(text),
    );
  }

  Widget buildEndButton() {
    return Container(
      height: 45,
      alignment: Alignment.center,
      width: 370,
      decoration: BoxDecoration(
          color: HexColor("#D20000"), borderRadius: BorderRadius.circular(5)),
      child: "End Test"
          .text
          .size(20)
          .fontWeight(FontWeight.bold)
          .color(Vx.white)
          .uppercase
          .make(),
    );
  }

}
