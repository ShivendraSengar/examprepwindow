import 'package:exam_prep_tool/app/modules/forgetpass_screen/controllers/forgetpass_screen_controller.dart';
import 'package:exam_prep_tool/app/modules/login_screen/controllers/login_screen_controller.dart';
import 'package:exam_prep_tool/app/modules/proile_page/controllers/proile_page_controller.dart';
import 'package:exam_prep_tool/app/modules/resetpass_screen/controllers/resetpass_screen_controller.dart';
import 'package:exam_prep_tool/app/modules/selected_vidiolecture/controllers/selected_vidiolecture_controller.dart';
import 'package:exam_prep_tool/app/modules/signup_screen/controllers/signup_screen_controller.dart';
import 'package:get/get.dart';

import '../controllers/play_vidio_controller.dart';

class PlayVidioBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<PlayVidioController>(
      () => PlayVidioController(),
    );
    Get.lazyPut<LoginScreenController>(
      () => LoginScreenController(),
    );
    Get.lazyPut<SelectedVidiolectureController>(
      () => SelectedVidiolectureController(),
    );
    Get.lazyPut<ResetpassScreenController>(
      () => ResetpassScreenController(),
    );
    //Get.lazyPut<ForgetpassScreenController>(
    //  () => ForgetpassScreenController(),
    //);
  }
}
