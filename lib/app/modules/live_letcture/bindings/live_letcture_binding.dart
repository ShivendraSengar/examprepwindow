import 'package:get/get.dart';

import '../controllers/live_letcture_controller.dart';

class LiveLetctureBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<LiveLetctureController>(
      () => LiveLetctureController(),
    );
  }
}
