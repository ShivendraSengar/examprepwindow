import 'package:exam_prep_tool/app/data/modal/test_series/weekley_testSeries_modal.dart';
import 'package:exam_prep_tool/app/routes/app_pages.dart';
import 'package:exam_prep_tool/app/themes/app_style.dart';
import 'package:exam_prep_tool/app/utils/const.dart';
import 'package:exam_prep_tool/app/widgets/custom_colors.dart';
import 'package:exam_prep_tool/gen/assets.gen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'package:get/get.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:velocity_x/velocity_x.dart';

import '../controllers/testseries_mcq_controller.dart';

class RandomQuestionPage extends GetView<TestseriesMcqController> {
  const RandomQuestionPage({Key? key}) : super(key: key);  @override
  Widget build(BuildContext context) {

  final Testseries testSeries = Get.arguments as Testseries;

    controller.testSeries.value = testSeries;
    void submitTest() {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            //title: Text('Time is up!${testSeries.questions!.length}'),
            content: Container(
              height: Get.height / 4,
              width: 400,
              child: Center(
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      "Your Test has been submmited"
                          .text
                          .size(20)
                          .fontWeight(FontWeight.bold)
                          .bold
                          .make(),

                      10.heightBox,
                      //  10.heightBox,
                      "You got ${(controller.totalMarks.value - controller.incorrectMarks.toDouble()).toStringAsFixed(2)} marks"
                          .text
                          .purple500
                          .size(16)
                          .bold
                          .make()
                          .p16(),
                    ]),
              ),
            ),
            actions: <Widget>[
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      Get.back(); // Dismiss the dialog first
                    },
                    style:
                        ElevatedButton.styleFrom(backgroundColor: Colors.red),
                    child: Text('Cancel'),
                  ).p16(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ElevatedButton(
                        onPressed: () {
                          onSomeEvent();
                        },
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.green),
                        child: Text('View Analysis'),
                      ).p16(),
                    ],
                  ),
                ],
              ),
            ],
          );
        },
      );
    }

    // Define the onTimeUp function
    void onTimeUp() {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            //title: Text('Time is up!${testSeries.questions!.length}'),
            content: Container(
              height: Get.height / 2.5,
              width: 400,
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Obx(() {
                      final duration = controller.duration.value;
                      final hours = duration.inHours.toString().padLeft(2, '0');
                      final minutes =
                          (duration.inMinutes % 60).toString().padLeft(2, '0');
                      final seconds =
                          (duration.inSeconds % 60).toString().padLeft(2, '0');
                      return Column(
                        children: [
                          Table(
                            border: TableBorder.all(),
                            children: [
                              TableRow(children: [
                                "Time Remain".text.make().p8(),
                                "$hours:$minutes:$seconds".text.make().p8(),
                              ]),
                              TableRow(children: [
                                "Total Questions".text.make().p8(),
                                testSeries.questions!.length.text.make().p8(),
                              ]),
                              TableRow(children: [
                                "Mark For Review".text.make().p8(),
                                controller.markedForReviewQuestions.length.text
                                    .make()
                                    .p8(),
                              ]),
                              TableRow(children: [
                                "Attempted".text.make().p8(),
                                controller.attemptedCount
                                    .toString()
                                    .text
                                    .make()
                                    .p8(),
                              ]),
                              TableRow(children: [
                                "Not Attempted".text.make().p8(),
                                controller.notAttemptedCount.text.make().p8(),
                              ]),
                            ],
                          ).p16(),
                          //                          10.heightBox,
                          //                    "You got ${(controller.totalMarks.value - controller.incorrectMarks.toDouble()).toStringAsFixed(2)} marks"
                          // .text
                          // .purple500
                          // .size(16)
                          // .bold
                          // .make()
                          // .p16(),
                          10.heightBox,
                          "Are You Sure To Submit The Test !"
                              .text
                              .purple500
                              .size(18)
                              .bold
                              .make()
                              .p16(),
                          12.heightBox,
                        ],
                      );
                    }),
                  ],
                ),
              ),
            ),
            actions: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      submitTest();
                    },
                    style:
                        ElevatedButton.styleFrom(backgroundColor: Colors.green),
                    child: Text('YES'),
                  ).p16(),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    style:
                        ElevatedButton.styleFrom(backgroundColor: Colors.red),
                    child: Text('NO'),
                  ).p16(),
                ],
              ),
            ],
          );
        },
      );
    }

    // Start the timer with 1 hour for example
    controller.startTimer(testSeries.timeData!.duration!.toInt(), submitTest);
// double usedTime = controller.calculateUsedTime(controller. startTimeFormatted.value, DateTime.now());

    return  Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
                "${testSeries.questionType.toString()}"),
            20.widthBox,
            Card(
              elevation: 1,
              child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Container(
                      width: 360,
                      height: Get.height,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          'Time Remaining'
                              .text
                              .size(18)
                              .fontWeight(FontWeight.bold)
                              .make(),
                          8.heightBox,
                          Obx(() {
                            final duration = controller.duration.value;
                            final hours = duration.inHours
                                .toString()
                                .padLeft(2, '0');
                            final minutes = (duration.inMinutes % 60)
                                .toString()
                                .padLeft(2, '0');
                            final seconds = (duration.inSeconds % 60)
                                .toString()
                                .padLeft(2, '0');
                            return "$hours:$minutes:$seconds"
                                .text
                                .make();
                          }),
                          //Text(controller.arguments[0]),
                          "Time Remeaning"
                              .text
                              .size(18)
                              .fontWeight(FontWeight.bold)
                              .make(),
                          8.heightBox,
                        
                          Row(
                            mainAxisAlignment:
                                MainAxisAlignment.spaceBetween,
                            children: [
                              Obx(() {
                                return buildAnswerContainer(
                                    "${controller.answeredQuestions.value.length.toString()}  answered",
                                    Colors.green);
                              }),
                              Obx(() {
                                return buildAnswerContainer(
                                    "${controller.notAttemptedCount.toString()} unanswered",
                                    Colors.red);
                              }),
                              Obx(() {
                                return buildAnswerContainer(
                                    "${controller.markedForReviewQuestions.value.length.toString()} marked",
                                    Colors.purple);
                              })
                            ],
                          ),
                          //Text(questionsCount.toString()),
                          20.heightBox,
                        
                          Expanded(
                            child: Container(
                              width: 350,
                              child: GridView.builder(
                                gridDelegate:
                                    const SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 5,
                                  crossAxisSpacing: 8.0,
                                  mainAxisSpacing: 8.0,
                                ),
                                itemCount: testSeries.questions?.length,
                                itemBuilder: (context, index) {
                                  Color cardColor;
                        
                                  if (controller.answeredQuestions
                                      .contains(index)) {
                                    cardColor = Colors.green[100]!;
                                  } else if (controller
                                      .markedForReviewQuestions
                                      .contains(index)) {
                                    cardColor = Colors.purple[100]!;
                                  } else {
                                    cardColor = Colors.red[100]!;
                                  }
                        
                                  return Card(
                                    color: cardColor,
                                    child: Center(
                                      child: Text(
                                        '${index + 1}',
                                        style: const TextStyle(
                                            fontSize: 24),
                                      ),
                                    ),
                                  ).onTap(() {
                                    controller
                                        .updateCurrentQuestionIndex(
                                            index);
                                  });
                                },
                              ),
                            ),
                          ),
                        
                          buildEndButton().onTap(() {
                            controller.testcontroller.startTest();
                            (); // End test and show solution
                        
                            // Solution view logic
                        
                            onTimeUp();
                            controller.submitAnswerquestion();
                          })
                        ],
                      ))),
            ),
          ],
        ),
      
    );
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

  buildButton(text) {
    return Container(
      alignment: Alignment.center,
      height: 45,
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      decoration: BoxDecoration(
          color: HexColor("#BACDFF"), borderRadius: BorderRadius.circular(5)),
      child: Text(text),
    );
  }
 Widget buildRow() {
    return Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
            height: 45,
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(19)),
            child: Column(
              children: [
                Table(
                  border: TableBorder.all(),
                  children: [
                    //TableRow(children: [
                    //  "Time Remain".text.make().p8(),
                    //  "$hours:$minutes:$seconds".text.make().p8(),
                    //]),
                    TableRow(children: [
                      "Total Questions".text.make().p8(),
                      "65".text.make().p8(),
                    ]),
                    TableRow(children: [
                      "Mark For Review".text.make().p8(),
                      "5".text.make().p8(),
                    ]),
                    TableRow(children: [
                      "Attempted".text.make().p8(),
                      "45".text.make().p8(),
                    ]),
                    TableRow(children: [
                      "Not Attempted".text.make().p8(),
                      "15".text.make().p8(),
                    ]),
                  ],
                ).p16(),
                16.heightBox,
                "Are You Sure To Submit The Test !"
                    .text
                    .purple500
                    .size(18)
                    .bold
                    .make()
                    .p16(),
                16.heightBox,
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        // Handle Yes action
                      },
                      //style: ElevatedButton.styleFrom(primary: Colors.green),
                      child: Text('YES'),
                    ).p16(),
                    ElevatedButton(
                      onPressed: () {
                        // Handle No action
                      },
                      //style: ElevatedButton.,
                      child: Text('NO'),
                    ).p16(),
                  ],
                ),
              ],
            )));
  }

 void onSomeEvent() {
  // Test ID ko retrieve karein (for example purposes)
  String testId = controller.testcontroller.testSeries[0].id.toString();

  // Calculate and save final marks
  controller.calculateFinalMarks(testId);

  // Navigate to the next page
  Get.toNamed(Routes.TESTSERIES_VALUE_ANALYSIS, arguments: [
 controller.marksMap[testId],
    testId,]
  );
}
}
