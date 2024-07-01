// To parse this JSON data, do
//
//     final livechnalelist = livechnalelistFromJson(jsonString);

import 'dart:convert';

Livechnalelist livechnalelistFromJson(String str) =>
    Livechnalelist.fromJson(json.decode(str));

String livechnalelistToJson(Livechnalelist data) => json.encode(data.toJson());

class Livechnalelist {
  int? code;
  bool? success;
  String? message;
  List<LetctureDetails>? data;

  Livechnalelist({
    this.code,
    this.success,
    this.message,
    this.data,
  });

  factory Livechnalelist.fromJson(Map<String, dynamic> json) => Livechnalelist(
        code: json["code"],
        success: json["success"],
        message: json["message"],
        data: json["data"] == null
            ? []
            : List<LetctureDetails>.from(
                json["data"]!.map((x) => LetctureDetails.fromJson(x))),
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

class LetctureDetails {
  MeetData? meetData;
  TimeData? timeData;
  List<CourseId>? courseId;
  String? subject;
  String? title;
  String? description;
  String? channelName;
  String? token;
  String? type;
  String? meetUrl;
  String? status;
  String? endByAdmin;
  String? id;
  DateTime? createdAt;
  DateTime? updatedAt;
  int? v;

  LetctureDetails({
    this.meetData,
    this.timeData,
    this.courseId,
    this.subject,
    this.title,
    this.description,
    this.channelName,
    this.token,
    this.type,
    this.meetUrl,
    this.status,
    this.endByAdmin,
    this.id,
    this.createdAt,
    this.updatedAt,
    this.v,
  });

  factory LetctureDetails.fromJson(Map<String, dynamic> json) =>
      LetctureDetails(
        meetData: json["meetData"] == null
            ? null
            : MeetData.fromJson(json["meetData"]),
        timeData: json["timeData"] == null
            ? null
            : TimeData.fromJson(json["timeData"]),
        courseId: json["courseId"] == null
            ? []
            : List<CourseId>.from(
                json["courseId"]!.map((x) => CourseId.fromJson(x))),
        subject: json["subject"],
        title: json["title"],
        description: json["description"],
        channelName: json["channelName"],
        token: json["token"],
        type: json["type"],
        meetUrl: json["meetUrl"],
        status: json["status"],
        endByAdmin: json["endByAdmin"],
        id: json["_id"],
        createdAt: json["createdAt"] == null
            ? null
            : DateTime.parse(json["createdAt"]),
        updatedAt: json["updatedAt"] == null
            ? null
            : DateTime.parse(json["updatedAt"]),
        v: json["__v"],
      );

  Map<String, dynamic> toJson() => {
        "meetData": meetData?.toJson(),
        "timeData": timeData?.toJson(),
        "courseId": courseId == null
            ? []
            : List<dynamic>.from(courseId!.map((x) => x.toJson())),
        "subject": subject,
        "title": title,
        "description": description,
        "channelName": channelName,
        "token": token,
        "type": type,
        "meetUrl": meetUrl,
        "status": status,
        "endByAdmin": endByAdmin,
        "_id": id,
        "createdAt": createdAt?.toIso8601String(),
        "updatedAt": updatedAt?.toIso8601String(),
        "__v": v,
      };
}

class CourseId {
  String? title;
  String? id;

  CourseId({
    this.title,
    this.id,
  });

  factory CourseId.fromJson(Map<String, dynamic> json) => CourseId(
        title: json["title"],
        id: json["_id"],
      );

  Map<String, dynamic> toJson() => {
        "title": title,
        "_id": id,
      };
}

class MeetData {
  String? jwtToken;
  String? meetingId;
  String? purpose;
  String? duration;
  String? password;

  MeetData({
    this.jwtToken,
    this.meetingId,
    this.purpose,
    this.duration,
    this.password,
  });

  factory MeetData.fromJson(Map<String, dynamic> json) => MeetData(
        jwtToken: json["jwtToken"],
        meetingId: json["meetingId"],
        purpose: json["purpose"],
        duration: json["duration"],
        password: json["password"],
      );

  Map<String, dynamic> toJson() => {
        "jwtToken": jwtToken,
        "meetingId": meetingId,
        "purpose": purpose,
        "duration": duration,
        "password": password,
      };
}

class TimeData {
  String? rawStartDate;
  DateTime? startTimeString;
  DateTime? endTimeString;
  int? duration;

  TimeData({
    this.rawStartDate,
    this.startTimeString,
    this.endTimeString,
    this.duration,
  });

  factory TimeData.fromJson(Map<String, dynamic> json) => TimeData(
        rawStartDate: json["rawStartDate"],
        startTimeString: json["startTimeString"] == null
            ? null
            : DateTime.parse(json["startTimeString"]),
        endTimeString: json["endTimeString"] == null
            ? null
            : DateTime.parse(json["endTimeString"]),
        duration: json["duration"],
      );

  Map<String, dynamic> toJson() => {
        "rawStartDate": rawStartDate,
        "startTimeString": startTimeString?.toIso8601String(),
        "endTimeString": endTimeString?.toIso8601String(),
        "duration": duration,
      };
}
