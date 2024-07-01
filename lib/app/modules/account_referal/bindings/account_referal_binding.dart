import 'package:exam_prep_tool/app/modules/proile_page/controllers/proile_page_controller.dart';
import 'package:get/get.dart';

import '../controllers/account_referal_controller.dart';

class AccountReferalBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AccountReferalController>(
      () => AccountReferalController(),
    );
    Get.lazyPut<ProilePageController>(
      () => ProilePageController(),
    );
  }
}
