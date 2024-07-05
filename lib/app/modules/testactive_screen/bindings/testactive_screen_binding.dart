import 'package:get/get.dart';

import '../controllers/testactive_screen_controller.dart';

class TestactiveScreenBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<TestactiveScreenController>(
      () => TestactiveScreenController(),
    );
  }
}
