// To parse this JSON data, do
//
//     final submitTestseriesModal = submitTestseriesModalFromJson(jsonString);

import 'dart:convert';

SubmitTestseriesModal submitTestseriesModalFromJson(String str) =>
    SubmitTestseriesModal.fromJson(json.decode(str));

String submitTestseriesModalToJson(SubmitTestseriesModal data) =>
    json.encode(data.toJson());

class SubmitTestseriesModal {
  int? code;
  bool? success;
  String? message;

  SubmitTestseriesModal({
    this.code,
    this.success,
    this.message,
  });

  factory SubmitTestseriesModal.fromJson(Map<String, dynamic> json) =>
      SubmitTestseriesModal(
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
