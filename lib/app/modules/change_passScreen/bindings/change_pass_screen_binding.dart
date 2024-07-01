import 'package:exam_prep_tool/app/modules/home/controllers/home_controller.dart';
import 'package:exam_prep_tool/app/modules/login_screen/controllers/login_screen_controller.dart';
import 'package:exam_prep_tool/app/modules/mystory_page/controllers/mystory_page_controller.dart';
import 'package:get/get.dart';

import '../controllers/change_pass_screen_controller.dart';

class ChangePassScreenBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ChangePassScreenController>(
      () => ChangePassScreenController(),
    );
    Get.lazyPut<LoginScreenController>(
      () => LoginScreenController(),
    );
    Get.lazyPut<HomeController>(
      () => HomeController(),
    );
    Get.lazyPut<MystoryPageController>(
      () => MystoryPageController(),
    );
  }
}
