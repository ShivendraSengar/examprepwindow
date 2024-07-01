import 'package:get/get.dart';

import '../controllers/resolve_doubtpage_controller.dart';

class ResolveDoubtpageBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ResolveDoubtpageController>(
      () => ResolveDoubtpageController(),
    );
  }
}
