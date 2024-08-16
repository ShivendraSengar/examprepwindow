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
      void submitTest() {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            //title: Text('Time is up!${testSeries.questions!.length}'),
            content: Container(
              height: Get.height/5,
              width: 400,
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                  "Your TEst has been submmited".text.make(),
                     
                             10.heightBox,
                            //  10.heightBox,
"You got ${(controller.totalMarks.value - controller.incorrectMarks.toDouble()).toStringAsFixed(2)} marks"
    .text
    .purple500
    .size(16)
    .bold
    .make()
    .p16(),

                  ]
                ),
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
  Get.offAll(Routes.HOME); 
                    },
                    style:
                        ElevatedButton.styleFrom(backgroundColor: Colors.green),
                    child: Text('YES'),
                  ).p16(),
                 
                   
                  
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
              height: Get.height/4,
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
                       "You got ${(controller.totalMarks.value - controller.incorrectMarks.toDouble()).toStringAsFixed(2)} marks"
    .text
    .purple500
    .size(16)
    .bold
    .make()
    .p16(),
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
    controller.startTimer(testSeries.timeData!.duration!.toInt(), onTimeUp);
// double usedTime = controller.calculateUsedTime(controller. startTimeFormatted.v, DateTime.now());

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
                // Obx(() {
                //  return Text(controller.startTimeFormatted.toString());
                // }),
               
               
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
                                            child: Obx(() {
  return Text(
    ' ${controller.incorrectMarks.value}',
    style: TextStyle(fontSize: 16, color: Colors.white),
  );
}),
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
                                                  .totalMarks.value
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
  var question = controller.testSeries.value.questions?[
      controller.currentQuestionIndex.value];

  return SingleChildScrollView(
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        if (question != null) ...[
          Text(
            ' ${question.question}',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 2),
          ...List.generate(question.options!.length, (index) {
            return RadioListTile(
              title: Text(question.options![index].option.toString()),
              value: index,
              groupValue: controller.selectedOptionIndex.value,
              onChanged: (int? value) {
                if (controller.selectedOptionIndex.value == value) {
                  // Unselect the option if the same option is clicked again
                  controller.selectedOptionIndex.value = -1;
                } else {
                  // Select the new option
                  controller.selectedOptionIndex.value = value!;
                }
              },
            );
          }),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              InkWell(
                onTap: () {
                  if (controller.currentQuestionIndex.value > 0) {
                    controller.previousQuestion();
                  }
                },
                child: buildButton("Previous"),
              ),
              InkWell(
                onTap: () {
                  controller.markForReview();
                },
                child: buildButton("Mark for Review"),
              ),
              InkWell(
                onTap: () {
                  if (controller.currentQuestionIndex.value <
                      testSeries.questions!.length) {

                    final selectedOptionIndex = controller.selectedOptionIndex.value;

                    if (selectedOptionIndex != -1) {
                      final selectedOption = question!.options![selectedOptionIndex].option;

                      // Explanation के text से compare कर रहे हैं कि selected option सही है या नहीं
                      bool isCorrect = question.explanation!.text!.contains(selectedOption!);
// Create a map with the required data
        final answerData = {
          "answer": selectedOption,
          "question": question.id,
          "isRight": isCorrect,
        };

        // Add the answer data to the answersList
       controller. answersList.add(answerData);
        print("List data${controller.answerlist.length}");
                      if (isCorrect) {
                        // सही उत्तर है तो मार्क्स जोड़ें
                        controller.totalMarks.value += question.marks!;
                        // controller.finalMarks.value += question.marks!;
                      } else {
                        // गलत उत्तर है तो नेगेटिव मार्क्स सिर्फ incorrectMarks में जोड़ें
                        controller.incorrectMarks.value += question.negativeMarks!.toDouble();
                      }

                      // Debugging के लिए print statements
                      print("Question ID: ${question.id}");
                      print("Selected Option: $selectedOption, Correct: $isCorrect");
                      print("Total Marks: ${controller.totalMarks.value}");
                      print("Incorrect Marks: ${controller.incorrectMarks.value}");
                      print("Negative Marks from Model: ${question.negativeMarks}");
                    }
                  controller.   testAnswerquestion();

                    // उत्तर को सबमिट करने के बाद अगला प्रश्न
                    controller.submitAnswer(onTimeUp);
                  }
                },
                child: buildButton("Save and Next"),
              ),
            ],
          ).w(400),
        ],
      ],
    ).w(Get.width),
  );
}),

//           Obx(() {
//   var question = controller.testSeries.value.questions?[
//       controller.currentQuestionIndex.value];
  
//   return Column(
//     crossAxisAlignment: CrossAxisAlignment.start,
//     mainAxisAlignment: MainAxisAlignment.start,
//     children: [
//       if (question != null) ...[
//         Text(
//           ' ${question.question}',
//           style: TextStyle(fontWeight: FontWeight.bold),
//         ),
//         SizedBox(height: 2),
//         ...List.generate(question.options!.length, (index) {
//           return RadioListTile(
//             title: Text(question.options![index].option.toString()),
//             value: index,
//             groupValue: controller.selectedOptionIndex.value,
//             onChanged: (int? value) {
//               if (controller.selectedOptionIndex.value == value) {
//                 // Unselect the option if the same option is clicked again
//                 controller.selectedOptionIndex.value = -1;
//               } else {
//                 // Select the new option
//                 controller.selectedOptionIndex.value = value!;
//                 final selectedOption = question.options![value].option;

//                 // Check if the selected answer matches the explanation text
//                 bool isCorrect = question.explanation!.text!.contains(selectedOption!);

//                 // Update total marks and final marks based on the selected option
//                 if (isCorrect) {
//                   controller.totalMarks.value += question.marks!;
//                   controller.finalMarks.value += question.marks!;
//                 } else {
//                   // controller.totalMarks.value -= question.negativeMarks!.toInt();
//                   // controller.incorrectMarks.value += question.negativeMarks!.toInt(); // Save incorrect marks in a different variable
//                 }
//                 print("question id: ${testSeries.questions![index].id},");
//                 print("total marks: ${question.negativeMarks!.toInt()},");
//                 print("Selected value: ${controller.selectedOptionIndex.value}, Correct: $isCorrect");
//                 print("Final marks: ${controller.finalMarks.value}");
//                 print("Incorrect marks: ${controller.incorrectMarks.value}");
//               }
//             },
//           );
//         }),
//         Row(
//           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//           children: [
//             InkWell(
//               onTap: () {
//                 if (controller.currentQuestionIndex.value > 0) {
//                   controller.previousQuestion();
//                 }
//               },
//               child: buildButton("Previous"),
//             ),
//             InkWell(
//               onTap: () {
//                 controller.markForReview();
//               },
//               child: buildButton("Mark for Review"),
//             ),
//             InkWell(
//               onTap: () {
//                 if (controller.currentQuestionIndex.value <
//                     testSeries.questions!.length ) {
//                   controller.submitAnswer(onTimeUp);
//                 }
//               },
//               child: buildButton("Save and Next"),
//             ),
//           ],
//         ).w(400),
//       ],
//     ],
//   ).w(700);
// }),


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
                                  Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Obx(() {
                return buildAnswerContainer(
                    "${controller.answeredQuestions.length.toString()} answered",
                    Colors.green);
              }),
              // Obx(() {
              //   return buildAnswerContainer(
              //       "${(testSeries.questions?.length - controller.answeredQuestions.length).toString()} unanswered",
              //       Colors.red);
              // }),
              Obx(() {
                return buildAnswerContainer(
                    "${controller.markedForReviewQuestions.length.toString()} marked",
                    Colors.purple);
              }),
            ],
          ),
          Expanded(
            child: Container(
              width: 350,
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 5,
                  crossAxisSpacing: 8.0,
                  mainAxisSpacing: 8.0,
                ),
                itemCount: testSeries.questions?.length,
                itemBuilder: (context, index) {
                  Color cardColor;

                  if (controller.answeredQuestions.contains(index)) {
                    cardColor = Colors.green[100]!;
                  } else if (controller.markedForReviewQuestions.contains(index)) {
                    cardColor = Colors.purple[100]!;
                  } else {
                    cardColor = Colors.red[100]!;
                  }

                  return 
                  Card(
                    color: cardColor,
                    child: Center(
                      child: Text(
                        '${index + 1}',
                        style: const TextStyle(fontSize: 24),
                      ),
                    ),
                  ).onTap(() {
                    controller.updateCurrentQuestionIndex(index);
                  });
                },
              ),
            ),
          ),
        
                                     Expanded(
  child: Container(
    width: 350,
    child: GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 5,
        crossAxisSpacing: 8.0,
        mainAxisSpacing: 8.0,
      ),
      itemCount: testSeries.questions?.length,
      itemBuilder: (context, index) {
        var question = testSeries.questions?[index];
        Color cardColor;

        // If the question is answered, set the card color to green.
        if (controller.answeredQuestions.contains(index)) {
          cardColor = const Color.fromARGB(255, 50, 209, 55);
        }
        // If the question is marked for review, set the card color to blue.
        else if (controller.markedForReviewQuestions.contains(index)) {
          cardColor = const Color.fromARGB(255, 55, 139, 207);
        }
        // For other questions, set the card color to grey.
        else {
          cardColor = const Color.fromARGB(255, 191, 26, 26)!;
        }

        return Card(
          color: cardColor,
          child: Center(
            child: Text(
              '${index + 1}',
              style: const TextStyle(fontSize: 24),
            ),
          ),
        ).onInkTap(() {
          controller.updateCurrentQuestionIndex(index);
        });
      },
    ),
  ),
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
