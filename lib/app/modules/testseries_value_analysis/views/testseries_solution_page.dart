import 'package:exam_prep_tool/app/data/modal/test_series/view_answerdetail_page_modal.dart';
import 'package:exam_prep_tool/app/data/modal/test_series/weekley_testSeries_modal.dart';
import 'package:exam_prep_tool/app/modules/testseries_value_analysis/controllers/testseries_view_analysis_controller.dart';
import 'package:exam_prep_tool/app/utils/const.dart';
import 'package:flutter/material.dart';
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
      return Center(child: CircularProgressIndicator());
    }

    return ListView.builder(
      itemCount: controller.viewAnslist.length,
      itemBuilder: (context, index) {
        var answerItem = controller.viewAnslist[index];

        // Ensure testId and questions are not null
        if (answerItem.testId != null && answerItem.testId!.questions != null) {
          return Column(
            children: answerItem.testId!.questions!.map<Widget>((question) {
              var answer = answerItem.answers?.firstWhere(
                (a) => a.question == question.id,
                orElse: () => Answer(answer: 'N/A'), // Default value if no answer is found
              );

              return Stack(
                children: [
                  ExpansionTile(
                    title: Text('Question: ${question.question}'),
                    children: [
                      ListTile(
                        subtitle: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            if (question.questionImage != null && question.questionImage!.isNotEmpty)
                              Image.network(
                                "${imageUrl + question.questionImage.toString()}",
                                errorBuilder: (context, error, stackTrace) {
                                  return Text('Image not available'); // Placeholder text
                                },
                              )
                            else
                              Text(''), // Placeholder text when no image is available

                            SizedBox(height: 8.0),
                            Text('Options:'),
                            ...question.options?.map((option) {
                              return Text('. ${option.option}');
                            }).toList() ?? [],
                            Text('Answer: ${question.explanation?.text ?? 'N/A'}'),
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
          return ListTile(
            title: Text('No questions available'),
          );
        }
      },
    );
  }),
);
  }}