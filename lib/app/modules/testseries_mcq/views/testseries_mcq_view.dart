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
    int itemCount = int.tryParse(controller.arguments[1].toString()) ?? 0;
    final List<dynamic> arguments;
    var currentQuestion =
        controller.questions[controller.currentQuestionIndex.value];
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
                //Text(controller.testcontroller.data.length
                //    .toString()),
                Text(controller.testcontroller.testSeries.length.toString() ??
                    "ff"),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Card(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: SizedBox(
                          height: Get.height,
                          child: Column(
                            children: [
                              20.heightBox,
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Obx(() {
                                    var currentQuestion = controller.questions[
                                        controller.currentQuestionIndex.value];
                                    return Padding(
                                        padding: const EdgeInsets.all(16.0),
                                        child: Text(
                                          'Question : ${controller.currentQuestionIndex.value + 1}',
                                          style: const TextStyle(
                                              fontSize: 18,
                                              fontWeight: FontWeight.bold),
                                        ));
                                  }),
                                  //Obx(() {
                                  //  'Question ${controller.currentQuestionIndex.value + 1}'
                                  //      .text
                                  //      .size(18)
                                  //      .fontWeight(FontWeight.bold)
                                  //      .make()
                                  //      .paddingOnly(left: 20);
                                  //}),
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
                                          Container(
                                            height: 25,
                                            width: 45,
                                            alignment: Alignment.center,
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(15),
                                                color: Colors.green),
                                            child: const Text("+4"),
                                          )
                                        ],
                                      ).paddingOnly(right: 20)
                                    ],
                                  )
                                ],
                              ),

                              Obx(() {
                                var currentQuestion = controller.questions[
                                    controller.currentQuestionIndex.value];
                                return Padding(
                                  padding: const EdgeInsets.all(16.0),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        ' ${currentQuestion.questionText}',
                                        style: const TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      const SizedBox(height: 20),
                                      ...List.generate(
                                          currentQuestion.options.length,
                                          (index) {
                                        return RadioListTile(
                                          title: Text(
                                              currentQuestion.options[index]),
                                          value: index,
                                          groupValue: controller
                                              .selectedOptionIndex.value,
                                          onChanged: (int? value) {
                                            controller.selectOption(value!);
                                          },
                                        );
                                      }),
                                    ],
                                  ),
                                );
                              }),
                              //SizedBox(height: 20),
                              //ElevatedButton(
                              //  onPressed: () {
                              //    controller.submitAnswer();
                              //  },
                              //  child: Text('Submit'),
                              //),

                              40.heightBox,
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  InkWell(
                                      onTap: () {
                                        controller.currentQuestionIndex.value >
                                                0
                                            ? controller.previousQuestion()
                                            : null;
                                      },
                                      child: buildButton("Previous")),
                                  InkWell(
                                      onTap: () {
                                        controller.markForReview();
                                      },
                                      child: buildButton("Mark for Review")),
                                  InkWell(
                                      onTap: () {
                                        controller.submitAnswer();
                                      },
                                      child: buildButton("save and Next"))
                                ],
                              ).w(400)
                            ],
                          ).w(700),
                        ),
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
                                  //Text(controller.arguments[0]),
                                  "Time Remeaning"
                                      .text
                                      .size(18)
                                      .fontWeight(FontWeight.bold)
                                      .make(),
                                  8.heightBox,
                                  "02:2:22 time".text.make(),
                                  16.heightBox,
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      buildAnswerContainer(
                                          "50 answered", Colors.green),
                                      buildAnswerContainer(
                                          "unanswered", Colors.red),
                                      buildAnswerContainer(
                                          "4 marked", Colors.purple)
                                    ],
                                  ),
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
                                          itemCount: itemCount,
                                          itemBuilder: (context, index) {
                                            return Card(
                                              child: Center(
                                                child: Text(
                                                  '${index + 1}', // Display the number from 1 to itemCount
                                                  style: const TextStyle(
                                                      fontSize: 24),
                                                ),
                                              ),
                                            );
                                          },
                                        )),
                                  ),

                                  //Expanded(
                                  //  child: Container(
                                  //      //height: Get.height,
                                  //      width:
                                  //          350, // Set the width of the container to 350
                                  //      child: Obx(() {
                                  //        int itemCount =
                                  //            controller.arguments[0];
                                  //        return GridView.builder(
                                  //          gridDelegate:
                                  //              const SliverGridDelegateWithFixedCrossAxisCount(
                                  //            crossAxisCount:
                                  //                5, // Number of items per row
                                  //            crossAxisSpacing:
                                  //                8.0, // Spacing between items horizontally
                                  //            mainAxisSpacing:
                                  //                8.0, // Spacing between items vertically
                                  //          ),
                                  //          itemCount: itemCount.toInt(),
                                  //          itemBuilder: (context, index) {
                                  //            return Card(
                                  //              child: Center(
                                  //                child: Text(
                                  //                  '${index + 1}', // Display the number from 1 to 30
                                  //                  style: const TextStyle(
                                  //                      fontSize: 24),
                                  //                ),
                                  //              ),
                                  //            );
                                  //          },
                                  //        );
                                  //      })),
                                  //),

                                  buildEndButton()
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

  buildEndButton() {
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
}
