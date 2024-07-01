import 'dart:io';

import 'package:exam_prep_tool/app/data/modal/buycourses_modal.dart';
import 'package:exam_prep_tool/app/data/modal/live_lectures_list.dart';
import 'package:exam_prep_tool/app/data/modal/payments_modal.dart';
import 'package:exam_prep_tool/app/data/modal/verify_payments.dart';
import 'package:exam_prep_tool/app/data/params/paramspayments.dart';
import 'package:exam_prep_tool/app/data/params/veryfy_payments_params.dart';
import 'package:exam_prep_tool/app/data/repositry/payments_repo.dart';
import 'package:exam_prep_tool/app/utils/utils.dart';
import 'package:dio/dio.dart';

class VerfypaymentRepoImpl implements PaymentsRepo {
  @override
  Future<DataState<Payments>> payments(
      Paramspayments param, String token) async {
    try {
      final httpresponse =
          await CommonRepository.getApiService().payments(token, param);
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
  Future<DataState<Verifypayments>> verifypayments(
    VeryfyPaymentsParams param,
  ) async {
    try {
      final httpresponse =
          await CommonRepository.getApiService().verifypayments(param);
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
  Future<DataState<BuyCourses>> checkCourseBuy(String id) async {
    try {
      final httpresponse =
          await CommonRepository.getApiService().checkCourseBuy(id);
      if (httpresponse.response.statusCode == HttpStatus.ok) {
        // print(httpresponse.data.toJson());
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
  Future<DataState<Livechnalelist>> livelectureslist(String id, String token) async {
    try {
      var httpresponse =
          await CommonRepository.getApiService().livelectureslist(id, token);
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

//  @override
//  Future<DataState<Livechnalelist>> livelectureslist(String id)async {
//  try{
//    var httpresponse = await CommonRepository.getApiService().livelectureslist(id);
//    if (httpresponse.response.statusCode == HttpStatus.ok){
//      return DataSuccess(httpresponse.data);
//    }
//    return DataFailed(DioError(requestOptions: httpresponse.response.requestOptions,

//    error: httpresponse.response.statusMessage,
//    response: httpresponse.response,
//    type: DioErrorType.cancel

//    ));

//  } on DioError
//  catch(e){
//    return DataFailed(e);
//  }
//  }
//}
}
