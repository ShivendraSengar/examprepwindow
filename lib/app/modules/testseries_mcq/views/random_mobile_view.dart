import 'package:exam_prep_tool/app/data/modal/test_series/weekley_testSeries_modal.dart';
import 'package:exam_prep_tool/app/modules/testseries_mcq/controllers/testseries_mcq_controller.dart';
import 'package:flutter/material.dart';
import 'package:exam_prep_tool/app/routes/app_pages.dart';
import 'package:get/get.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:velocity_x/velocity_x.dart';

class RandomMobileView extends GetView<TestseriesMcqController> {
  const RandomMobileView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final Testseries testSeries = Get.arguments as Testseries;
    void submitTest() {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        content: Container(
          height: Get.height / 4,
          width: 400,
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                "Your Test has been submitted"
                    .text
                    .size(20)
                    .fontWeight(FontWeight.bold)
                    .bold
                    .make(),
                10.heightBox,
                "You got ${(controller.totalMarks.value - controller.incorrectMarks.toDouble()).toStringAsFixed(2)} marks"
                    .text
                    .purple500
                    .size(16)
                    .bold
                    .make()
                    .p16(),
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
                  // First, dismiss the dialog
                  Navigator.of(context).pop();
controller.testcontroller.startTest();
                            (); // End test and show solution
                        
                         
                        
                            controller.submitAnswerquestion();
                  onSomeEvent();
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green,
                ),
                child: Text('OK'),
              ).p16(),
            ],
          ),
        ],
      );
    },
  );
} // // Define the onTimeUp function
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
                      // submitTest();
                    },
                    style:
                        ElevatedButton.styleFrom(backgroundColor: Colors.green),
                    child: const Text('YES'),
                  ).p16(),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    style:
                        ElevatedButton.styleFrom(backgroundColor: Colors.red),
                    child: const Text('NO'),
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
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Icon(
              Icons.timelapse_outlined,
              size: 40,
            ),
            30.widthBox,
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Obx(() {
                  final duration = controller.duration.value;
                  final hours = duration.inHours.toString().padLeft(2, '0');
                  final minutes =
                      (duration.inMinutes % 60).toString().padLeft(2, '0');
                  final seconds =
                      (duration.inSeconds % 60).toString().padLeft(2, '0');
                  return Text("$hours:$minutes:$seconds");
                }),
                const SizedBox(height: 8),
                Text("${controller.testSeries.value.testName?.toString()}"),
              ],
            )
          ],
        ),
        const SizedBox(height: 20),
        Padding(
          padding: const EdgeInsets.all(0.0),
          child: SizedBox(
            width: 400,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Obx(() {
                      var currentQuestion =
                          controller.testSeries.value.questions?.length;
                      return Padding(
                          padding: const EdgeInsets.only(left: 8, right: 8),
                          child: Container(
                            child: Text(
                              ' ${controller.currentQuestionIndex.value + 1}',
                              style: const TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.bold),
                            ),
                          ));
                    }),
                    Obx(() {
                      return buildAnswerContainer(
                          "${controller.totalMarks.value}  ", Colors.green);
                    }),
                    Obx(() {
                      return buildAnswerContainer(
                          "${controller.incorrectMarks.toString()} ",
                          Colors.red);
                    }),
                    buildEndButton().onTap(() {
                    
                      controller.testcontroller.startTest();
                          // End test and show solution

                          // Solution view logic
                          controller.stopTimer();
                          onTimeUp();
                          controller.submitAnswerquestion();
                          controller.testcontroller.dispose();
                      print("End Test");
                    }),
                  ],
                ),
                const SizedBox(height: 20),
                Card(
                  elevation: 1,
                  child: Container(
                    height: 60,
                    width: double.infinity,
                    padding: EdgeInsets.all(3),
                    // Set a specific height for the GridView
                    child: ListView.builder(
                      // gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      scrollDirection: Axis.horizontal,

                      itemCount: testSeries.questions?.length ?? 0,
                      itemBuilder: (context, index) {
                        // Color cardColor;

                        // if (controller.answeredQuestions.contains(index)) {
                        //   cardColor = const Color.fromARGB(255, 106, 232, 110)!;
                        // } else if (controller.markedForReviewQuestions
                        //     .contains(index)) {
                        //   cardColor = const Color.fromARGB(255, 210, 94, 231)!;
                        // } else {
                        //   cardColor = Color.fromARGB(255, 224, 148, 156)!;
                        // }

                        return Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Obx(() {
                              // only color chnaged box
                              Color cardColor;
                              if (controller.answeredQuestions
                                  .contains(index)) {
                                cardColor =
                                    const Color.fromARGB(255, 32, 233, 42)!;
                              } else if (controller.markedForReviewQuestions
                                  .contains(index)) {
                                cardColor =
                                    const Color.fromARGB(255, 200, 22, 231)!;
                              } else if (controller.notvisited
                                  .contains(index)) {
                                cardColor =
                                    const Color.fromARGB(255, 201, 27, 27)!;
                              } else {
                                cardColor = Colors.white!;
                              }
                              return Container(
                                  width: 40,
                                  height: 40,
                                  alignment: Alignment.center,
                                  decoration: BoxDecoration(
                                      color: cardColor,
                                      shape: BoxShape.circle,
                                      border: Border.all(
                                          width: 1, color: Colors.black26)),
                                  child: Center(
                                    child: Text(
                                      '${index + 1}',
                                      style: const TextStyle(fontSize: 24),
                                    ),
                                  )).onTap(() {
                                controller.updateCurrentQuestionIndex(index);
                              });
                            }));
                      },
                    ),
                  ),
                ),
                const SizedBox(height: 8),
                Text(testSeries.questionType.toString()),
              ],
            ),
          ),
        ),

      ],
    );
  }

  void onSomeEvent() {
    // Test ID ko retrieve karein (for example purposes)
    String testId = controller.testcontroller.testSeries[0].id.toString();

    // Calculate and save final marks
    controller.calculateFinalMarks(testId);

    // Navigate to the next page
    Get.toNamed(Routes.TESTSERIES_VALUE_ANALYSIS, arguments: {
      "finalMarks": controller.marksMap[testId],
      "testId": testId,
    });
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
      padding: EdgeInsets.symmetric(horizontal: 5, vertical: 5),
      height: 45,
      decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(width: 1, color: color)),
      child: Text(text),
    );
  }

  Widget buildEndButton() {
    return Container(
      height: 45,
      alignment: Alignment.center,
      width: 120,
      decoration: BoxDecoration(
          color: HexColor("#D20000"), borderRadius: BorderRadius.circular(5)),
      child: "End Test"
          .text
          .size(16)
          .fontWeight(FontWeight.bold)
          .color(Vx.white)
          .uppercase
          .make(),
    );
  }
}
