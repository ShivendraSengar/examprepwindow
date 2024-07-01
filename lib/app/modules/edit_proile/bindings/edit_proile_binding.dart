import 'package:exam_prep_tool/app/modules/proile_page/controllers/proile_page_controller.dart';
import 'package:get/get.dart';

import '../controllers/edit_proile_controller.dart';

class EditProileBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<EditProileController>(
      () => EditProileController(),
    );
    Get.lazyPut<ProilePageController>(
      () => ProilePageController(),
    );
  }
}
