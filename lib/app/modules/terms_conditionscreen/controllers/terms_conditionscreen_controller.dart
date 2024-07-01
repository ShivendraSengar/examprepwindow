import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TermsConditionscreenController extends GetxController {
  var showFullText = false.obs;
  final actionTextStyle =
      TextStyle(color: Colors.blue[900], fontWeight: FontWeight.bold);
  final count = 0.obs;
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
