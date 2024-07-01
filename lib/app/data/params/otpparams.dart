class Otpparams {
  String? mobile;
  String? otp;

  Otpparams({this.mobile, this.otp});

  factory Otpparams.fromJson(Map<String, dynamic> json) => Otpparams(
        mobile: json['mobile'] as String?,
        otp: json['otp'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'mobile': mobile,
        'otp': otp,
      };
}
