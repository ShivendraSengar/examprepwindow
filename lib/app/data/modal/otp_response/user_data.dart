class UserData {
  String? email;
  String? mobile;
  String? token;

  UserData({this.email, this.mobile, this.token});

  factory UserData.fromJson(Map<String, dynamic> json) => UserData(
        email: json['email'] as String?,
        mobile: json['mobile'] as String?,
        token: json['token'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'email': email,
        'mobile': mobile,
        'token': token,
      };
}
