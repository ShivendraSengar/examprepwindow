import 'package:exam_prep_tool/app/modules/login_screen/controllers/login_screen_controller.dart';
import 'package:get/get.dart';

import '../controllers/mystory_page_controller.dart';

class MystoryPageBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<MystoryPageController>(
      () => MystoryPageController(),
    );
    Get.lazyPut<LoginScreenController>(
      () => LoginScreenController(),
    );
  }
}
