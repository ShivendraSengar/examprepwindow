class ChangePassword {
  int? code;
  bool? success;
  String? message;

  ChangePassword({this.code, this.success, this.message});

  factory ChangePassword.fromJson(Map<String, dynamic> json) {
    return ChangePassword(
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
