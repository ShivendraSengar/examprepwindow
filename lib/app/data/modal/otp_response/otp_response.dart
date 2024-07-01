import 'user_data.dart';

class OtpResponse {
  bool? success;
  String? msg;
  UserData? userData;

  OtpResponse({this.success, this.msg, this.userData});

  factory OtpResponse.fromJson(Map<String, dynamic> json) => OtpResponse(
        success: json['success'] as bool?,
        msg: json['msg'] as String?,
        userData: json['userData'] == null
            ? null
            : UserData.fromJson(json['userData'] as Map<String, dynamic>),
      );

  Map<String, dynamic> toJson() => {
        'success': success,
        'msg': msg,
        'userData': userData?.toJson(),
      };
}
