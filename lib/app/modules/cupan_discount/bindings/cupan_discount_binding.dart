import 'package:get/get.dart';

import '../controllers/cupan_discount_controller.dart';

class CupanDiscountBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CupanDiscountController>(
      () => CupanDiscountController(),
    );
  }
}
