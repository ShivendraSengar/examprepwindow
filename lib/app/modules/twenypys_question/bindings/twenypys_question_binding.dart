import 'package:get/get.dart';

import '../controllers/twenypys_question_controller.dart';

class TwenypysQuestionBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<TwenypysQuestionController>(
      () => TwenypysQuestionController(),
    );
  }
}
