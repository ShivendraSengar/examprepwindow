import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:exam_prep_tool/app/utils/utils.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/route_manager.dart';

import '../routes/app_pages.dart';

// class TokenInterceptor extends Interceptor {
//   @override
//   void onError(DioError err, ErrorInterceptorHandler handler) {
//     if (err.response?.statusCode == 401) {
//       // Token expired
//       // Redirect to login screen or refresh token
//       // For example:
//       Get.offAllNamed(Routes.LOGIN_SCREEN);
//     }
//     super.onError(err, handler);
//   }
// }
class TokenInterceptor extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) async {
    // Retrieve token from storage
    var token = await prefUtils.getToken();

    // Add token to headers
    options.headers["Authorization"] = "Bearer $token";

    return handler.next(options);
  }

  @override
  void onError(DioError err, ErrorInterceptorHandler handler) {
    if (err.response?.statusCode == 401) {
      // Token is invalid or user is logged in on another device
      log("Token expired or logged in on another device");
      showToastMessage("Session Expired", "You have been logged out because your account was accessed from another device.");
      Get.offAllNamed(Routes.LOGIN_SCREEN); // Log the user out and redirect to login screen
    }
    super.onError(err, handler);
  }
}

