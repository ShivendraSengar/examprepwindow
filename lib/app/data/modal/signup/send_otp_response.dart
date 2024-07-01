class SendOtpResponse {
  bool? success;
  String? msg;
  String? email;

  SendOtpResponse({this.success, this.msg, this.email});

  factory SendOtpResponse.fromJson(Map<String, dynamic> json) {
    return SendOtpResponse(
      success: json['success'] as bool?,
      msg: json['msg'] as String?,
      email: json['email'] as String?,
    );
  }

  Map<String, dynamic> toJson() => {
        'success': success,
        'msg': msg,
        'email': email,
      };
}
