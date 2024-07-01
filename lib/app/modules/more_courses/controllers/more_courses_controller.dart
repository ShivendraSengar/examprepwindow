import 'dart:developer';
import 'package:exam_prep_tool/app/data/irepositry/icourses_repo.dart';
import 'package:exam_prep_tool/app/data/modal/categories_filterdata.dart';
import 'package:exam_prep_tool/app/data/modal/course.dart';
import 'package:exam_prep_tool/app/data/modal/courses_category.dart';
import 'package:exam_prep_tool/app/data/repositry/courses_repo.dart';
import 'package:exam_prep_tool/app/utils/pref_utis.dart';
import 'package:get/get.dart';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';

class MoreCoursesController extends GetxController {
  RxBool showDifferentContainer = false.obs;
  var categoryId = ''.obs;
  final courdata = <Datum>[].obs;
  final filterlist = <FilterData>[].obs;
  final PrefUtils prefutils = Get.find();
  final CourseRepo repositry = CoursesRepoIml();
  RxBool isLoading = false.obs;
  var ispuchased = ''.obs;
  final purchasedItemCount = 0.obs;
  late String myVariable;
  //////////////////category list

  final categorieslist = <Categories>[].obs;

  getcategorieslist() async {
    isLoading.value = false;
    try {
      final response = await repositry.getCoursescategory('priority');
      if (response.data != null) {
        categorieslist.value = response.data?.data ?? [];
        print("categories: ${categorieslist.first.category}");
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
    "images/all.png",
    "images/placement.png",
    "images/placement.png",
    "images/psu.png",
    "images/test sr.png",
    "images/data sciene.png",
    "images/revision.png",
    "images/revision.png",
    "images/revision.png",
    "images/revision.png",
    "images/placement.png",
    "images/placement.png",
    "images/psu.png",
    "images/test sr.png",
    "images/data sciene.png",
    "images/revision.png",
    "images/revision.png",
  ].obs;

  //////////////////////////////////////////////
  bool isDiscountValid(DateTime? validity) {
    if (validity == null) {
      // If no validity date is provided, consider it as valid.
      return true;
    }
    // Check if the current date is before the validity date.
    return DateTime.now().isBefore(validity);
  }

// //////////////

  //  Date timeparsing
  String? formatDate(String? dateString) {
    if (dateString == null) {
      return null; // or return an appropriate default value
    }
    DateTime? date = DateTime.tryParse(dateString);
    if (date == null) {
      return null; // or return an appropriate default value
    }
    String formattedDate = DateFormat("MMM dd, yyyy").format(date);
    return formattedDate;
  }

  int? getDaysUntilDate(DateTime? targetDate) {
    if (targetDate == null) {
      return null;
    }
    DateTime currentDate = DateTime.now();
    Duration difference = targetDate.difference(currentDate);
    return difference.inDays;
  }

  void removePurchasedCourses() {
    courdata.removeWhere((coursedetails) => coursedetails.purchased == "yes");
  }

  getFilterList() async {
    isLoading.value = true;

    String categoryIdToSend = categoryId.value ?? '';

    try {
      final response = await repositry.getFiltercategory(
          prefutils.getID().toString(), categoryIdToSend.toString());
      if (response.data != null) {
        print("filterlist ${response.data!.data!.length}");

        filterlist.value = response.data?.data ?? [];
      } else {
        filterlist.value = []; // or handle the null case in a different way
      }
      isLoading.value = false;
    } catch (e) {
      log("err $e");
      isLoading.value = false;
    }
  }

  //// Method to get the length of purchased "yes" items
  int get purchasedYesLength =>
      courdata.where((course) => course.purchased == "yes").length;

  // Method to get the length of purchased "no" items
  int get purchasedNoLength =>
      courdata.where((course) => course.purchased == "no").length;

  // Example usage
  getList() async {
    isLoading.value = true;

    try {
      final response =
          await repositry.getcourses(prefutils.getID().toString(), 'priority');
      if (response.data != null) {
        print("course ${response.data!.data!.length}");

        courdata.value = response.data!.data ?? [];
        // pages.value = response.data!.data ?? [];
      } else {
        print("Data is null");
        courdata.value = []; // or handle the null case in a different way
      }
      isLoading.value = false;
    } catch (e) {
      log("err $e");
      isLoading.value = false;
    }
  }

  @override
  void onInit() {
    super.onInit();
    getList();
    getFilterList();
    getcategorieslist();
  }

  void clearCategoriesList() {
    filterlist.clear();
  }

  @override
  void onReady() {
    super.onReady();
  }
//

  @override
  void onClose() {
    super.onClose();
  }
}
