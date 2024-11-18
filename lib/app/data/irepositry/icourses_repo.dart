import 'dart:io';
import 'dart:math';
import 'package:dio/dio.dart';
import 'package:exam_prep_tool/app/data/modal/Referralmodal/account_refferal_modal.dart';
import 'package:exam_prep_tool/app/data/modal/Referralmodal/check_referralcode_modal.dart';
import 'package:exam_prep_tool/app/data/modal/Referralmodal/subscription_referal_modal.dart';
import 'package:exam_prep_tool/app/data/modal/categories_filterdata.dart';
import 'package:exam_prep_tool/app/data/modal/circulam_lists/circulam_modal.dart';
import 'package:exam_prep_tool/app/data/modal/course.dart';
import 'package:exam_prep_tool/app/data/modal/courses_category.dart';
import 'package:exam_prep_tool/app/data/modal/notes_filterlist/notes_fiterlist.dart';
import 'package:exam_prep_tool/app/data/modal/subjectfilterlist/subjectfilter.dart';
// import 'package:exam_prep_tool/app/data/modal/pyqs/twenty_pyq.dart';
// import 'package:exam_prep_tool/app/data/modal/pys_ques.dart';
import 'package:exam_prep_tool/app/data/modal/vidio_lecturesresponse/get_exam_id.dart';
//import 'package:exam_prep_tool/app/data/modal/pys_question/pys_question.dart';
//import 'package:exam_prep_tool/app/data/modal/courses/courses.dart';
import 'package:exam_prep_tool/app/data/modal/vidio_lecturesresponse/vidio_lecturesresponse.dart';
import 'package:exam_prep_tool/app/data/repositry/courses_repo.dart';
import 'package:exam_prep_tool/app/utils/const.dart';

import 'package:exam_prep_tool/app/utils/utils.dart';

class CoursesRepoIml implements CourseRepo {
  @override
  Future<DataState<Courses>> getcourses(String userId, String sortedby) async {
    try {
      final httpresponse =
          await CommonRepository.getApiService().getcourses(userId, sortedby);
      if (httpresponse.response.statusCode == HttpStatus.ok) {
        //print("Response: ${httpresponse.data.toString()}");
        // print("Response More courses: ${httpresponse.data.toJson()}");
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
  Future<DataState<VidioLecturesresponse>> getList(String exam) async {
    try {
      final httpresponse = await CommonRepository.getApiService().getList(
        exam,
      );
      if (httpresponse.response.statusCode == HttpStatus.ok) {
        // print("Response Data: ${httpresponse.data.toJson()}");
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
  Future<DataState<VidioLecturesresponse>> getvidioList(
      String exam, String subject, String uploadType, String sortedby) async {
    try {
      final httpresponse = await CommonRepository.getApiService()
          .getvidioList(exam, subject, uploadType, sortedby);
      if (httpresponse.response.statusCode == HttpStatus.ok) {
        // print("Response Data: ${httpresponse.data.toJson()}");
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
  Future<DataState<GetExamid>> getexamid() async {
    try {
      final httpresponse = await CommonRepository.getApiService().getexamid();
      if (httpresponse.response.statusCode == HttpStatus.ok) {
        // print("Response Data: ${httpresponse.data.toJson()}");
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
  Future<DataState<CoursesCategory>> getCoursescategory(String sortedby) async {
    try {
      final httpresponse =
          await CommonRepository.getApiService().getCoursescategory(sortedby);
      if (httpresponse.response.statusCode == HttpStatus.ok) {
        // print("Response Data: ${httpresponse.data.toJson()}");
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
  Future<DataState<CategoriesFilter>> getFiltercategory(
      String userid, String category) async {
    try {
      final httpresponse = await CommonRepository.getApiService()
          .getFiltercategory(userid, category);
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
  Future<DataState<CirculamModalList>> circulimdatalist(String userid) async {
    try {
      final httpresponse =
          await CommonRepository.getApiService().circulimdatalist(userid);
      if (httpresponse.response.statusCode == HttpStatus.ok) {
        // print("Response: ${httpresponse.data.toString()}");
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
  // accont reffral

  @override
  Future<DataState<AccounteferralModal>> referraldatalist(
      String userid, String token) async {
    try {
      final httpresponse = await CommonRepository.getApiService()
          .referraldatalist(userid, token);

      if (httpresponse.response.statusCode == HttpStatus.ok) {
        // print(httpresponse.data.toJson());
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
  Future<DataState<SubscriptioneferralModal>> subscriptionreferrallist(
      referID, token) async {
    try {
      final httpresponse = await CommonRepository.getApiService()
          .subscriptionreferrallist(referID, token);

      if (httpresponse.response.statusCode == HttpStatus.ok) {
        // print(httpresponse.data.toJson());
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
  Future<DataState<CheckReferralcode>> checkreferrallist(
      referalID, UserId, String token) async {
    try {
      final httpresponse = await CommonRepository.getApiService()
          .checkreferrallist(referalID, UserId, token);

      if (httpresponse.response.statusCode == HttpStatus.ok ||
          httpresponse.response.statusCode == HttpStatus.created) {
        // Print the response data
        print("API Response Data: ${httpresponse.data.toJson()}");
        return DataSuccess(httpresponse.data);
      }
      return DataFailed(DioError(
          requestOptions: httpresponse.response.requestOptions,
          response: httpresponse.response,
          error: httpresponse.response.statusMessage,
          type: DioErrorType.cancel));
    } on DioError catch (e) {
      // Print the DioError
      print("DioError: $e");
      return DataFailed(e);
    }
  }

  @override
  Future<DataState<SubjectfilterlistModal>> getsSubjectfilterlist(
      String sortedby) async {
    try {
      final httpresponse = await CommonRepository.getApiService()
          .getsSubjectfilterlist(sortedby);
      if (httpresponse.response.statusCode == HttpStatus.ok) {
        //print("Response: ${httpresponse.data.toString()}");
        // print("Response More courses: ${httpresponse.data.toJson()}");
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
  Future<DataState<PyqandNotesfilter>> getpyqlist(
      String subject, String uploadType) async {
    try {
      final httpresponse = await CommonRepository.getApiService()
          .getpyqlist(subject, uploadType);
      if (httpresponse.response.statusCode == HttpStatus.ok) {
        // print("Response Data: ${httpresponse.data.toJson()}");
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
