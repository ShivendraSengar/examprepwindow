import 'package:get/get.dart';

import '../controllers/air_notes_controller.dart';

class AirNotesBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AirNotesController>(
      () => AirNotesController(),
    );
  }
}
