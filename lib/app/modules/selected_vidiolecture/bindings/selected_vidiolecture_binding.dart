import 'package:get/get.dart';

import '../controllers/selected_vidiolecture_controller.dart';

class SelectedVidiolectureBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SelectedVidiolectureController>(
      () => SelectedVidiolectureController(),
    );
  }
}
