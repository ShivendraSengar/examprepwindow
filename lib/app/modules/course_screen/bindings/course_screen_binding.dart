import 'package:exam_prep_tool/app/modules/courses_categories/controllers/categories_controller.dart';
import 'package:get/get.dart';

import '../controllers/course_screen_controller.dart';

class CourseScreenBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CourseScreenController>(
      () => CourseScreenController(),
    );
    Get.lazyPut(() => CategoriesController());
  }
}
