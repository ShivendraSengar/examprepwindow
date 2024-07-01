import 'package:dio/dio.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/route_manager.dart';

import '../routes/app_pages.dart';

class TokenInterceptor extends Interceptor {
  @override
  void onError(DioError err, ErrorInterceptorHandler handler) {
    if (err.response?.statusCode == 401) {
      // Token expired
      // Redirect to login screen or refresh token
      // For example:
      Get.offAllNamed(Routes.LOGIN_SCREEN);
    }
    super.onError(err, handler);
  }
}
