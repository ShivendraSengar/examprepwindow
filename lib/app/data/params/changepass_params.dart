class ChangepassParams {
  String? password;
  String? email;
  String? newPassword;
  String? reNewpassword;

  ChangepassParams({
    this.password,
    this.email,
    this.newPassword,
    this.reNewpassword,
  });

  factory ChangepassParams.fromJson(Map<String, dynamic> json) {
    return ChangepassParams(
      password: json['password'] as String?,
      email: json['email'] as String?,
      newPassword: json['newPassword'] as String?,
      reNewpassword: json['reNewpassword'] as String?,
    );
  }

  Map<String, dynamic> toJson() => {
        'password': password,
        'email': email,
        'newPassword': newPassword,
        'reNewpassword': reNewpassword,
      };
}
