class Paramspayments {
  String? amount;
  String? courseId;
  String? currency;
  String? notes;
  String? type;
  String? userId;

  Paramspayments({
    this.amount,
    this.courseId,
    this.currency,
    this.notes,
    this.type,
    this.userId,
  });

  factory Paramspayments.fromJson(Map<String, dynamic> json) {
    return Paramspayments(
      amount: json['amount'] as String?,
      courseId: json['courseId'] as String?,
      currency: json['currency'] as String?,
      notes: json['notes'] as String?,
      type: json['type'] as String?,
      userId: json['userId'] as String?,
    );
  }

  Map<String, dynamic> toJson() => {
        'amount': amount,
        'courseId': courseId,
        'currency': currency,
        'notes': notes,
        'type': type,
        'userId': userId,
      };
}
