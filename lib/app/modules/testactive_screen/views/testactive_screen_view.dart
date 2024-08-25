import 'package:exam_prep_tool/app/data/modal/test_series/weekley_testSeries_modal.dart';
import 'package:exam_prep_tool/app/routes/app_pages.dart';
import 'package:exam_prep_tool/app/themes/app_style.dart';
import 'package:exam_prep_tool/app/widgets/custom_colors.dart';
import 'package:exam_prep_tool/gen/assets.gen.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:velocity_x/velocity_x.dart';

import '../controllers/testactive_screen_controller.dart';

class TestactiveScreenView extends GetView<TestactiveScreenController> {
  const TestactiveScreenView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    //final Map<String, dynamic> args = Get.arguments;
    final Testseries testSeries = Get.arguments as Testseries;
    //final String duration = args['duration'] as String;
    //final String totalMarks = args['totalMarks'] as String;
    //final String questionsCount = args['questionsCount'] as String;
    //final String testName = args['testName'] as String;
    return Scaffold(
      appBar: buildAppbar(),
      body: Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              //Text(controller
              //        .testcontroller.selectedTestSeries.value?.testName ??
              //    'Detail Page'),
              //Text('Duration: ${testSeries.timeData?.duration ?? '0'} mins'),
              //Text('Total Marks: ${testSeries.totalMarks ?? '0'}'),
              //Text('Questions: ${testSeries.questions?.length ?? '0'}'),
              //Text(
              //    'Test Series Name: ${testSeries.questions?.first.question ?? '0'}'),
              //ListView.builder(
              //  shrinkWrap: true, // Use this to avoid taking full screen height
              //  physics:
              //      NeverScrollableScrollPhysics(), // Disable scrolling in ListView.builder
              //  itemCount: testSeries.questions?.length ?? 0,
              //  itemBuilder: (context, index) {
              //    final question = testSeries.questions?[index];
              //    return Column(
              //      crossAxisAlignment: CrossAxisAlignment.start,
              //      children: [
              //        Text(
              //          'Question ${index + 1}: ${question?.question ?? 'No question'}',
              //          style: TextStyle(fontWeight: FontWeight.bold),
              //        ),
              //        SizedBox(height: 5),
              //        // If you want to display options as well, you can add them here
              //        ...?question?.options
              //            ?.map((option) => Text('Option: ${option.toJson()}'))
              //            .toList(),
              //        SizedBox(height: 10),
              //      ],
              //    );
              //  },
              //),

              20.widthBox,
              RichText(
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: 'Test(',
                      style: TextStyle(fontSize: 20, color: Colors.black),
                    ),
                    TextSpan(
                      text: 'Active',
                      style: TextStyle(fontSize: 20, color: Colors.green),
                    ),
                    TextSpan(
                      text: ')',
                      style: TextStyle(fontSize: 20, color: Colors.black),
                    ),
                  ],
                ),
              ),
              20.heightBox,

              //Text(controller.testcontroller.data!.first.questions!.length
              //    .toString()),
              buildRow(
                  Assets.images.totalQuestion.path,
                  'total ${testSeries.questions?.length ?? '0'} questions'
                      .toUpperCase()),
              buildRow(
                  Assets.images.timer.path,
                  'total time ${testSeries.timeData?.duration ?? '0'}  Minutes'
                      .toUpperCase()),
              buildRow(Assets.images.totalMarks.path,
                  'total marks ${testSeries.totalMarks ?? '0'}'.toUpperCase()),
              //buildRow(Assets.images.totalMarks.path,
              //    'total marks ${testName}'.toUpperCase()),
              buildRow(Assets.images.language.path,
                  'language- English'.toUpperCase()),
              "Declaration : ".text.size(18).make().paddingOnly(left: 20),
              Container(
                width: 1900,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Obx(() => Checkbox(
                          value: controller.isChecked.value,
                          onChanged: controller.toggleCheckbox,
                        )),
                    10.widthBox,
                    Text(
                      "I have read all the instructions carefully and have understood them. I agree not to cheat or use unfair means in this examination. I understand that using unfair means of any sort for my own or someone else's advantage will lead to my immediate disqualification. The decision of Exampreptool will be final in these matters and cannot be appealed.",
                      maxLines: 6,
                      style: TextStyle(fontSize: 16),
                      overflow: TextOverflow
                          .ellipsis, // Adds ellipsis if text overflows
                    ).w(900)
                  ],
                ),
              ),
              20.heightBox,
              Obx(() => InkWell(
                    onTap: () {
                      if (controller.isChecked.value == true) {
                        Get.toNamed(Routes.TESTSERIES_MCQ, arguments: testSeries
                            //'duration': duration,
                            //'totalMarks': totalMarks,
                            //'questionsCount': questionsCount,
                            //'testName': testName,
                            );
                      }
                    },
                    child: Align(
                      alignment: Alignment.centerRight,
                      child: Container(
                        alignment: Alignment.center,
                        height: 45,
                        width: 250,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(
                              Radius.circular(15),
                            ),
                            color: controller.isChecked.value
                                ? Colors.green
                                : Vx.green100),
                        child: Text(
                          'Ready to Begin',
                          style: TextStyle(
                            fontSize: 20,
                            color: controller.isChecked.value
                                ? Colors.white
                                : Colors.grey,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                  )),
              20.heightBox
            ]),
      ),
    );
  }

  buildRow(String image, text) {
    return Row(
      children: [
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            boxShadow: const [
              BoxShadow(
                color: Colors.white, // Set the shadow color here
                blurRadius: 5.0, // Adjust the blur radius
                spreadRadius: 0.0, // Adjust the spread radius
                offset: Offset(0, 2), // Adjust the offset
              ),
            ],
          ),
          height: 40,
          width: 40,
          child: Image.asset(
            image,
            //Assets.images.headerLogo.path,
            //height: 40,
            //// color: Colors.white,
            //width: 110,
            fit: BoxFit.cover,
          ),
        ),
        8.widthBox,
        Text(
          text,
        )
      ],
    ).paddingSymmetric(horizontal: 15, vertical: 8);
  }
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
