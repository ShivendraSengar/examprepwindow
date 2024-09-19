
import 'dart:convert';

VidioLecturesresponse vidioLecturesresponseFromJson(String str) =>
    VidioLecturesresponse.fromJson(json.decode(str));

String vidioLecturesresponseToJson(VidioLecturesresponse data) =>
    json.encode(data.toJson());

class VidioLecturesresponse {
  int? code;
  bool? success;
  String? message;
  List<Vidio>? data;

  VidioLecturesresponse({
    this.code,
    this.success,
    this.message,
    this.data,
  });

  factory VidioLecturesresponse.fromJson(Map<String, dynamic> json) =>
      VidioLecturesresponse(
        code: json["code"],
        success: json["success"],
        message: json["message"],
        data: json["data"] == null
            ? []
            : List<Vidio>.from(json["data"]!.map((x) => Vidio.fromJson(x))),
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

class Vidio {
  String? id;
  Branch? branch;
  List<Exam>? exam;
  String? subject;
  String? title;
  String? description;
  List<UploadId>? uploadId;
  String? uploadType;
  DateTime? createdAt;
  DateTime? updatedAt;
  int? v;

  Vidio({
    this.id,
    this.branch,
    this.exam,
    this.subject,
    this.title,
    this.description,
    this.uploadId,
    this.uploadType,
    this.createdAt,
    this.updatedAt,
    this.v,
  });

  factory Vidio.fromJson(Map<String, dynamic> json) => Vidio(
        id: json["_id"],
        branch: json["branch"] == null ? null : Branch.fromJson(json["branch"]),
        exam: json["exam"] == null
            ? []
            : List<Exam>.from(json["exam"]!.map((x) => Exam.fromJson(x))),
        subject: json["subject"],
        title: json["title"],
        description: json["description"],
        uploadId: json["uploadId"] == null
            ? []
            : List<UploadId>.from(
                json["uploadId"]!.map((x) => UploadId.fromJson(x))),
        uploadType: json["uploadType"],
        createdAt: json["createdAt"] == null
            ? null
            : DateTime.parse(json["createdAt"]),
        updatedAt: json["updatedAt"] == null
            ? null
            : DateTime.parse(json["updatedAt"]),
        v: json["__v"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "branch": branch?.toJson(),
        "exam": exam == null
            ? []
            : List<dynamic>.from(exam!.map((x) => x.toJson())),
        "subject": subject,
        "title": title,
        "description": description,
        "uploadId": uploadId == null
            ? []
            : List<dynamic>.from(uploadId!.map((x) => x.toJson())),
        "uploadType": uploadType,
        "createdAt": createdAt?.toIso8601String(),
        "updatedAt": updatedAt?.toIso8601String(),
        "__v": v,
      };
}

class Branch {
  String? id;
  String? branch;
  DateTime? createdAt;
  DateTime? updatedAt;
  int? v;

  Branch({
    this.id,
    this.branch,
    this.createdAt,
    this.updatedAt,
    this.v,
  });

  factory Branch.fromJson(Map<String, dynamic> json) => Branch(
        id: json["_id"],
        branch: json["branch"],
        createdAt: json["createdAt"] == null
            ? null
            : DateTime.parse(json["createdAt"]),
        updatedAt: json["updatedAt"] == null
            ? null
            : DateTime.parse(json["updatedAt"]),
        v: json["__v"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "branch": branch,
        "createdAt": createdAt?.toIso8601String(),
        "updatedAt": updatedAt?.toIso8601String(),
        "__v": v,
      };
}

class Exam {
  String? id;
  String? exam;
  List<String>? subjects;
  String? branch;
  DateTime? createdAt;
  DateTime? updatedAt;
  int? v;

  Exam({
    this.id,
    this.exam,
    this.subjects,
    this.branch,
    this.createdAt,
    this.updatedAt,
    this.v,
  });

  factory Exam.fromJson(Map<String, dynamic> json) => Exam(
        id: json["_id"],
        exam: json["exam"],
        subjects: json["subjects"] == null
            ? []
            : List<String>.from(json["subjects"]!.map((x) => x)),
        branch: json["branch"],
        createdAt: json["createdAt"] == null
            ? null
            : DateTime.parse(json["createdAt"]),
        updatedAt: json["updatedAt"] == null
            ? null
            : DateTime.parse(json["updatedAt"]),
        v: json["__v"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "exam": exam,
        "subjects":
            subjects == null ? [] : List<dynamic>.from(subjects!.map((x) => x)),
        "branch": branch,
        "createdAt": createdAt?.toIso8601String(),
        "updatedAt": updatedAt?.toIso8601String(),
        "__v": v,
      };
}

class UploadId {
  String? id;
  String? branch;
  String? uploadType;
  FileClass? file;
  DateTime? createdAt;
  DateTime? updatedAt;
  int? v;
  String? description;
  String? paid;

  UploadId({
    this.id,
    this.branch,
    this.uploadType,
    this.file,
    this.createdAt,
    this.updatedAt,
    this.v,
    this.description,
    this.paid,
  });

  factory UploadId.fromJson(Map<String, dynamic> json) => UploadId(
        id: json["_id"],
        branch: json["branch"],
        uploadType: json["uploadType"],
        file: json["file"] == null ? null : FileClass.fromJson(json["file"]),
        createdAt: json["createdAt"] == null
            ? null
            : DateTime.parse(json["createdAt"]),
        updatedAt: json["updatedAt"] == null
            ? null
            : DateTime.parse(json["updatedAt"]),
        v: json["__v"],
        description: json["description"],
        paid: json["paid"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "branch": branch,
        "uploadType": uploadType,
        "file": file?.toJson(),
        "createdAt": createdAt?.toIso8601String(),
        "updatedAt": updatedAt?.toIso8601String(),
        "__v": v,
        "description": description,
        "paid": paid,
      };
}

class FileClass {
  String? name;
  String? description;
  String? size;
  String? type;
  String? url;

  FileClass({
    this.name,
    this.description,
    this.size,
    this.type,
    this.url,
  });

  factory FileClass.fromJson(Map<String, dynamic> json) => FileClass(
        name: json["name"],
        description: json["description"],
        size: json["size"],
        type: json["type"],
        url: json["url"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "description": description,
        "size": size,
        "type": type,
        "url": url,
      };
}
