// To parse this JSON data, do
//
//     final AccounteferralModal = AccounteferralModalFromJson(jsonString);

import 'dart:convert';

AccounteferralModal AccounteferralModalFromJson(String str) => AccounteferralModal.fromJson(json.decode(str));

String AccounteferralModalToJson(AccounteferralModal data) => json.encode(data.toJson());

class AccounteferralModal {
    int? code;
    bool? success;
    String? message;
    List<Referral>? data;

    AccounteferralModal({
        this.code,
        this.success,
        this.message,
        this.data,
    });

    factory AccounteferralModal.fromJson(Map<String, dynamic> json) => AccounteferralModal(
        code: json["code"],
        success: json["success"],
        message: json["message"],
        data: json["data"] == null ? [] : List<Referral>.from(json["data"]!.map((x) => Referral.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "code": code,
        "success": success,
        "message": message,
        "data": data == null ? [] : List<dynamic>.from(data!.map((x) => x.toJson())),
    };
}

class Referral {
    String? mobile;
    String? id;
    String? name;
    String? email;
    DateTime? createdAt;

    Referral({
        this.mobile,
        this.id,
        this.name,
        this.email,
        this.createdAt,
    });

    factory Referral.fromJson(Map<String, dynamic> json) => Referral(
        mobile: json["mobile"],
        id: json["_id"],
        name: json["name"],
        email: json["email"],
        createdAt: json["createdAt"] == null ? null : DateTime.parse(json["createdAt"]),
    );

    Map<String, dynamic> toJson() => {
        "mobile": mobile,
        "_id": id,
        "name": name,
        "email": email,
        "createdAt": createdAt?.toIso8601String(),
    };
}
