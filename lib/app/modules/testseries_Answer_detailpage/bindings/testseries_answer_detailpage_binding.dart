import 'package:get/get.dart';

import '../controllers/testseries_answer_detailpage_controller.dart';

class TestseriesAnswerDetailpageBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<TestseriesAnswerDetailpageController>(
      () => TestseriesAnswerDetailpageController(),
    );
  }
}
