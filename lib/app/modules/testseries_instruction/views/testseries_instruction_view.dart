import 'package:exam_prep_tool/app/data/modal/test_series/weekley_testSeries_modal.dart';
import 'package:exam_prep_tool/app/routes/app_pages.dart';
import 'package:exam_prep_tool/app/themes/app_style.dart';
import 'package:exam_prep_tool/app/widgets/custom_colors.dart';
import 'package:exam_prep_tool/gen/assets.gen.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:velocity_x/velocity_x.dart';
// 9675587729
import '../controllers/testseries_instruction_controller.dart';

class TestseriesInstructionView
    extends GetView<TestseriesInstructionController> {
  const TestseriesInstructionView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final Testseries testSeries = Get.arguments as Testseries;

    return Scaffold(
      appBar: buildAppbar(),
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 60, vertical: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                //Text('Duration: ${testSeries.timeData?.duration ?? '0'} mins'),
                //Text('Total Marks: ${testSeries.totalMarks ?? '0'}'),
                //Text('Questions: ${testSeries.questions?.length ?? '0'}'),
                //Text(
                //    'Test Series Name: ${testSeries.questions!.first.question ?? '0'}'),
                //ListView.builder(
                //  shrinkWrap:
                //      true, // Use this to avoid taking full screen height
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
                //            ?.map(
                //                (option) => Text('Option: ${option.toJson()}'))
                //            .toList(),
                //        SizedBox(height: 10),
                //      ],
                //    );
                //  },
                //),

                Text(
                  'Test Series (GATE CSE Algorithms)',
                  style: AppStyle.txtPoppinsSemiBold16Black,
                ).centered(),
                5.heightBox,
                "General Instructions :"
                    .text
                    .textStyle(AppStyle.txtPoppinsSemiBold14Black)
                    .make(),
                5.heightBox,
                "1. The clock will be set at the server. The countdown timer at the top right corner of the screen will display the remaining time available for you to complete the examination. When the timer reaches zero, the examination will end by itself. You need not terminate the examination or submit your paper."
                    .text
                    .textStyle(AppStyle.txtPoppinsMedium12darkGray)
                    .make()
                    .paddingSymmetric(horizontal: 3),
                5.heightBox,
                "2. The Question Palette displayed on the right side of the screen will show the status of each question using one of the following symbols:"
                    .text
                    .textStyle(AppStyle.txtPoppinsMedium12darkGray)
                    .make()
                    .paddingSymmetric(horizontal: 3),
                5.heightBox,
                Row(
                  children: [
                    10.widthBox,
                    Image.asset(
                      Assets.images.rectangle.path,
                      width: 15,
                    ),
                    5.widthBox,
                    "You have not visited the question yet."
                        .text
                        .textStyle(AppStyle.txtPoppinsMedium12darkGray)
                        .make()
                        .paddingSymmetric(horizontal: 3),
                  ],
                ),
                5.heightBox,
                buildInstructions(Assets.images.notAnswer.path,
                    "You have not answered the question."),
                5.heightBox,
                buildInstructions(Assets.images.answer.path,
                    "You have answered the question."),
                5.heightBox,
                buildInstructions(Assets.images.markReview.path,
                    "You have NOT answered the question, but have marked the question for review."),
                5.heightBox,
                buildInstructions(Assets.images.group309.path,
                    "You have answered the question, but marked it for review."),
                5.heightBox,
                buildRechestText("The", "Mark For Review",
                    "status for a question simply indicates that you would like to look at that question again. If a question is answered, but marked for review, then the answer will be considered for evaluation unless the status is modified by the candidate."),
                5.heightBox,
                "Navigating to a Question:"
                    .text
                    .textStyle(AppStyle.txtPoppinsSemiBold14Black)
                    .make(),
                5.heightBox,
                "3. To answer a question, do the following:"
                    .text
                    .textStyle(AppStyle.txtPoppinsMedium12darkGray)
                    .make()
                    .paddingSymmetric(horizontal: 3),
                5.heightBox,
                "a) Click on the question number in the Question Palette at the right of your screen to go to that numbered question directly. Note that using this option does NOT save your answer to the current question."
                    .text
                    .textStyle(AppStyle.txtPoppinsMedium12darkGray)
                    .make()
                    .paddingSymmetric(horizontal: 10),
                5.heightBox,
                buildRechestText("b) Click on ", "Save & Next",
                    "to save your answer for the current question and then go to the next question."),
                buildRechestText("c) Click on", "Mark for Review & Next",
                    "to save your answer for the current question and also mark it for review and then go to the next question."),
                5.heightBox,
                "Note that your answer for the current question will not be saved if you navigate to another question directly by clicking on a question number without saving the answer to the previous question."
                    .text
                    .textStyle(AppStyle.txtPoppinsMedium12darkGray)
                    .make()
                    .paddingSymmetric(horizontal: 3),
                5.heightBox,
                buildRedText(
                    "You can view all the questions by clicking on",
                    "Question Paper button",
                    " This feature is provided, so that if you want you can just see the entire question paper at a glance."),
                5.heightBox,
                "Answering a Question:"
                    .text
                    .textStyle(AppStyle.txtPoppinsSemiBold14Black)
                    .make(),
                5.heightBox,
                "4. Procedure for answering a multiple choice (MCQ) type question:"
                    .text
                    .textStyle(AppStyle.txtPoppinsMedium12darkGray)
                    .make()
                    .paddingSymmetric(horizontal: 3),
                5.heightBox,
                "a) Choose one answer from the 4 options (A,B,C,D) given below the question, click on the bubble placed before the chosen option."
                    .text
                    .textStyle(AppStyle.txtPoppinsMedium12darkGray)
                    .make()
                    .paddingSymmetric(horizontal: 10),
                5.heightBox,
                buildRechestText(
                    "b) To deselect your chosen answer, click on the bubble of the chosen option again or click on the",
                    "Clear Response",
                    "button"),
                5.heightBox,
                "c) To change your chosen answer, click on the bubble of another option."
                    .text
                    .textStyle(AppStyle.txtPoppinsMedium12darkGray)
                    .make()
                    .paddingSymmetric(horizontal: 10),
                5.heightBox,
                buildRechestText(
                    "d) To save your answer, you MUST click on the",
                    "Save & Next",
                    ""),
                5.heightBox,
                "5. Procedure for answering a numerical answer type question:"
                    .text
                    .textStyle(AppStyle.txtPoppinsSemiBold14Black)
                    .make(),
                5.heightBox,
                "a) To enter a number as your answer, use the virtual numerical keypad."
                    .text
                    .textStyle(AppStyle.txtPoppinsMedium12darkGray)
                    .make()
                    .paddingSymmetric(horizontal: 10),
                5.heightBox,
                buildRedText(
                    "b) A fraction (e.g. -0.3 or -3) can be entered as an answer with or without '0' before the decimal point.",
                    "",
                    "As many as four decimal points, e.g. 12.5435 or 0.003 or -932.6711 or 12.82 can be entered."),
                5.heightBox,
                buildRechestText("c) To clear your answer, click on the",
                    "Clear Response", "button"),
                5.heightBox,
                buildRechestText(
                    "d) To save your answer, you MUST click on the",
                    "Save & Next",
                    ""),
                5.heightBox,
                buildFourRechestText(
                    "6. To mark a question for review",
                    "click on the",
                    "button. If an answer is selected (for MCQ/MCAQ) entered (for numerical answer type) for a question that is",
                    "Mark for Review & Next",
                    "that answer will be considered in the evaluation unless the status is modified by the candidate."),
                5.heightBox,
                "7. To change your answer to a question that has already been answered, first select that question for answering and then follow the procedure for answering that type of question."
                    .text
                    .textStyle(AppStyle.txtPoppinsSemiBold14Black)
                    .make()
                    .paddingSymmetric(horizontal: 3),
                5.heightBox,
                buildFourRechestText(
                    "8. Note that ONLY Questions for which answers are",
                    "saved ",
                    "or",
                    "marked for review after answering",
                    "will be considered for evaluation."),
                5.heightBox,
                "9. Sections in this question paper are displayed on the top bar of the screen. Questions in a Section can be viewed by clicking on the name of that Section. The Section you are currently viewing will be highlighted."
                    .text
                    .textStyle(AppStyle.txtPoppinsSemiBold14Black)
                    .make()
                    .paddingSymmetric(horizontal: 3),
                5.heightBox,
                Row(
                  children: [
                    Text('10.'),
                    buildRechestText("After clicking the", "Save & Next",
                        "button for the last question in a Section, you will automatically be taken to the first question of the next Section in sequence."),
                  ],
                ),
                5.heightBox,
                "11. You can move the mouse cursor over the name of a Section to view the answering status for that Section."
                    .text
                    .textStyle(AppStyle.txtPoppinsSemiBold14Black)
                    .make()
                    .paddingSymmetric(horizontal: 3),
                20.heightBox,
                20.heightBox,
                InkWell(
                  onTap: () {
                    Get.toNamed(
                      Routes.TESTACTIVE_SCREEN,
                      arguments: testSeries,
                      //'duration':
                      //    testSeries.timeData?.duration.toString() ?? '0',
                      //'totalMarks': testSeries.totalMarks.toString() ?? '0',
                      //'questionsCount':
                      //    testSeries.questions?.length.toString() ?? '0',
                      //'testName': testSeries.questions?.first.question ?? '0',
                    );
                  },
                  child: Align(
                    alignment: Alignment.centerRight,
                    child: Container(
                      //padding: EdgeInsets.symmetric(horizontal: 8),
                      alignment: Alignment.center,
                      height: 45,
                      width: 250,
                      decoration: const BoxDecoration(
                          //boxShadow: [
                          //  BoxShadow(
                          //    color: Colors.black,
                          //    blurRadius: 5.0,
                          //    spreadRadius: 0.0,
                          //    offset: Offset(0, 2),
                          //  ),
                          //],
                          borderRadius: BorderRadius.all(
                            Radius.circular(15),
                          ),
                          //gradient: buttonColor,
                          color: Colors.green),
                      child: const Text(
                        'Next   ->',
                        style: TextStyle(
                          fontSize: 20,
                          color: Colors.white,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                ),
                20.heightBox
              ],
            ),
          ),
        ),
      ),
    );
  }

  buildInstructions(String image, text) {
    return Row(
      children: [
        10.widthBox,
        Image.asset(
          image,
          width: 20,
          //÷color: Colors.pink,
        ),
        5.widthBox,
        Text(
          text,
          style: AppStyle.txtPoppinsMedium12darkGray,
        ).paddingSymmetric(horizontal: 3),
      ],
    );
  }

  buildRechestText(first, second, third) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: RichText(
        text: TextSpan(
          children: [
            TextSpan(
              text: first,
              style: const TextStyle(fontSize: 14, color: Colors.black),
            ),
            const WidgetSpan(
              child: SizedBox(width: 8), // Adjust width as needed
            ),
            TextSpan(
              text: second,
              style: const TextStyle(
                  fontSize: 14,
                  color: Colors.black,
                  fontWeight: FontWeight.w600),
            ),
            const WidgetSpan(
              child: SizedBox(width: 8), // Adjust width as needed
            ),
            TextSpan(
              text: third,
              style: const TextStyle(fontSize: 14, color: Colors.black),
            ),
          ],
        ),
      ),
    );
  }

  buildFourRechestText(first, second, third, four, five) {
    return RichText(
      text: TextSpan(
        children: [
          TextSpan(
            text: first,
            style: const TextStyle(fontSize: 14, color: Colors.black),
          ),
          const WidgetSpan(
            child: SizedBox(width: 8), // Adjust width as needed
          ),
          TextSpan(
            text: second,
            style: const TextStyle(
                fontSize: 14, color: Colors.black, fontWeight: FontWeight.w600),
          ),
          const WidgetSpan(
            child: SizedBox(width: 8), // Adjust width as needed
          ),
          TextSpan(
            text: third,
            style: const TextStyle(fontSize: 14, color: Colors.black),
          ),
          const WidgetSpan(
            child: SizedBox(width: 8), // Adjust width as needed
          ),
          TextSpan(
            text: four,
            style: const TextStyle(
                fontSize: 14, color: Colors.black, fontWeight: FontWeight.w600),
          ),
          const WidgetSpan(
            child: SizedBox(width: 8), // Adjust width as needed
          ),
          TextSpan(
            text: five,
            style: const TextStyle(fontSize: 14, color: Colors.black),
          ),
        ],
      ),
    );
  }

  buildRedText(first, second, third) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: RichText(
        text: TextSpan(
          children: [
            TextSpan(
              text: first,
              style: const TextStyle(fontSize: 14, color: Colors.black),
            ),
            const WidgetSpan(
              child: SizedBox(width: 8), // Adjust width as needed
            ),
            TextSpan(
              text: second,
              style: const TextStyle(
                  fontSize: 14,
                  color: Colors.black,
                  fontWeight: FontWeight.w600),
            ),
            const WidgetSpan(
              child: SizedBox(width: 8), // Adjust width as needed
            ),
            TextSpan(
              text: third,
              style: const TextStyle(fontSize: 14, color: Colors.red),
            ),
          ],
        ),
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
}
