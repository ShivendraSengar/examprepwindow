import 'dart:developer';

import 'package:exam_prep_tool/app/data/irepositry/itestseries_repo.dart';
import 'package:exam_prep_tool/app/data/modal/test_series/view_answerdetail_page_modal.dart';

import 'package:exam_prep_tool/app/data/repositry/testseries_repo.dart';
import 'package:exam_prep_tool/app/modules/testseries_mcq/controllers/testseries_mcq_controller.dart';
import 'package:exam_prep_tool/app/utils/pref_utis.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

class TestseriesViewAnlysisController extends GetxController {
  final TestseriesMcqController controller1 = Get.find();
  var finalMarks;
  var testSeriesId;

  final TestSeriesRepo repositry = TestSeriesRepoIMPL();
  final RxList<Answerlist> viewAnslist = <Answerlist>[].obs;

  var expandedIndex = (-1).obs;

  void updateExpandedIndex(int index) {
    expandedIndex.value = index;
  } // To track the expanded index

  // final testSeries = Testseries().obs; // Rx<Testseries>
  var isLoading = false.obs;
  final PrefUtils prefutils = Get.find();

  void viewAnswerdetails() async {
    print("Testseriesid ${testSeriesId.toString()}");
    try {
      isLoading(true);
      final response = await repositry.viewAnswerdetail(
          prefutils.getID().toString(),
          testSeriesId.toString()); // Your API call here
      if (response.data != null) {
        viewAnslist.value = response.data?.data ?? [];

        print('Data fetched: ${viewAnslist.length} items');
      } else {
        print('Failed to fetch data');
      }
    } catch (e) {
      print('Error fetching data: $e');
    } finally {
      isLoading(false);
    }
  }

  @override
  void onInit() {
    super.onInit();
    final arguments = Get.arguments;
    finalMarks = arguments[0]; // index
    testSeriesId = arguments[1]; // data.id

    print('Final Marks: $finalMarks');
    print('Test Series ID: $testSeriesId');
    print("userid ${prefutils.getID().toString()}");
    viewAnswerdetails();
  }

  @override
  void onClose() {
    super.onClose();
    testSeriesId = null; // Clear testSeriesId
    finalMarks = null; // Clear final marks
  }
}
