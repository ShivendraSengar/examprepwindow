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

          return ListView.builder(
            itemCount: controller.viewAnslist.length,
            itemBuilder: (context, index) {
              var answerItem = controller.viewAnslist[index];

              if (answerItem.testId != null &&
                  answerItem.testId!.questions != null) {
                return Column(
                  children: List.generate(answerItem.testId!.questions!.length,
                      (questionIndex) {
                    var question = answerItem.testId!.questions![questionIndex];
                    var userAnswer = answerItem.answers?.firstWhere(
                      (a) => a.question == question.id,
                      orElse: () => Answer(answer: 'N/A', isRight: false),
                    );

                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          crossAxisAlignment: CrossAxisAlignment.end,
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
                                .make()
                                .color(Color.fromARGB(255, 233, 233, 10))
                                .p(5),
                            5.widthBox,
                            " + ${question.marks.toString()}"
                                .toUpperCase()
                                .text
                                .semiBold
                                .color(Vx.white)
                                .make()
                                .p(5)
                                .box
                                .roundedSM
                                .make()
                                .color(Vx.green700)
                                .p(5),
                            5.widthBox,
                            " - ${question.negativeMarks.toString()}"
                                .toUpperCase()
                                .text
                                .semiBold
                                .color(Vx.white)
                                .make()
                                .p(5)
                                .box
                                .roundedSM
                                .make()
                                .color(Vx.red700)
                                .p(5),
                            5.widthBox,
                          ],
                        ),
                        isSmallScreen
                            ? Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Html(data: "${question.question.toString()}"),
                                  Text("Question : ${questionIndex + 1}",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 18)),
                                  Html(
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
                                  ).w(350),
                                ],
                              )
                            : Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Text("Question : ${questionIndex + 1}",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 18)),
                                  SizedBox(width: 2),
                                  Html(
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
                                ],
                              ),
                        ListTile(
                          subtitle: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              if (question.questionImage != null &&
                                  question.questionImage!.isNotEmpty)
                                Image.network(
                                  imageUrl + question.questionImage.toString(),
                                  errorBuilder: (context, error, stackTrace) {
                                    return const Text('');
                                  },
                                )
                              else
                                const Text(''),
                             ...[
  // Check if any answer is selected
  if (userAnswer == null) ...[
    // Display a message if no answer is selected
    Padding(
      padding: const EdgeInsets.all(8.0),
      child: Text(
        "You have not selected any answer.",
        style: TextStyle(color: Colors.red, fontSize: 15, fontWeight: FontWeight.bold),
      ),
    ),
  ],
  Text(
    "Options :",
    style: TextStyle(
      color: Colors.black,
      fontSize: 15,
      fontWeight: FontWeight.bold,
    ),
  ),
// ...List.generate(question.options!.length, (optionIndex) {
//   var option = question.options![optionIndex].option.toString();

//   // Check if the current option is the correct answer
//   bool isCorrectOption = answerItem.answers![index].isRight == true &&
//                          answerItem.answers![index].answer == option;

//   // Check if the user has selected this option
//   bool isOptionSelected = answerItem.answers![index].answer == option;

//   // Logic for determining background color:
//   Color backgroundColor;
//   if (isOptionSelected) {
//     if (isCorrectOption) {
//       backgroundColor = Colors.green;  // Correct answer selected
//     } else {
//       backgroundColor = Colors.red;    // Wrong answer selected
//     }
//   } else if (isCorrectOption) {
//     backgroundColor = Colors.green;    // Show the correct option (if not selected)
//   } else {
//     backgroundColor = Colors.red;  // Default color for unselected wrong options
//   }

//   return Container(
//     padding: EdgeInsets.all(10),
//     decoration: BoxDecoration(
//       color: backgroundColor, // Apply the determined background color
//       borderRadius: BorderRadius.circular(8),
//       border: Border.all(color: Colors.black12),
//     ),
//     child: Text(
//       option,
//       style: TextStyle(
//         color: Colors.black,
//         fontSize: 16,
//       ),
//     ),
//   );
// }),

ListView.builder(
  shrinkWrap: true,
  physics: NeverScrollableScrollPhysics(),
  itemCount: question.options!.length,
  itemBuilder: (context, optionIndex) {
    var option = question.options![optionIndex].option;
    bool isRight = userAnswer != null && userAnswer.isRight!;
    bool isSelected = userAnswer != null && userAnswer.answer == option;
    bool isMatchedWithExplanation = question.explanation!.text!.contains(option!);

    return ListTile(
      title: Container(
        color: isSelected
            ? (isRight ? Colors.green : Colors.red) // सही हो तो ग्रीन बैकग्राउंड, गलत हो तो रेड बैकग्राउंड
            : (isMatchedWithExplanation ? Colors.green : Colors.transparent), // एक्सप्लेनेशन से मैच हो रहा हो तो ग्रीन बैकग्राउंड
        padding: EdgeInsets.all(8.0), // padding to make it look better
        child: Text(
          option!,
          style: TextStyle(
            color: Colors.black, // टेक्स्ट का रंग हमेशा काला रहेगा
          ),
        ),
      ),
    );
  },
),

 Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    mainAxisAlignment: MainAxisAlignment.start,
    children: [
      Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: EdgeInsets.all(8),
            color: Color.fromARGB(255, 3, 151, 55),
            child: Text("Ans: ",
                style: TextStyle(color: Colors.white)),
          ),
          Html(
            data: """
                <pre><code>${correctHtmlContent(question.explanation?.text ?? 'N/A')}</code></pre>
            """,
            style: {
              "body": Style(
                fontWeight: FontWeight.bold,
                fontSize: FontSize(16.0),
              ),
              "pre": Style(fontFamily: 'monospace'),
              "code": Style(
                backgroundColor: Colors.grey.shade100,
              ),
            },
          ).w(650),
        ],
      ),
      if (question.explanation?.image != null &&
          question.explanation!.image!.isNotEmpty)
        Image.network(
          imageUrl + question.explanation!.image.toString(),
          errorBuilder: (context, error, stackTrace) {
            return const Text('');
          },
        )
      else
        const Text(''),
    ],
  ),
],

                        Positioned.fill(
                          child: Align(
                            alignment: Alignment.center,
                            child: Transform.rotate(
                              angle: -0.5,
                              child: Opacity(
                                opacity: 0.3,
                                child: Text(
                                  'ExamPrepTool',
                                  style: TextStyle(
                                    color: Colors.red,
                                    fontSize: 40,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                        ))]);
                  }).toList(),
                );
              } else {
                return const ListTile(
                  title: Text('No questions available'),
                );
              }
            },
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
