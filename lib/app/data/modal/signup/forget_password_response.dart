class ForgetpasswordResponse {
  int? code;
  bool? success;
  String? message;

  ForgetpasswordResponse({this.code, this.success, this.message});

  factory ForgetpasswordResponse.fromJson(Map<String, dynamic> json) {
    return ForgetpasswordResponse(
      code: json['code'] as int?,
      success: json['success'] as bool?,
      message: json['message'] as String?,
    );
  }

  Map<String, dynamic> toJson() => {
        'code': code,
        'success': success,
        'message': message,
      };
}
