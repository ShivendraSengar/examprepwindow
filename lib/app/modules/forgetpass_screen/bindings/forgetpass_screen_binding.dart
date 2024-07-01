import 'package:get/get.dart';

import '../controllers/forgetpass_screen_controller.dart';

class ForgetpassScreenBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ForgetpassScreenController>(
      () => ForgetpassScreenController(),
    );
  }
}
