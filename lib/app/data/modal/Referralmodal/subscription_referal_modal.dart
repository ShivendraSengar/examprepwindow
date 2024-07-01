// To parse this JSON data, do
//
//     final subscriptioneferralModal = subscriptioneferralModalFromJson(jsonString);

import 'dart:convert';

SubscriptioneferralModal subscriptioneferralModalFromJson(String str) =>
    SubscriptioneferralModal.fromJson(json.decode(str));

String subscriptioneferralModalToJson(SubscriptioneferralModal data) =>
    json.encode(data.toJson());

class SubscriptioneferralModal {
  int? code;
  bool? success;
  String? message;
  List<SubReferral>? data;

  SubscriptioneferralModal({
    this.code,
    this.success,
    this.message,
    this.data,
  });

  factory SubscriptioneferralModal.fromJson(Map<String, dynamic> json) =>
      SubscriptioneferralModal(
        code: json["code"],
        success: json["success"],
        message: json["message"],
        data: json["data"] == null
            ? []
            : List<SubReferral>.from(
                json["data"]!.map((x) => SubReferral.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "code": code,
        "success": success,
        "message": message,
        "data": data == null
            ? []
            : List<dynamic>.from(data!.map((x) => x.toJson())),
      };
}

class SubReferral {
  String? id;
  UserId? userId;
  String? active;
  String? name;
  String? referral;
  dynamic referralEarn;
  String? referralTransferred;
  int? amount;
  String? createdAt;

  SubReferral({
    this.id,
    this.userId,
    this.active,
    this.name,
    this.referral,
    this.referralEarn,
    this.referralTransferred,
    this.amount,
    this.createdAt,
  });

  factory SubReferral.fromJson(Map<String, dynamic> json) => SubReferral(
        id: json["_id"],
        userId: json["userId"] == null ? null : UserId.fromJson(json["userId"]),
        active: json["active"],
        name: json["name"],
        referral: json["referral"],
        referralEarn: json["referralEarn"],
        referralTransferred: json["referralTransferred"],
        amount: json["amount"],
        createdAt: json["createdAt"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "userId": userId?.toJson(),
        "active": active,
        "name": name,
        "referral": referral,
        "referralEarn": referralEarn,
        "referralTransferred": referralTransferred,
        "amount": amount,
        "createdAt": createdAt,
      };
}

class UserId {
  String? id;
  String? name;
  String? email;

  UserId({
    this.id,
    this.name,
    this.email,
  });

  factory UserId.fromJson(Map<String, dynamic> json) => UserId(
        id: json["_id"],
        name: json["name"],
        email: json["email"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "name": name,
        "email": email,
      };
}
