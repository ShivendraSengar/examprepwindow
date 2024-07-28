import 'package:exam_prep_tool/app/data/modal/test_series/weekley_testSeries.dart';
import 'package:exam_prep_tool/app/routes/app_pages.dart';
import 'package:exam_prep_tool/app/themes/app_style.dart';
import 'package:exam_prep_tool/app/widgets/custom_colors.dart';
import 'package:exam_prep_tool/gen/assets.gen.dart';
import 'package:flutter/material.dart';

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
    // Define the onTimeUp function
    void onTimeUp() {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            //title: Text('Time is up!${testSeries.questions!.length}'),
            content: Container(
              height: 300,
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
                      Get.toNamed(Routes.HOME);
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
    controller.startTimer(testSeries.timeData!.duration!.toInt(), onTimeUp);

    return Scaffold(
      appBar: buildAppbar(),
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                //Obx(() {
                //  return Text(controller.startTimeFormatted.toString());
                //}),
                //Text(controller.endTime.toString()),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Card(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: SizedBox(
                            height: Get.height,
                            child: Column(children: [
                              SizedBox(height: 20),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Obx(() {
                                    var currentQuestion = controller
                                        .testSeries.value.questions?.length;
                                    return Padding(
                                        padding: const EdgeInsets.only(
                                            left: 8, right: 60),
                                        child: Text(
                                          'Question : ${controller.currentQuestionIndex.value + 1}',
                                          style: const TextStyle(
                                              fontSize: 18,
                                              fontWeight: FontWeight.bold),
                                        ));
                                  }),
                                  60.widthBox,
                                  Column(
                                    children: [
                                      "Marks".text.size(18).make(),
                                      Row(
                                        children: [
                                          Container(
                                            height: 25,
                                            width: 45,
                                            alignment: Alignment.center,
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(15),
                                                color: Colors.red),
                                            child: const Text("-1"),
                                          ),
                                          20.widthBox,
                                          Obx(() {
                                            return Container(
                                              height: 25,
                                              width: 45,
                                              alignment: Alignment.center,
                                              decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(15),
                                                  color: Colors.green),
                                              child: Text(controller
                                                  .finalMarks.value
                                                  .toString()),
                                            );
                                          })
                                        ],
                                      ).paddingOnly(right: 20)
                                    ],
                                  )
                                ],
                              ),
                              Obx(() {
                                var question =
                                    controller.testSeries.value.questions?[
                                        controller.currentQuestionIndex.value];
                                return Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    if (question != null) ...[
                                      Text(
                                        ' ${question.question}',
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold),
                                      ),
                                      SizedBox(height: 2),
                                      ...List.generate(question.options!.length,
                                          (index) {
                                        return RadioListTile(
                                          title: Text(question
                                              .options![index].option
                                              .toString()),
                                          value: index,
                                          groupValue: controller
                                              .selectedOptionIndex.value,
                                          onChanged: (int? value) {
                                            if (value != null) {
                                              final selectedOptionIndex =
                                                  question
                                                      .options![value].isRight;

                                              // Update total marks based on the selected option
                                              if (selectedOptionIndex!) {
                                                controller.totalMarks.value;
                                                controller.finalMarks.value =
                                                    controller.totalMarks.value;
                                                print(
                                                    "Final marks${controller.finalMarks.value}");
                                              } else {
                                                controller.totalMarks.value -
                                                    0.33;
                                              }

                                              // Update the selected option index
                                              controller.selectOption(value);

                                              print(
                                                  "Selected value: ${controller.selectedOptionIndex.value}, Correct: ${question.options![value].isRight}${controller.totalMarks.value}");
                                            }
                                          },
                                        );
                                      }),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          InkWell(
                                            onTap: () {
                                              if (controller
                                                      .currentQuestionIndex
                                                      .value >
                                                  0) {
                                                controller.previousQuestion();
                                              }
                                            },
                                            child: buildButton("Previous"),
                                          ),
                                          InkWell(
                                            onTap: () {
                                              controller.markForReview();
                                            },
                                            child:
                                                buildButton("Mark for Review"),
                                          ),
                                          InkWell(
                                            onTap: () {
                                              if (controller
                                                      .selectedOptionIndex <
                                                  testSeries.questions!.length -
                                                      1) {
                                                controller.submitAnswer();
                                              } else {}
                                            },
                                            child: buildButton("Save and Next"),
                                          ),
                                        ],
                                      ).w(400),
                                    ],
                                  ],
                                ).w(700);
                              }),
                            ])),
                      ),
                    ),
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
                                        width:
                                            350, // Set the width of the container to 350
                                        child: GridView.builder(
                                            gridDelegate:
                                                const SliverGridDelegateWithFixedCrossAxisCount(
                                              crossAxisCount:
                                                  5, // Number of items per row
                                              crossAxisSpacing:
                                                  8.0, // Spacing between items horizontally
                                              mainAxisSpacing:
                                                  8.0, // Spacing between items vertically
                                            ),
                                            itemCount:
                                                testSeries.questions?.length,
                                            itemBuilder: (context, index) {
                                              var question =
                                                  testSeries.questions?[index];
                                              Color cardColor;
                                              if (controller
                                                  .markedForReviewQuestions
                                                  .contains(index)) {
                                                cardColor = Colors.purple[100]!;
                                              } else if (controller
                                                  .answeredQuestions
                                                  .contains(index)) {
                                                cardColor = Colors.green[100]!;
                                              } else {
                                                cardColor = Colors.grey[200]!;
                                              }
                                              return Card(
                                                color: cardColor,
                                                child: Center(
                                                  child: Text(
                                                    '${index + 1}', // Display the number from 1 to itemCount
                                                    style: const TextStyle(
                                                        fontSize: 24),
                                                  ),
                                                ),
                                              ).onInkTap(() {
                                                controller
                                                    .updateCurrentQuestionIndex(
                                                        index);
                                              });
                                              //  },
                                              //);
                                            })),
                                  ),

                                  buildEndButton().onTap(() {
                                    onTimeUp();
                                    //controller.timer!.cancel();
                                  })
                                ],
                              ))),
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
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
}
