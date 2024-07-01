import 'package:exam_prep_tool/app/data/modal/buycourses_modal.dart';
import 'package:exam_prep_tool/app/data/modal/profile/edit_profile.dart';
import 'package:exam_prep_tool/app/data/modal/profile/profile_updated.dart';
import 'package:exam_prep_tool/app/data/params/updateProfile_params.dart';
import 'package:exam_prep_tool/app/utils/utils.dart';

abstract class EditProfileRepo {
  Future<DataState<EditProfile>> editUser(String userId, String token);
  Future<DataState<ProfileUpdated>> updateProfile(
      UpdateProfileParams params, String token);
}
