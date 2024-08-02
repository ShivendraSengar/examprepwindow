import 'dart:convert';

import 'package:exam_prep_tool/app/data/irepositry/ipayments_repo.dart';
import 'package:exam_prep_tool/app/data/repositry/payments_repo.dart';
import 'package:exam_prep_tool/app/modules/cupan_discount/controllers/cupan_discount_controller.dart';
import 'package:exam_prep_tool/app/routes/app_pages.dart';
import 'package:exam_prep_tool/app/utils/const.dart';
import 'package:exam_prep_tool/app/utils/utils.dart';
import 'package:get/get.dart';
import 'package:webview_windows/webview_windows.dart';
import 'dart:async';
import 'package:flutter/services.dart';
import 'package:flutter/material.dart';
import 'package:window_manager/window_manager.dart';
import 'package:exam_prep_tool/app/utils/pref_utis.dart';
import 'package:http/http.dart' as https;

class RazorPayWindowPageController extends GetxController {
  final CupanDiscountController paymentController =
      Get.find<CupanDiscountController>();
  final PaymentsRepo repositry = VerfypaymentRepoImpl();
  final arguments = Get.arguments;
  final webviewController = WebviewController().obs;
  final PrefUtils prefutils = Get.find();
  final isInitialized = false.obs;
  final List<StreamSubscription> _subscriptions = [];
  final isLoading = true.obs;
  final isWebviewSuspended = false.obs;
  final amount = 1;
  final String token = 'YOUR_API_TOKEN';
  final String courseId = "6628ab03c164732b4ac30c13";
  final String type = "all";
  final String userId = "6628726ec164732b4ac30be3"; // Example token
  var orderid = "";

  @override
  void onInit() {
    super.onInit();
    initPlatformState();
    // paymentGetId();
  }

  

  Future<void> initPlatformState() async {
    try {
      await webviewController.value.initialize();
      webviewController.value.url.listen((url) {
        // handle URL changes if needed
      });

      webviewController.value.containsFullScreenElementChanged.listen((flag) {
        windowManager.setFullScreen(flag);
      });

      await webviewController.value.setBackgroundColor(Colors.transparent);
      await webviewController.value
          .setPopupWindowPolicy(WebviewPopupWindowPolicy.deny);

      // Load the local HTML file
      final String razorpayHtml =
          await rootBundle.loadString('images/razorpay_checkout.html');
      await webviewController.value.loadUrl(Uri.dataFromString(
        razorpayHtml,
        mimeType: 'text/html',
        encoding: Encoding.getByName('utf-8'),
      ).toString());

      // Example of updating amount and token dynamically
      Future.delayed(Duration(seconds: 2), () {
        final String script = '''
          window.amountFromFlutter ='${arguments[0]}';
          window.tokenFromFlutter = "${prefutils.getToken()}";
          window.courseIdFromFlutter = "${arguments[1]}";
          window.typeFromFlutter = "${arguments[2]}";
          window.userIdFromFlutter = "${prefutils.getID().toString()}";
          window.inmonthFromFlutter = "${arguments[3]}";
          window.orderidpayFromFlutter = "${paymentController.paymentId.value}";

        ''';
        webviewController.value.executeScript(script);
      });
// Listen for messages from the web view
      _subscriptions.add(webviewController.listen((message) {
        if (message == 'navigateToHome') {
          Get.toNamed(Routes.COURSE_SCREEN);
        }
      }));
      isInitialized.value = true;
    } on PlatformException catch (e) {
      Get.snackbar('Error', 'Code: ${e.code}\nMessage: ${e.message}');
    }
  }

  Future<WebviewPermissionDecision> onPermissionRequested(
      String url, WebviewPermissionKind kind, bool isUserInitiated) async {
    final decision = await Get.defaultDialog<WebviewPermissionDecision>(
      title: 'WebView permission requested',
      content: Text('WebView has requested permission \'$kind\''),
      actions: [
        TextButton(
          onPressed: () => Get.back(result: WebviewPermissionDecision.deny),
          child: const Text('Deny'),
        ),
        TextButton(
          onPressed: () => Get.back(result: WebviewPermissionDecision.allow),
          child: const Text('Allow'),
        ),
      ],
    );

    return decision ?? WebviewPermissionDecision.none;
  }
}
