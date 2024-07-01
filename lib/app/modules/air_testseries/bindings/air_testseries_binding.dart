import 'package:get/get.dart';

import '../controllers/air_testseries_controller.dart';

class AirTestseriesBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AirTestseriesController>(
      () => AirTestseriesController(),
    );
  }
}
