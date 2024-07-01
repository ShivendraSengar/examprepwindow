import 'package:exam_prep_tool/app/modules/courses_categories/controllers/categories_controller.dart';
import 'package:exam_prep_tool/app/modules/login_screen/controllers/login_screen_controller.dart';
import 'package:exam_prep_tool/app/modules/more_courses/controllers/more_courses_controller.dart';
import 'package:exam_prep_tool/app/modules/proile_page/controllers/proile_page_controller.dart';
import 'package:get/get.dart';

import '../../select_coursesScreen/controllers/select_courses_screen_controller.dart';
import '../controllers/home_controller.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HomeController>(
      () => HomeController(),
    );
    Get.lazyPut<MoreCoursesController>(
      () => MoreCoursesController(),
    );
   Get.lazyPut(()=>CategoriesController());
  
     Get.lazyPut<LoginScreenController>(
      () => LoginScreenController(),
    );
    Get.lazyPut(()=>ProilePageController());
    Get.lazyPut(() => SelectCoursesScreenController());
  }
}
