class SendOtpParams {
  String? email;

  SendOtpParams({
    this.email,
  });

  factory SendOtpParams.fromJson(Map<String, dynamic> json) {
    return SendOtpParams(
      email: json['email'] as String?,
    );
  }

  Map<String, dynamic> toJson() => {
        'email': email,
      };
}
