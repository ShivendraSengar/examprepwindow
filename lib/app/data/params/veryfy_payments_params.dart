class VeryfyPaymentsParams {
  String? razorpayPaymentId;
  String? razorpayOrderId;
  String? userId;
  String? durationInMonths;
  String? courseId;
  String? razorpaySignature;
  String? mode;
  String? courseType;

  VeryfyPaymentsParams({
    this.razorpayPaymentId,
    this.razorpayOrderId,
    this.userId,
    this.durationInMonths,
    this.courseId,
    this.razorpaySignature,
    this.mode,
    this.courseType,
  });

  factory VeryfyPaymentsParams.fromJson(Map<String, dynamic> json) {
    return VeryfyPaymentsParams(
      razorpayPaymentId: json['razorpay_payment_id'] as String?,
      razorpayOrderId: json['razorpay_order_id'] as String?,
      userId: json['userId'] as String?,
      durationInMonths: json['durationInMonths'] as String?,
      courseId: json['courseId'] as String?,
      razorpaySignature: json['razorpay_signature'] as String?,
      mode: json['mode'] as String?,
      courseType: json['courseType'] as String?,
    );
  }

  Map<String, dynamic> toJson() => {
        'razorpay_payment_id': razorpayPaymentId,
        'razorpay_order_id': razorpayOrderId,
        'userId': userId,
        'durationInMonths': durationInMonths,
        'courseId': courseId,
        'razorpay_signature': razorpaySignature,
        'mode': mode,
        'courseType': courseType,
      };
}
