import 'package:exam_prep_tool/app/modules/twenypys_question/controllers/twenypys_question_controller.dart';
import 'package:get/get.dart';

import '../controllers/show_pdf_view_controller.dart';

class ShowPdfViewBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ShowPdfViewController>(
      () => ShowPdfViewController(),
    );
    Get.lazyPut<TwenypysQuestionController>(
      () => TwenypysQuestionController(),
    );
  }
}
