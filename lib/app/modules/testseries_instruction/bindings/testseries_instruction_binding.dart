import 'package:get/get.dart';

import '../controllers/testseries_instruction_controller.dart';

class TestseriesInstructionBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<TestseriesInstructionController>(
      () => TestseriesInstructionController(),
    );
  }
}
