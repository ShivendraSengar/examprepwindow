import 'package:get/get.dart';

import '../controllers/terms_conditionscreen_controller.dart';

class TermsConditionscreenBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<TermsConditionscreenController>(
      () => TermsConditionscreenController(),
    );
  }
}
