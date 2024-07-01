import 'data.dart';

class LoginResponse {
  bool? success;
  String? msg;
  Data? data;
  int? maxConnectingTime;

  LoginResponse({
    this.success,
    this.msg,
    this.data,
    this.maxConnectingTime,
  });

  factory LoginResponse.fromJson(Map<String, dynamic> json) => LoginResponse(
        success: json['success'] as bool?,
        msg: json['msg'] as String?,
        data: json['data'] == null
            ? null
            : Data.fromJson(json['data'] as Map<String, dynamic>),
        maxConnectingTime: json['maxConnectingTime'] as int?,
      );

  Map<String, dynamic> toJson() => {
        'success': success,
        'msg': msg,
        'data': data?.toJson(),
        'maxConnectingTime': maxConnectingTime,
      };
}
