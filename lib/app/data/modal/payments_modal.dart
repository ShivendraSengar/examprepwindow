// To parse this JSON data, do
//
//     final payments = paymentsFromJson(jsonString);

import 'dart:convert';

Payments paymentsFromJson(String str) => Payments.fromJson(json.decode(str));

String paymentsToJson(Payments data) => json.encode(data.toJson());

class Payments {
  int? code;
  bool? success;
  String? message;
  PaymentsData? data;

  Payments({
    this.code,
    this.success,
    this.message,
    this.data,
  });

  factory Payments.fromJson(Map<String, dynamic> json) => Payments(
        code: json["code"],
        success: json["success"],
        message: json["message"],
        data: json["data"] == null ? null : PaymentsData.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "code": code,
        "success": success,
        "message": message,
        "data": data?.toJson(),
      };
}

class PaymentsData {
  int? amount;
  int? amountDue;
  int? amountPaid;
  int? attempts;
  int? createdAt;
  String? currency;
  String? entity;
  String? id;
  List<String>? notes;
  dynamic offerId;
  String? receipt;
  String? status;

  PaymentsData({
    this.amount,
    this.amountDue,
    this.amountPaid,
    this.attempts,
    this.createdAt,
    this.currency,
    this.entity,
    this.id,
    this.notes,
    this.offerId,
    this.receipt,
    this.status,
  });

  factory PaymentsData.fromJson(Map<String, dynamic> json) => PaymentsData(
        amount: json["amount"],
        amountDue: json["amount_due"],
        amountPaid: json["amount_paid"],
        attempts: json["attempts"],
        createdAt: json["created_at"],
        currency: json["currency"],
        entity: json["entity"],
        id: json["id"],
        notes: json["notes"] == null
            ? []
            : List<String>.from(json["notes"]!.map((x) => x)),
        offerId: json["offer_id"],
        receipt: json["receipt"],
        status: json["status"],
      );

  Map<String, dynamic> toJson() => {
        "amount": amount,
        "amount_due": amountDue,
        "amount_paid": amountPaid,
        "attempts": attempts,
        "created_at": createdAt,
        "currency": currency,
        "entity": entity,
        "id": id,
        "notes": notes == null ? [] : List<dynamic>.from(notes!.map((x) => x)),
        "offer_id": offerId,
        "receipt": receipt,
        "status": status,
      };
}
