import 'package:get/get.dart';

import '../controllers/un_authorized_person_controller.dart';

class UnAuthorizedPersonBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<UnAuthorizedPersonController>(
      () => UnAuthorizedPersonController(),
    );
  }
}
