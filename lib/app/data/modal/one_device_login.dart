// To parse this JSON data, do
//
//     final checkToken = checkTokenFromJson(jsonString);

import 'dart:convert';

CheckToken checkTokenFromJson(String str) => CheckToken.fromJson(json.decode(str));

String checkTokenToJson(CheckToken data) => json.encode(data.toJson());

class CheckToken {
    int? code;
    bool? success;
    String? message;

    CheckToken({
        this.code,
        this.success,
        this.message,
    });

    factory CheckToken.fromJson(Map<String, dynamic> json) => CheckToken(
        code: json["code"],
        success: json["success"],
        message: json["message"],
    );

    Map<String, dynamic> toJson() => {
        "code": code,
        "success": success,
        "message": message,
    };
}
