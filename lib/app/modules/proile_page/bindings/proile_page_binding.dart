import 'package:get/get.dart';

import '../controllers/proile_page_controller.dart';

class ProilePageBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ProilePageController>(
      () => ProilePageController(),
    );
  }
}
