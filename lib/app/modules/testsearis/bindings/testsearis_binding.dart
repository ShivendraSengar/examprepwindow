import 'package:get/get.dart';

import '../controllers/testsearis_controller.dart';

class TestsearisBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<TestsearisController>(
      () => TestsearisController(),
    );
  }
}
