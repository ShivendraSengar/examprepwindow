import 'package:get/get.dart';

import '../controllers/contact_uspage_controller.dart';

class ContactUspageBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ContactUspageController>(
      () => ContactUspageController(),
    );
  }
}
