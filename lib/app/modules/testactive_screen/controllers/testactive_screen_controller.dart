import 'package:get/get.dart';

class TestactiveScreenController extends GetxController {
  //TODO: Implement TestactiveScreenController

  final count = 0.obs;
  var isChecked = false.obs;

  void toggleCheckbox(bool? value) {
    isChecked.value = value!;
  }

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void increment() => count.value++;
}
