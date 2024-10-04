import 'package:exam_prep_tool/app/data/modal/test_series/view_answerdetail_page_modal.dart';
import 'package:exam_prep_tool/app/data/modal/test_series/weekley_testSeries_modal.dart';
import 'package:exam_prep_tool/app/modules/testseries_value_analysis/controllers/testseries_view_analysis_controller.dart';
import 'package:exam_prep_tool/app/utils/const.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:velocity_x/velocity_x.dart';

class TestSeriesSolution extends GetView<TestseriesViewAnlysisController> {
  const TestSeriesSolution({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
        color: Vx.white,
        child: Obx(() {
          if (controller.isLoading.value) {
            return const Center(child: CircularProgressIndicator());
          }
          var screenWidth = MediaQuery.of(context).size.width;
          bool isSmallScreen = screenWidth < 600;

          return SingleChildScrollView(
            child: Column(
              children: List.generate(controller.viewAnslist.length, (index) {
                var answerItem = controller.viewAnslist[index];

                if (answerItem.testId != null &&
                    answerItem.testId!.questions != null) {
                  return Column(
                    children: List.generate(
                        answerItem.testId!.questions!.length, (questionIndex) {
                      var question =
                          answerItem.testId!.questions![questionIndex];
                      var userAnswer = answerItem.answers?.firstWhere(
                        (a) => a.question == question.id,
                        orElse: () => Answer(answer: 'N/A', isRight: false),
                      );

                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            //                           // Question header and marks
                            //                           Row(
                            //                             crossAxisAlignment: CrossAxisAlignment.start,
                            //                             mainAxisAlignment: MainAxisAlignment.end,
                            //                             children: [
                            //                               "${question.type}"
                            //                                   .toUpperCase()
                            //                                   .text
                            //                                   .semiBold
                            //                                   .color(Vx.white)
                            //                                   .make()
                            //                                   .p(5)
                            //                                   .box
                            //                                   .roundedSM
                            //                                   .color(Color.fromARGB(255, 233, 233, 10))
                            //                                   .make(),
                            //                               5.widthBox,
                            //                               " + ${question.marks}"
                            //                                   .toUpperCase()
                            //                                   .text
                            //                                   .semiBold
                            //                                   .color(Vx.white)
                            //                                   .make()
                            //                                   .p(5)
                            //                                   .box
                            //                                   .roundedSM
                            //                                   .color(Vx.green700)
                            //                                   .make(),
                            //                               5.widthBox,
                            //                               " - ${question.negativeMarks}"
                            //                                   .toUpperCase()
                            //                                   .text
                            //                                   .semiBold
                            //                                   .color(Vx.white)
                            //                                   .make()
                            //                                   .p(5)
                            //                                   .box
                            //                                   .roundedSM
                            //                                   .color(Vx.red700)
                            //                                   .make(),
                            //                               5.widthBox,
                            //                             ],
                            //                           ),
                            // //                           // Question text and options
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text("Question : ${questionIndex + 1}",
                                        style: const TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 18)),
                                    Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        "${question.type}"
                                            .toUpperCase()
                                            .text
                                            .semiBold
                                            .color(Vx.white)
                                            .make()
                                            .p(5)
                                            .box
                                            .roundedSM
                                            .color(const Color.fromARGB(
                                                255, 233, 233, 10))
                                            .make(),
                                        5.widthBox,
                                        " + ${question.marks}"
                                            .toUpperCase()
                                            .text
                                            .semiBold
                                            .color(Vx.white)
                                            .make()
                                            .p(5)
                                            .box
                                            .roundedSM
                                            .color(Vx.green700)
                                            .make(),
                                        5.widthBox,
                                        " - ${question.negativeMarks}"
                                            .toUpperCase()
                                            .text
                                            .semiBold
                                            .color(Vx.white)
                                            .make()
                                            .p(5)
                                            .box
                                            .roundedSM
                                            .color(Vx.red700)
                                            .make(),
                                        5.widthBox,
                                      ],
                                    ),
                                    //
                                  ],
                                ),
                                isSmallScreen
                                    ? Html(
                                        data: """
                              <pre><code>${correctHtmlContent(question.question.toString())}</code></pre>
                            """,
                                        style: {
                                          "body": Style(
                                              fontWeight: FontWeight.bold,
                                              fontSize: FontSize(16.0)),
                                          "pre": Style(fontFamily: 'monospace'),
                                          "code": Style(
                                              backgroundColor:
                                                  Colors.grey.shade100),
                                        },
                                      ).w(350)
                                    : Html(
                                        data: """
                              <pre><code>${correctHtmlContent(question.question.toString())}</code></pre>
                            """,
                                        style: {
                                          "body": Style(
                                              fontWeight: FontWeight.bold,
                                              fontSize: FontSize(16.0)),
                                          "pre": Style(fontFamily: 'monospace'),
                                          "code": Style(
                                              backgroundColor:
                                                  Colors.grey.shade100),
                                        },
                                      ).w(650),
                                if (question.explanation?.image != null &&
                                    question.explanation!.image!.isNotEmpty)
                                  Image.network(
                                    imageUrl +
                                        question.explanation!.image.toString(),
                                    errorBuilder: (context, error, stackTrace) {
                                      return const Text('');
                                    },
                                  )
                                else
                                  const Text(''),
                              ],
                            ),
                          
                            // Options and user answer
                            ListTile(
                              subtitle: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text(
                                    "Options:",
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: ListView.builder(
                                      shrinkWrap: true,
                                      physics:
                                          const NeverScrollableScrollPhysics(),
                                      itemCount: question.options!.length,
                                      itemBuilder: (context, optionIndex) {
                                        var option = question
                                            .options![optionIndex].option;
                                        bool isSelected = userAnswer != null &&
                                            userAnswer.answer == option;
                                        bool isMatchedWithExplanation = question
                                            .explanation!.text!
                                            .contains(option!);

                                        // Check if the question type is MSQ
                                        if (question.type == "msq") {
                                          // Highlight all correct answers in green
                                          bool isCorrectAnswerInExplanation =
                                              question.explanation!.text!
                                                  .contains(option!);

                                          return ListTile(
                                            title: Container(
                                              color:
                                                  isCorrectAnswerInExplanation
                                                      ? Colors
                                                          .green // Correct answers in explanation are green
                                                      : (isSelected
                                                          ? Colors
                                                              .red // Selected wrong answers are red
                                                          : Colors.transparent),
                                              padding:
                                                  const EdgeInsets.all(8.0),
                                              child: Text(
                                                option!,
                                                style: const TextStyle(
                                                    color: Colors.black),
                                              ),
                                            ),
                                          );
                                        } else {
                                          // For non-MSQ types, show green if it's matched with the explanation, otherwise highlight selected options
                                          return ListTile(
                                            title: Container(
                                              color: isSelected
                                                  ? (userAnswer.isRight!
                                                      ? Colors.green
                                                      : Colors.red)
                                                  : (isMatchedWithExplanation
                                                      ? Colors.green
                                                      : Colors.transparent),
                                              padding:
                                                  const EdgeInsets.all(8.0),
                                              child: Text(
                                                option!,
                                                style: const TextStyle(
                                                    color: Colors.black),
                                              ),
                                            ),
                                          );
                                        }
                                      },
                                    ),
                                  ),
                                  // Show a message if the user did not select the correct answers
                                  if (question.type == "msq" &&
                                      userAnswer != null &&
                                      !userAnswer.isRight!)
                                    const Padding(
                                      padding: EdgeInsets.only(top: 10),
                                      child: Text(
                                        'You did not select the correct answers.',
                                        style: TextStyle(
                                            color: Colors.red,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                ],
                              ),
                            ),
// // Options and user answer
                            //                           // ListTile(
                            //                           //   subtitle: Column(
                            //                           //     crossAxisAlignment: CrossAxisAlignment.start,
                            //                           //     children: [
                            //                           //       Text(
                            //                           //         "Options :",
                            //                           //         style: TextStyle(color: Colors.black, fontSize: 15, fontWeight: FontWeight.bold),
                            //                           //       ),
                            //                           //       Padding(
                            //                           //         padding: const EdgeInsets.all(8.0),
                            //                           //         child: ListView.builder(
                            //                           //           shrinkWrap: true,
                            //                           //           physics: NeverScrollableScrollPhysics(),
                            //                           //           itemCount: question.options!.length,
                            //                           //           itemBuilder: (context, optionIndex) {
                            //                           //             var option = question.options![optionIndex].option;
                            //                           //             bool isRight = userAnswer != null && userAnswer.isRight!;
                            //                           //             bool isSelected = userAnswer != null && userAnswer.answer == option;
                            //                           //             bool isMatchedWithExplanation = question.explanation!.text!.contains(option!);

                            //             return ListTile(
                            //               title: Container(
                            //                 color: isSelected
                            //                     ? (isRight ? Colors.green : Colors.red)
                            //                     : (isMatchedWithExplanation ? Colors.green : Colors.transparent),
                            //                 padding: EdgeInsets.all(8.0),
                            //                 child: Text(
                            //                   option!,
                            //                   style: TextStyle(color: Colors.black),
                            //                 ),
                            //               ),
                            //             );
                            //           },
                            //         ),
                            //       ),
                            //     ],
                            //   ),
                            // ),
                            // // Explanation and images
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    Container(
                                      padding: const EdgeInsets.all(8),
                                      color:
                                          const Color.fromARGB(255, 3, 151, 55),
                                      child: const Text("Ans: ",
                                          style:
                                              TextStyle(color: Colors.white)),
                                    ),
                                    Html(
                                      data: """
                                  <pre><code>${correctHtmlContent(question.explanation?.text ?? 'N/A')}</code></pre>
                                """,
                                      style: {
                                        "body": Style(
                                            fontWeight: FontWeight.bold,
                                            fontSize: FontSize(16.0)),
                                        "pre": Style(fontFamily: 'monospace'),
                                        "code": Style(
                                            backgroundColor:
                                                Colors.grey.shade100),
                                      },
                                    ).w(650),
                                  ],
                                ),
                                if (question.explanation?.image != null &&
                                    question.explanation!.image!.isNotEmpty)
                                  Image.network(
                                    imageUrl +
                                        question.explanation!.image.toString(),
                                    errorBuilder: (context, error, stackTrace) {
                                      return const Text('');
                                    },
                                  )
                                else
                                  const Text(''),
                              ],
                            ).p(5),
                          ],
                        ),
                      );
                    }),
                  );
                } else {
                  return const Text('No questions available');
                }
              }),
            ),
          );
        }));
  }

  String truncateHtml(String html, int startIndex, int endIndex) {
    // Strip HTML tags
    RegExp exp = RegExp(r"<[^>]*>", multiLine: true, caseSensitive: false);
    String plainText = html.replaceAll(exp, '');

    // Truncate plain text
    if (plainText.length > endIndex) {
      return plainText.substring(startIndex, endIndex) + '...';
    } else {
      return plainText;
    }
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
}
