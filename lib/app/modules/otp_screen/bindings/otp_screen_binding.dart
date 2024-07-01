import 'package:exam_prep_tool/app/modules/forgetpass_screen/controllers/forgetpass_screen_controller.dart';
import 'package:get/get.dart';

import '../controllers/otp_screen_controller.dart';

class OtpScreenBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<OtpScreenController>(
      () => OtpScreenController(),
    );
  }
}
