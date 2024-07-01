class SignupParams {
  String? email;
  String? mobile;
  String? name;
  String? password;
  String? referral;

  SignupParams(
      {this.email, this.mobile, this.name, this.password, this.referral});

  factory SignupParams.fromJson(Map<String, dynamic> json) => SignupParams(
        email: json['email'] as String?,
        mobile: json['mobile'] as String?,
        name: json['name'] as String?,
        password: json['password'] as String?,
        referral: json["referral"],
      );

  Map<String, dynamic> toJson() => {
        'email': email,
        'mobile': mobile,
        'name': name,
        'password': password,
        "referral": referral,
      };
}
