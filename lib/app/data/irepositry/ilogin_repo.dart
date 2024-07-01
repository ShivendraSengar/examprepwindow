import 'dart:io';

import 'package:exam_prep_tool/app/data/modal/change_password.dart';
import 'package:exam_prep_tool/app/data/modal/login_response/login_response.dart';
import 'package:exam_prep_tool/app/data/modal/one_device_login.dart';
import 'package:exam_prep_tool/app/data/modal/otp_response/otp_response.dart';
import 'package:exam_prep_tool/app/data/modal/payments_modal.dart';
import 'package:exam_prep_tool/app/data/modal/signup/forget_password_response.dart';
import 'package:exam_prep_tool/app/data/modal/signup/send_otp_response.dart';
import 'package:exam_prep_tool/app/data/params/changepass_params.dart';
//import 'package:exam_prep_tool/app/data/modal/signup/forgetpassword_response.dart';
//import 'package:exam_prep_tool/app/data/modal/signup/send_otp_response.dart';
import 'package:exam_prep_tool/app/data/params/forgetpassparams.dart';
import 'package:exam_prep_tool/app/data/params/loginparams.dart';
//import 'package:exam_prep_tool/app/data/modal/signup/otp_response/otp_response.dart';
import 'package:exam_prep_tool/app/data/params/otpparams.dart';
import 'package:exam_prep_tool/app/data/params/paramspayments.dart';
//import 'package:exam_prep_tool/app/data/params/payment_params.dart';
import 'package:exam_prep_tool/app/data/params/send_otp_params.dart';
import 'package:exam_prep_tool/app/data/params/signup_params.dart';
import 'package:exam_prep_tool/app/data/modal/signup/signup_response.dart';
import 'package:exam_prep_tool/app/data/repositry/login_repo.dart';

import 'package:exam_prep_tool/app/utils/utils.dart';
import 'package:dio/dio.dart';

class LoginRepoImpl implements LoginRepo {
  @override
  Future<DataState<LoginResponse>> auth(Loginparams param) async {
    try {
      var httpresponse = await CommonRepository.getApiService().auth(param);
      if (httpresponse.response.statusCode == HttpStatus.ok) {
        print("asss${httpresponse.data.toJson()}");
        return DataSuccess(httpresponse.data);
      }
      return DataFailed(DioError(
          requestOptions: httpresponse.response.requestOptions,
          error: httpresponse.response.statusMessage,
          response: httpresponse.response,
          type: DioErrorType.cancel));
    } on DioError catch (e) {
      return DataFailed(e);
    }
  }

  @override
  Future<DataState<SignupResponse>> signup(SignupParams param) async {
    try {
      final httpresponse = await CommonRepository.getApiService().signup(param);
      if (httpresponse.response.statusCode == HttpStatus.ok) {
        return DataSuccess(httpresponse.data);
      }
      return DataFailed(DioError(
          requestOptions: httpresponse.response.requestOptions,
          error: httpresponse.response.statusMessage,
          response: httpresponse.response,
          type: DioErrorType.cancel));
    } on DioError catch (e) {
      return DataFailed(e);
    }
  }

  @override
  Future<DataState<OtpResponse>> otpverify(Otpparams param) async {
    try {
      final httpresponse =
          await CommonRepository.getApiService().otpverify(param);
      if (httpresponse.response.statusCode == HttpStatus.ok) {
        return DataSuccess(httpresponse.data);
      }
      return DataFailed(DioError(
          requestOptions: httpresponse.response.requestOptions,
          error: httpresponse.response.statusMessage,
          response: httpresponse.response,
          type: DioErrorType.cancel));
    } on DioError catch (e) {
      return DataFailed(e);
    }
  }

  @override
  Future<DataState<SendOtpResponse>> sendotprespo(SendOtpParams param) async {
    try {
      final httpresponse =
          await CommonRepository.getApiService().sendotprespo(param);
      if (httpresponse.response.statusCode == HttpStatus.ok) {
        return DataSuccess(httpresponse.data);
      }
      return DataFailed(DioError(
          requestOptions: httpresponse.response.requestOptions,
          error: httpresponse.response.statusMessage,
          response: httpresponse.response,
          type: DioErrorType.cancel));
    } on DioError catch (e) {
      return DataFailed(e);
    }
  }

  @override
  Future<DataState<ForgetpasswordResponse>> fogretpass(
      Forgetpassparams param) async {
    try {
      final httpresponse =
          await CommonRepository.getApiService().fogretpass(param);
      if (httpresponse.response.statusCode == HttpStatus.ok) {
        return DataSuccess(httpresponse.data);
      }
      return DataFailed(DioError(
          requestOptions: httpresponse.response.requestOptions,
          error: httpresponse.response.statusMessage,
          response: httpresponse.response,
          type: DioErrorType.cancel));
    } on DioError catch (e) {
      return DataFailed(e);
    }
  }

  @override
  Future<DataState<ChangePassword>> changepassword(
      ChangepassParams param, String token) async {
    try {
      final httpresponse =
          await CommonRepository.getApiService().changepassword(token, param);
      if (httpresponse.response.statusCode == HttpStatus.ok) {
        return DataSuccess(httpresponse.data);
      }
      return DataFailed(DioError(
          requestOptions: httpresponse.response.requestOptions,
          error: httpresponse.response.statusMessage,
          response: httpresponse.response,
          type: DioErrorType.cancel));
    } on DioError catch (e) {
      return DataFailed(e);
    }
  }

  @override
  Future<DataState<CheckToken>> onedevicelogin(String token) async {
    try {
      final httpresponse =
          await CommonRepository.getApiService().onedevicelogin(token);
      if (httpresponse.response.statusCode == HttpStatus.ok) {
        return DataSuccess(httpresponse.data);
      }
      return DataFailed(DioError(
          requestOptions: httpresponse.response.requestOptions,
          response: httpresponse.response,
          error: httpresponse.response.statusMessage,
          type: DioErrorType.cancel));
    } on DioError catch (e) {
      return DataFailed(e);
    }
  }
}
