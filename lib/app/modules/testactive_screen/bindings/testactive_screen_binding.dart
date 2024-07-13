import 'package:exam_prep_tool/app/modules/testsearis/controllers/testsearis_controller.dart';
import 'package:get/get.dart';

import '../controllers/testactive_screen_controller.dart';

class TestactiveScreenBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<TestactiveScreenController>(
      () => TestactiveScreenController(),
    );
    Get.lazyPut<TestsearisController>(
      () => TestsearisController(),
    );
  }
}
