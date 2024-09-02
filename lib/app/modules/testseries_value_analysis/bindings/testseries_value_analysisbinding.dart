
import 'package:exam_prep_tool/app/modules/testseries_mcq/controllers/testseries_mcq_controller.dart';
import 'package:exam_prep_tool/app/modules/testseries_value_analysis/controllers/testseries_view_analysis_controller.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/bindings_interface.dart';

class TestseriesViewAnlysisBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<TestseriesViewAnlysisController>(
      () => TestseriesViewAnlysisController(),
    );
     Get.lazyPut<TestseriesMcqController>(
      () => TestseriesMcqController(),
    );
  }
}
