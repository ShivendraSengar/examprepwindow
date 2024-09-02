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

        // Ensure testId and questions are not null
        if (answerItem.testId != null && answerItem.testId!.questions != null) {
          return Column(
            children: List.generate(answerItem.testId!.questions!.length, (questionIndex) {
              var question = answerItem.testId!.questions![questionIndex];
              var answer = answerItem.answers?.firstWhere(
                (a) => a.question == question.id,
                orElse: () => Answer(answer: 'N/A'), // Default value if no answer is found
              );

              return Stack(
                children: [
                  ExpansionTile(
                    expandedAlignment: Alignment.topCenter,
                    title: isSmallScreen
                        ? Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              "Question ${questionIndex + 1}".text.semiBold.size(18).make(),
                              2.heightBox,
                              Html(
                                data: """
                                  <pre><code>
                                  ${correctHtmlContent(question.question.toString())}
                                  </code></pre>
                                """,
                                style: {
                                  "body": Style(
                                    alignment: Alignment.topCenter,
                                    fontWeight: FontWeight.bold,
                                    whiteSpace: WhiteSpace.normal,
                                    fontSize: FontSize(16.0),
                                  ),
                                  "pre": Style(
                                    alignment: Alignment.topCenter,
                                    whiteSpace: WhiteSpace.normal,
                                    fontFamily: 'monospace',
                                    maxLines: 10,
                                  ),
                                  "code": Style(
                                    fontFamily: 'monospace',
                                    whiteSpace: WhiteSpace.normal,
                                    backgroundColor: Colors.grey.shade100,
                                  ),
                                },
                              ).w(350),
                            ],
                          )
                        : Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              "Question ${questionIndex + 1}".text.semiBold.size(18).make(),
                              2.widthBox,
                              Html(
                                data: """
                                  <pre><code>
                                  ${correctHtmlContent(question.question.toString())}
                                  </code></pre>
                                """,
                                style: {
                                  "body": Style(
                                    alignment: Alignment.topCenter,
                                    fontWeight: FontWeight.bold,
                                    whiteSpace: WhiteSpace.normal,
                                    fontSize: FontSize(16.0),
                                  ),
                                  "pre": Style(
                                    alignment: Alignment.topCenter,
                                    whiteSpace: WhiteSpace.normal,
                                    fontFamily: 'monospace',
                                    maxLines: 10,
                                  ),
                                  "code": Style(
                                    fontFamily: 'monospace',
                                    whiteSpace: WhiteSpace.normal,
                                    backgroundColor: Colors.grey.shade100,
                                  ),
                                },
                              ).w(350),
                            ],
                          ),
                    children: [
                      ListTile(
                        subtitle: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            if (question.questionImage != null && question.questionImage!.isNotEmpty)
                              Image.network(
                                imageUrl + question.questionImage.toString(),
                                errorBuilder: (context, error, stackTrace) {
                                  return const Text(''); // Placeholder text Pmahe is not available
                                },
                              )
                            else
                              const Text(''), // Placeholder text when no image is available
                            const SizedBox(height: 8.0),
                            Column(
                              children: [
                                Row(
                                  children: [
                                    "Ans:".text.color(Vx.white).make().p(8).box.roundedSM.color(const Color.fromARGB(255, 3, 151, 55)).make().p(8),
                                    3.widthBox,
                                    Expanded(
                                      child: Text(
                                        ' ${_stripHtmlTags(question.explanation?.text ?? 'N/A'.toString())}',
                                        maxLines: 20,
                                        style: const TextStyle(fontWeight: FontWeight.bold),
                                      ).w(isSmallScreen ? 300 : 600),
                                    ),
                                  ],
                                ),
                                if (question.explanation!.image != null && question.explanation!.image!.isNotEmpty)
                                  Image.network(
                                    imageUrl + question.explanation!.image.toString(),
                                    errorBuilder: (context, error, stackTrace) {
                                      return const Text(''); // Placeholder text
                                    },
                                  )
                                else
                                  const Text(''),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  Positioned.fill(
                    child: Align(
                      alignment: Alignment.center,
                      child: Transform.rotate(
                        angle: -0.5, // Rotate angle in radians; adjust as needed
                        child: const Opacity(
                          opacity: 0.3, // Adjust opacity as needed
                          child: Text(
                            'ExamPrepTool', // Your watermark text
                            style: TextStyle(
                              color: Colors.red,
                              fontSize: 40, // Adjust size as needed
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              );
            }).toList(),
          );
        } else {
          return const ListTile(
            title: Text('No questions available'),
          );
        }
      },
    );
  }),
);
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
}