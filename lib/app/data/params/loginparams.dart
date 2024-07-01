class Loginparams {
  String? email;
  String? password;

  Loginparams({this.email, this.password});

  factory Loginparams.fromJson(Map<String, dynamic> json) => Loginparams(
        email: json['email'] as String?,
        password: json['password'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'email': email,
        'password': password,
      };
}
