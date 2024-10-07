
import 'package:exam_prep_tool/app/modules/testsearis/controllers/testsearis_controller.dart';
import 'package:exam_prep_tool/app/modules/testseries_mcq/controllers/testseries_mcq_controller.dart';
import 'package:exam_prep_tool/app/modules/testseries_value_analysis/controllers/testseries_view_analysis_controller.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/bindings_interface.dart';

class TestseriesViewAnlysisBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<TestseriesViewAnlysisController>(
      () => TestseriesViewAnlysisController(),
    );
     Get.lazyPut<TestseriesMcqController>(
      () => TestseriesMcqController(),
    );
     Get.lazyPut<TestsearisController>(
      () => TestsearisController(),
    );
  }
}

// ///////////////////agr is right true h tn k liy
// Padding(
//   padding: const EdgeInsets.all(5.0),
//   child: Container(
//     child: Column(
//       crossAxisAlignment: CrossAxisAlignment.start, // Align text to the start
//       children: [
//         if (!userAnswer!.isRight) ...[
//           if (question.type == "msq") ...[
//             const Text(
//               "You have not attempted all correct Answers:",
//               style: TextStyle(
//                 color: Colors.black,
//                 fontWeight: FontWeight.bold,
//               ),
//             ),
//             Container(
//               padding: const EdgeInsets.all(8.0), // Add some padding for better presentation
//               decoration: const BoxDecoration(
//                 borderRadius: BorderRadius.all(Radius.circular(5)),
//                 color: Colors.red,
//               ),
//               child: Text(
//                 " ${userAnswer!.answer.toString()}",
//                 style: const TextStyle(color: Colors.white),
//               ),
//             ),
//           ] else if (question.type == "mcq") ...[
//             const Text(
//               "You have not selected the correct Answer:",
//               style: TextStyle(
//                 color: Colors.black,
//                 fontWeight: FontWeight.bold,
//               ),
//             ),
//             Container(
//               padding: const EdgeInsets.all(8.0), // Add some padding for better presentation
//               decoration: const BoxDecoration(
//                 borderRadius: BorderRadius.all(Radius.circular(5)),
//                 color: Colors.red,
//               ),
//               child: Text(
//                 " ${userAnswer!.answer.toString()}",
//                 style: const TextStyle(color: Colors.white),
//               ),
//             )
//           ] else if (question.type == "integer") ...[
//             Row(
//               children: [
//                 const Text(
//                   "Attempted Answer:",
//                   style: TextStyle(
//                     color: Colors.black,
//                     fontWeight: FontWeight.bold,
//                   ),
//                 ),
//                 Container(
//                   padding: const EdgeInsets.all(8.0), // Add some padding for better presentation
//                   decoration: const BoxDecoration(
//                     borderRadius: BorderRadius.all(Radius.circular(5)),
//                     color: Colors.red,
//                   ),
//                   child: Text(
//                     "${userAnswer!.answer.toString()}",
//                     style: const TextStyle(color: Colors.white),
//                   ),
//                 )
//               ],
//             ),
//           ] else ...[
//             const Text(
//               "Attempted Answer:",
//               style: TextStyle(
//                 color: Colors.black,
//                 fontWeight: FontWeight.bold,
//               ),
//             ),
//             Text(
//               "${userAnswer!.answer.toString()}",
//               style: const TextStyle(color: Colors.black),
//             ),
//           ],
//         ],
//       ],
//     ),
//   ),
// );

