class SignupResponse {
  bool? success;
  String? msg;
  String? phone;
  String? email;
  String? accountVerified;

  SignupResponse({
    this.success,
    this.msg,
    this.phone,
    this.email,
    this.accountVerified,
  });

  factory SignupResponse.fromJson(Map<String, dynamic> json) {
    return SignupResponse(
      success: json['success'] as bool?,
      msg: json['msg'] as String?,
      phone: json['phone'] as String?,
      email: json['email'] as String?,
      accountVerified: json['accountVerified'] as String?,
    );
  }

  Map<String, dynamic> toJson() => {
        'success': success,
        'msg': msg,
        'phone': phone,
        'email': email,
        'accountVerified': accountVerified,
      };
}
