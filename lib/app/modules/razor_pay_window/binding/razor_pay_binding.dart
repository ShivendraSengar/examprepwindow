import 'package:get/get.dart';

import '../controller/razor_pay_controller.dart';



class RazorpayWindowBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<RazorPayWindowPageController>(
      () => RazorPayWindowPageController(),
    );
  }
}
