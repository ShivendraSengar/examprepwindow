import 'package:get/get.dart';

import '../controllers/privacy_policypage_controller.dart';

class PrivacyPolicypageBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<PrivacyPolicypageController>(
      () => PrivacyPolicypageController(),
    );
  }
}
