import 'dart:io';

import 'package:exam_prep_tool/app/data/modal/profile/edit_profile.dart';
import 'package:exam_prep_tool/app/data/modal/profile/profile_updated.dart';
import 'package:exam_prep_tool/app/data/modal/test_series/random_question_testseries.dart';
import 'package:exam_prep_tool/app/data/modal/test_series/submit_testseries_modal.dart';
import 'package:exam_prep_tool/app/data/modal/test_series/view_answerdetail_page_modal.dart';
import 'package:exam_prep_tool/app/data/modal/test_series/weekley_testSeries_modal.dart';
import 'package:exam_prep_tool/app/data/params/updateProfile_params.dart';
import 'package:exam_prep_tool/app/data/repositry/profile.dart';
import 'package:exam_prep_tool/app/data/repositry/testseries_repo.dart';
import 'package:exam_prep_tool/app/utils/utils.dart';
import 'package:dio/dio.dart';

class TestSeriesRepoIMPL implements TestSeriesRepo {
  @override
  Future<DataState<WeeklyTestseriesModal>> weeklytestseries(
      String subject, String courseid,String userid,String status) async {
    try {
      final httpresponse = await CommonRepository.getApiService()
          .weeklytestseries(subject, courseid,userid,status);
      if (httpresponse.response.statusCode == HttpStatus.ok) {
        //print("profiledata${httpresponse.data.toJson()}");
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
  Future<DataState<RandomQuestionTestseriesModal>> randomqueslist(
      String testId) async {
    try {
      final httpresponse =
          await CommonRepository.getApiService().randomqueslist(testId);
      if (httpresponse.response.statusCode == HttpStatus.ok) {
        //print("profiledata${httpresponse.data.toJson()}");
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
  Future<DataState<SubmitTestseriesModal>> testSeriesAnswer(
      token, submitAnswerparams) async {
    try {
      final httpresponse = await CommonRepository.getApiService()
          .testSeriesAnswer(token, submitAnswerparams);
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

  @override
  Future<DataState<ViewAnswerDetailModal>> viewAnswerdetail(userid, testId)async {
      
    try {
      final httpresponse = await CommonRepository.getApiService()
          .viewAnswerdetail(userid, testId);
      if (httpresponse.response.statusCode == HttpStatus.ok) {
        //  print("Answerdata${httpresponse.data.toJson()}");
        return DataSuccess(httpresponse.data);
        // print(httpresponse.data.toJson());
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
