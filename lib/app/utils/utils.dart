import 'dart:convert';
import 'dart:developer';
import 'package:exam_prep_tool/app/utils/token_verify.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:exam_prep_tool/app/data/app_apis/app_apis.dart';
import 'package:exam_prep_tool/app/utils/pref_utis.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:dio/dio.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'dart:convert';
import 'package:crypto/crypto.dart';

final Dio dio = Dio();

// String decryptURL(String encryptedURL, String key) {
//   final urlParts = encryptedURL.split('?');
//   if (urlParts.length == 2 && urlParts[1].startsWith('signature=')) {
//     final url = urlParts[0];
//     final signature = urlParts[1].substring('signature='.length);
//     final keyBytes = utf8.encode(key);
//     final urlBytes = utf8.encode(url);
//     final hmacSha256 = Hmac(sha256, keyBytes);
//     final expectedSignatureBytes = hmacSha256.convert(urlBytes).bytes;
//     final expectedSignature = base64UrlEncode(expectedSignatureBytes);
//     if (signature == expectedSignature) {
//       return url;
//     }
//   }
//   throw Exception('Invalid signature');
// }

void showToastMessage(String title, String message) {
  Get.snackbar(
    title,
    message,
    duration: const Duration(seconds: 1),
  );
}

final PrefUtils prefUtils = Get.find();

class CommonRepository {
  static AppApis _apiService = AppApis(getDio());

  static AppApis getApiService() {
    return _apiService;
  }

  static setApiService() {
    _apiService = AppApis(getDio());
  }

  static Dio getDio() {
  var token = getToken();
  log("token $token");
  return Dio(
    BaseOptions(
      contentType: 'application/json',
      headers: {"Authorization": "Bearer $token"},
    ),
  )..interceptors.add(TokenInterceptor());
}}

abstract class DataState<T> {
  final T? data;
  final DioError? error;

  const DataState({this.data, this.error});
}

class DataSuccess<T> extends DataState<T> {
  const DataSuccess(T data) : super(data: data);
}

class DataFailed<T> extends DataState<T> {
  DataFailed(DioError error) : super(error: error) {
    log("error ${error.response.toString()}");
    showToastMessage("Error",
        json.decode(error.response.toString())["msg"] ?? error.message);
  }
}

void setupInterceptors() {
  dio.interceptors.add(TokenInterceptor());
}



Future<String> getToken() async {
  try {
    var token = await FirebaseMessaging.instance.getToken();
    return token!;
  } catch (err) {
    log("err $err");
    return "";
  }
}
