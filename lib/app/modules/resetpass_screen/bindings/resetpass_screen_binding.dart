import 'package:get/get.dart';

import '../controllers/resetpass_screen_controller.dart';

class ResetpassScreenBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ResetpassScreenController>(
      () => ResetpassScreenController(),
    );
  }
}
