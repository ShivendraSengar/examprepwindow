


import 'package:exam_prep_tool/app/modules/razor_pay_window/controller/razor_pay_controller.dart';
import 'package:exam_prep_tool/app/utils/const.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:webview_windows/webview_windows.dart';

class RazorpayWindowPageView extends GetView<RazorPayWindowPageController> {
  const RazorpayWindowPageView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
 return Scaffold(
      appBar: AppBar(
        title:
         Text('Razorpay Checkout')
      ),
      
      body: Center(
        child: Obx(() {
          if (!controller.isInitialized.value) {
            return const Text(
              'Not Initialized',
              style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.w900),
            );
          } else {
            return Padding(
              padding: EdgeInsets.all(20),
              child: Column(
                children: [
                  
                  Expanded(
                    child: Card(
                      color: Colors.transparent,
                      elevation: 0,
                      clipBehavior: Clip.antiAliasWithSaveLayer,
                      child: Stack(
                        children: [
                          Webview(
                            controller.webviewController.value,
                            permissionRequested: controller.onPermissionRequested,
                          ),
                          Obx(() {
                            if (controller.isLoading.value) {
                              return LinearProgressIndicator();
                            } else {
                              return SizedBox();
                            }
                          }),
                        ],
                      ),
                    ),
                  ),
                  Text("ososos${controller.paymentController.paymentId}"),
                  // Text(controller.arguments[0].toString()),
                  //   Text(controller.prefutils.getToken().toString()),
                  //    Text(controller.prefutils.getID().toString()),
                  //       Text(controller.arguments[2].toString()),
                  //       Text(controller.arguments[1].toString()),
                  //       Text(controller.arguments[3].toString()),
                       

                        

                ],
              ),
            );
          }
        }),
      ),
    );
  }
}