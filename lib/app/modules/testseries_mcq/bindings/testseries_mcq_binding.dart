import 'package:get/get.dart';

import '../controllers/testseries_mcq_controller.dart';

class TestseriesMcqBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<TestseriesMcqController>(
      () => TestseriesMcqController(),
    );
  }
}
