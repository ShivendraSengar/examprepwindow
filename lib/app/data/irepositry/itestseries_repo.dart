import 'dart:io';

import 'package:exam_prep_tool/app/data/modal/profile/edit_profile.dart';
import 'package:exam_prep_tool/app/data/modal/profile/profile_updated.dart';
import 'package:exam_prep_tool/app/data/modal/test_series/random_question_testseries.dart';
import 'package:exam_prep_tool/app/data/modal/test_series/weekley_testSeries.dart';
import 'package:exam_prep_tool/app/data/params/updateProfile_params.dart';
import 'package:exam_prep_tool/app/data/repositry/profile.dart';
import 'package:exam_prep_tool/app/data/repositry/testseries_repo.dart';
import 'package:exam_prep_tool/app/utils/utils.dart';
import 'package:dio/dio.dart';

class TestSeriesRepoIMPL implements TestSeriesRepo {
  @override
  Future<DataState<WeeklyTestseriesModal>> weeklytestseries(
      String subject, String courseid) async {
    try {
      final httpresponse = await CommonRepository.getApiService()
          .weeklytestseries(subject, courseid);
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
}
