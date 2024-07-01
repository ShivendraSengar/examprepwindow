// To parse this JSON data, do
//
//     final editProfile = editProfileFromJson(jsonString);

import 'dart:convert';

EditProfile editProfileFromJson(String str) => EditProfile.fromJson(json.decode(str));

String editProfileToJson(EditProfile data) => json.encode(data.toJson());

class EditProfile {
    bool? success;
    Data? data;

    EditProfile({
        this.success,
        this.data,
    });

    factory EditProfile.fromJson(Map<String, dynamic> json) => EditProfile(
        success: json["success"],
        data: json["data"] == null ? null : Data.fromJson(json["data"]),
    );

    Map<String, dynamic> toJson() => {
        "success": success,
        "data": data?.toJson(),
    };
}

class Data {
    Account? account;
    Last5Rating? last5Rating;
    Rating? rating;
    String? exam;
    String? branch;
    dynamic languages;
    String? isAvailable;
    String? online;
    String? city;
    dynamic subjects;
    int? groupDoubtSeenCount;
    StudentId? studentId;
    List<dynamic>? usedPromoCodes;
    DateTime? createdAt;
    DateTime? updatedAt;
    int? v;

    Data({
        this.account,
        this.last5Rating,
        this.rating,
        this.exam,
        this.branch,
        this.languages,
        this.isAvailable,
        this.online,
        this.city,
        this.subjects,
        this.groupDoubtSeenCount,
        this.studentId,
        this.usedPromoCodes,
        this.createdAt,
        this.updatedAt,
        this.v,
    });

    factory Data.fromJson(Map<String, dynamic> json) => Data(
        account: json["account"] == null ? null : Account.fromJson(json["account"]),
        last5Rating: json["last5rating"] == null ? null : Last5Rating.fromJson(json["last5rating"]),
        rating: json["rating"] == null ? null : Rating.fromJson(json["rating"]),
        exam: json["exam"],
        branch: json["branch"],
        languages: json["languages"],
        isAvailable: json["isAvailable"],
        online: json["online"],
        city: json["city"],
        subjects: json["subjects"],
        groupDoubtSeenCount: json["groupDoubtSeenCount"],
        studentId: json["studentId"] == null ? null : StudentId.fromJson(json["studentId"]),
        usedPromoCodes: json["usedPromoCodes"] == null ? [] : List<dynamic>.from(json["usedPromoCodes"]!.map((x) => x)),
        createdAt: json["createdAt"] == null ? null : DateTime.parse(json["createdAt"]),
        updatedAt: json["updatedAt"] == null ? null : DateTime.parse(json["updatedAt"]),
        v: json["__v"],
    );

    Map<String, dynamic> toJson() => {
        "account": account?.toJson(),
        "last5rating": last5Rating?.toJson(),
        "rating": rating?.toJson(),
        "exam": exam,
        "branch": branch,
        "languages": languages,
        "isAvailable": isAvailable,
        "online": online,
        "city": city,
        "subjects": subjects,
        "groupDoubtSeenCount": groupDoubtSeenCount,
        "studentId": studentId?.toJson(),
        "usedPromoCodes": usedPromoCodes == null ? [] : List<dynamic>.from(usedPromoCodes!.map((x) => x)),
        "createdAt": createdAt?.toIso8601String(),
        "updatedAt": updatedAt?.toIso8601String(),
        "__v": v,
    };
}

class Account {
    String? name;
    String? accountNumber;
    String? ifsc;

    Account({
        this.name,
        this.accountNumber,
        this.ifsc,
    });

    factory Account.fromJson(Map<String, dynamic> json) => Account(
        name: json["name"],
        accountNumber: json["accountNumber"],
        ifsc: json["ifsc"],
    );

    Map<String, dynamic> toJson() => {
        "name": name,
        "accountNumber": accountNumber,
        "ifsc": ifsc,
    };
}

class Last5Rating {
    List<dynamic>? ratings;
    int? last5RatingAvg;

    Last5Rating({
        this.ratings,
        this.last5RatingAvg,
    });

    factory Last5Rating.fromJson(Map<String, dynamic> json) => Last5Rating(
        ratings: json["ratings"] == null ? [] : List<dynamic>.from(json["ratings"]!.map((x) => x)),
        last5RatingAvg: json["last5ratingAvg"],
    );

    Map<String, dynamic> toJson() => {
        "ratings": ratings == null ? [] : List<dynamic>.from(ratings!.map((x) => x)),
        "last5ratingAvg": last5RatingAvg,
    };
}

class Rating {
    int? currentRating;
    int? ratingCount;

    Rating({
        this.currentRating,
        this.ratingCount,
    });

    factory Rating.fromJson(Map<String, dynamic> json) => Rating(
        currentRating: json["currentRating"],
        ratingCount: json["ratingCount"],
    );

    Map<String, dynamic> toJson() => {
        "currentRating": currentRating,
        "ratingCount": ratingCount,
    };
}

class StudentId {
    Device? device;
    String? photo;
    String? mobile;
    String? userType;
    int? walletAmount;
    String? isVerifiedOtp;
    DateTime? created;
    DateTime? updated;
    String? referral;
    dynamic referredBy;
    String? id;
    String? name;
    String? email;

    StudentId({
        this.device,
        this.photo,
        this.mobile,
        this.userType,
        this.walletAmount,
        this.isVerifiedOtp,
        this.created,
        this.updated,
        this.referral,
        this.referredBy,
        this.id,
        this.name,
        this.email,
    });

    factory StudentId.fromJson(Map<String, dynamic> json) => StudentId(
        device: json["device"] == null ? null : Device.fromJson(json["device"]),
        photo: json["photo"],
        mobile: json["mobile"],
        userType: json["userType"],
        walletAmount: json["walletAmount"],
        isVerifiedOtp: json["isVerifiedOTP"],
        created: json["created"] == null ? null : DateTime.parse(json["created"]),
        updated: json["updated"] == null ? null : DateTime.parse(json["updated"]),
        referral: json["referral"],
        referredBy: json["referredBy"],
        id: json["_id"],
        name: json["name"],
        email: json["email"],
    );

    Map<String, dynamic> toJson() => {
        "device": device?.toJson(),
        "photo": photo,
        "mobile": mobile,
        "userType": userType,
        "walletAmount": walletAmount,
        "isVerifiedOTP": isVerifiedOtp,
        "created": created?.toIso8601String(),
        "updated": updated?.toIso8601String(),
        "referral": referral,
        "referredBy": referredBy,
        "_id": id,
        "name": name,
        "email": email,
    };
}

class Device {
    String? type;
    dynamic deviceId;
    dynamic fcmToken;

    Device({
        this.type,
        this.deviceId,
        this.fcmToken,
    });

    factory Device.fromJson(Map<String, dynamic> json) => Device(
        type: json["type"],
        deviceId: json["deviceId"],
        fcmToken: json["fcmToken"],
    );

    Map<String, dynamic> toJson() => {
        "type": type,
        "deviceId": deviceId,
        "fcmToken": fcmToken,
    };
}
