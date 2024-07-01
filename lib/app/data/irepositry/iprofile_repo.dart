import 'dart:io';

import 'package:exam_prep_tool/app/data/modal/profile/edit_profile.dart';
import 'package:exam_prep_tool/app/data/modal/profile/profile_updated.dart';
import 'package:exam_prep_tool/app/data/params/updateProfile_params.dart';
import 'package:exam_prep_tool/app/data/repositry/profile.dart';
import 'package:exam_prep_tool/app/utils/utils.dart';
import 'package:dio/dio.dart';

class EditProfileImpl implements EditProfileRepo {
  @override
  Future<DataState<EditProfile>> editUser(String userId, String token) async {
    try {
      final httpresponse =
          await CommonRepository.getApiService().editUser(userId, token);
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
  Future<DataState<ProfileUpdated>> updateProfile(
      UpdateProfileParams params, String token) async {
    try {
      final httpresponse =
          await CommonRepository.getApiService().updateProfile(params, token);
      if (httpresponse.response.statusCode == HttpStatus.ok) {
        return DataSuccess(httpresponse.data);
      }
      return DataFailed(DioError(
          requestOptions: httpresponse.response.requestOptions,
          type: DioErrorType.cancel,
          response: httpresponse.response,
          error: httpresponse.response.statusMessage));
    } on DioError catch (e) {
      return DataFailed(e);
    }
  }
}
