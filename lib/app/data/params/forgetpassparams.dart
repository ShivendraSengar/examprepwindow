class Forgetpassparams {
  String? otp;
  String? newPassword;
  String? confirmPassword;
  String? email;

  Forgetpassparams(
      {this.otp, this.newPassword, this.confirmPassword, this.email});

  factory Forgetpassparams.fromJson(Map<String, dynamic> json) {
    return Forgetpassparams(
      otp: json['otp'] as String?,
      newPassword: json['newPassword'] as String?,
      confirmPassword: json['confirmPassword'] as String?,
      email: json['email'] as String?,
    );
  }

  Map<String, dynamic> toJson() => {
        'otp': otp,
        'newPassword': newPassword,
        'confirmPassword': confirmPassword,
        'email': email
      };
}
