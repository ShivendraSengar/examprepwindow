import 'dart:developer';

import 'package:exam_prep_tool/app/data/irepositry/icourses_repo.dart';
import 'package:exam_prep_tool/app/data/modal/courses_category.dart';
import 'package:exam_prep_tool/app/data/repositry/courses_repo.dart';
import 'package:get/get.dart';

class CategoriesController extends GetxController {
  final CourseRepo repositry = CoursesRepoIml();
  final categorieslist = <Categories>[].obs;
  RxBool isLoading = false.obs;
  var data222 = "";

  getcategorieslist() async {
    try {
      final response = await repositry.getCoursescategory("priority");
      if (response.data != null) {
        categorieslist.value = response.data?.data ?? [];
        print("Number of purchased discount: ${categorieslist.first.category}");
        print("Number of purchased items in controller: ${categorieslist}");
      } else {
        categorieslist.value = []; // or handle the null case in a different way
      }

      isLoading.value = false;
    } catch (e) {
      log("err $e");
      isLoading.value = false;
    }
  }

  final images = [
    "images/test sr.png",
    "images/placement.png",
    "images/placement.png",
    "images/psu.png",
    "images/test sr.png",
    "images/data sciene.png",
    "images/revision.png",
    "images/psu.png",
    "images/test sr.png",
    "images/data sciene.png",
    "images/revision.png",
  ].obs;

  @override
  void onInit() {
    super.onInit();
    getcategorieslist();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }
}
