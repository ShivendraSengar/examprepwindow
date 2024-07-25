import 'package:exam_prep_tool/app/modules/testsearis/controllers/testsearis_controller.dart';
import 'package:get/get.dart';

import '../controllers/testseries_mcq_controller.dart';

class TestseriesMcqBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<TestseriesMcqController>(
      () => TestseriesMcqController(),
    );
    Get.lazyPut<TestsearisController>(
      () => TestsearisController(),
    );
  }
}
