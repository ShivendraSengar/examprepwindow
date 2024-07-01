import 'package:exam_prep_tool/app/modules/courses_categories/controllers/categories_controller.dart';
import 'package:exam_prep_tool/app/modules/more_courses/views/categories_lists.dart';
import 'package:get/get.dart';

import '../controllers/more_courses_controller.dart';

class MoreCoursesBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<MoreCoursesController>(
      () => MoreCoursesController(),
    );
    Get.lazyPut<Mobileview>(
      () => Mobileview(),
    );
    Get.lazyPut(() => CategoriesController());
  }
}
