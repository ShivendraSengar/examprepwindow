import 'package:exam_prep_tool/app/utils/pref_utis.dart';
//import 'package:flutter_shated/app/storage/pref_utils.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class InitialBindings extends Bindings {
  @override
  void dependencies() {
    Get.put(PrefUtils());
  }
}
