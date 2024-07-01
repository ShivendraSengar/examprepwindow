import 'dart:developer';

import 'package:exam_prep_tool/app/utils/const.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
//import 'package:flutter_windowmanager/flutter_windowmanager.dart';
import 'package:get/get.dart';
import 'package:screen_protector/screen_protector.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

class ShowPdfViewController extends GetxController {
  var pdf = Get.arguments;

  var selectedValue = Get.arguments;
  final PdfViewerController pdfViewerController = PdfViewerController();
  RxBool canShowPageLoadingIndicator = true.obs;
  final GlobalKey<SfPdfViewerState> pdfViewerKey = GlobalKey();
  final GlobalKey<SfPdfViewerState> pdfViewerKey1 = GlobalKey();
  final count = 0.obs;
  RxBool isPdfLoaded = false.obs;
    double blurr = 20;
  double opacity = 0.5;
  bool controlKeyPressed = false; // Track if Control key is pressed

  FocusNode focusNode = FocusNode(); 

  //void secureScreen() async {
  //  await FlutterWindowManager.addFlags(FlutterWindowManager.FLAG_SECURE);
  //}
  //void screenon() async {
  //  await ScreenProtector.preventScreenshotOn();
  //}

  @override
  void onInit() {
    //screenon();
    //secureScreen();
    focusNode.requestFocus();
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }
void handleKey(RawKeyEvent event) {
    if (event is RawKeyDownEvent &&
        (event.logicalKey == LogicalKeyboardKey.shiftLeft ||
            event.logicalKey == LogicalKeyboardKey.shiftRight)) {
      blurr = 100;
      opacity = 0.0;
      controlKeyPressed = true;
      update(); // Update the UI

      Get.dialog(
        AlertDialog(
          title: Text("Shift Key Pressed"),
          content: Text("Shift key (Left or Right) is pressed."),
          actions: <Widget>[
            TextButton(
              child: Text("OK"),
              onPressed: () {
                Get.back(); // Close the dialog
                resetState();
              },
            ),
          ],
        ),
      );
    } else if (event is RawKeyDownEvent &&
        event.logicalKey == LogicalKeyboardKey.f10) {
      blurr = 100;
      opacity = 0.0;
      update(); // Update the UI

      Get.dialog(
        AlertDialog(
          title: Text("F10 Key Pressed"),
          content: Text("F10 key is pressed."),
          actions: <Widget>[
            TextButton(
              child: Text("OK"),
              onPressed: () {
                Get.back(); // Close the dialog
                resetState();
              },
            ),
          ],
        ),
      );
    } else if (event is RawKeyDownEvent &&  event.logicalKey == LogicalKeyboardKey.metaLeft ||
        event.logicalKey == LogicalKeyboardKey.metaLeft ||event.logicalKey == LogicalKeyboardKey.printScreen) {
      blurr = 100;
      opacity = 0.0;
      update(); // Update the UI

      Get.dialog(
        AlertDialog(
          title: Text("Print Screen Key Pressed"),
          content: Text("Print Screen key is pressed."),
          actions: <Widget>[
            TextButton(
              child: Text("OK"),
              onPressed: () {
                Get.back(); // Close the dialog
                resetState();
              },
            ),
          ],
        ),
      );
    } else if (event is RawKeyDownEvent &&  event.logicalKey == LogicalKeyboardKey.controlLeft ||
        event.logicalKey == LogicalKeyboardKey.controlRight ||event.logicalKey == LogicalKeyboardKey.printScreen) {
      blurr = 100;
      opacity = 0.0;
      update(); // Update the UI

      Get.dialog(
        AlertDialog(
          title: Text("Print Screen Key Pressed"),
          content: Text("Print Screen key is pressed."),
          actions: <Widget>[
            TextButton(
              child: Text("OK"),
              onPressed: () {
                Get.back(); // Close the dialog
                resetState();
              },
            ),
          ],
        ),
      );
    }
    else if (event is RawKeyUpEvent &&
        (event.logicalKey == LogicalKeyboardKey.shiftLeft ||
            event.logicalKey == LogicalKeyboardKey.shiftRight)) {
      blurr = 20;
      opacity = 0.5;
      if (controlKeyPressed) {
        controlKeyPressed = false;
        Get.back(); // Close any open dialog if Shift key is released
      }
      update(); // Update the UI
    }
  }

  void resetState() {
    blurr = 20;
    opacity = 0.5;
    update(); // Update the UI
  }

  @override
  void onClose() {
    focusNode.dispose();
    super.onClose();
  }
}