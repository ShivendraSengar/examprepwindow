// To parse this JSON data, do
//
//     final checkReferralcode = checkReferralcodeFromJson(jsonString);

import 'dart:convert';

CheckReferralcode checkReferralcodeFromJson(String str) => CheckReferralcode.fromJson(json.decode(str));

String checkReferralcodeToJson(CheckReferralcode data) => json.encode(data.toJson());

class CheckReferralcode {
    int? code;
    bool? success;
    String? message;
    List<CheckReferaldata>? data;

    CheckReferralcode({
        this.code,
        this.success,
        this.message,
        this.data,
    });

    factory CheckReferralcode.fromJson(Map<String, dynamic> json) => CheckReferralcode(
        code: json["code"],
        success: json["success"],
        message: json["message"],
        data: json["data"] == null ? [] : List<CheckReferaldata>.from(json["data"]!.map((x) => CheckReferaldata.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "code": code,
        "success": success,
        "message": message,
        "data": data == null ? [] : List<dynamic>.from(data!.map((x) => x.toJson())),
    };
}

class CheckReferaldata {
    String? mobile;
    String? referral;
    String? id;
    String? name;
    String? email;
    DateTime? createdAt;
    int? referralDiscount;

    CheckReferaldata({
        this.mobile,
        this.referral,
        this.id,
        this.name,
        this.email,
        this.createdAt,
        this.referralDiscount,
    });

    factory CheckReferaldata.fromJson(Map<String, dynamic> json) => CheckReferaldata(
        mobile: json["mobile"],
        referral: json["referral"],
        id: json["_id"],
        name: json["name"],
        email: json["email"],
        createdAt: json["createdAt"] == null ? null : DateTime.parse(json["createdAt"]),
        referralDiscount: json["referralDiscount"],
    );

    Map<String, dynamic> toJson() => {
        "mobile": mobile,
        "referral": referral,
        "_id": id,
        "name": name,
        "email": email,
        "createdAt": createdAt?.toIso8601String(),
        "referralDiscount": referralDiscount,
    };
}
