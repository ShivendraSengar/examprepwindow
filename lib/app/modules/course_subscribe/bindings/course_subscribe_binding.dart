import 'package:exam_prep_tool/app/modules/selected_vidiolecture/controllers/selected_vidiolecture_controller.dart';
import 'package:get/get.dart';

import '../controllers/course_subscribe_controller.dart';

class CourseSubscribeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CourseSubscribeController>(
      () => CourseSubscribeController(),
    );

    Get.lazyPut<SelectedVidiolectureController>(
      () => SelectedVidiolectureController(),
    );
  }
}
