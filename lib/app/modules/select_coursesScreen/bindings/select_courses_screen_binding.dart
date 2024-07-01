import 'package:get/get.dart';

import '../controllers/select_courses_screen_controller.dart';

class SelectCoursesScreenBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SelectCoursesScreenController>(
      () => SelectCoursesScreenController(),
    );
  }
}
