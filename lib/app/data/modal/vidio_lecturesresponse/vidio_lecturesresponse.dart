// import 'dart:convert';

// VidioLecturesresponse vidioLecturesresponseFromJson(String str) =>
//     VidioLecturesresponse.fromJson(json.decode(str));

// String vidioLecturesresponseToJson(VidioLecturesresponse data) =>
//     json.encode(data.toJson());

// class VidioLecturesresponse {
//   int? code;
//   bool? success;
//   String? message;
//   List<Vidio>? data;

//   VidioLecturesresponse({
//     this.code,
//     this.success,
//     this.message,
//     this.data,
//   });

//   VidioLecturesresponse copyWith({
//     int? code,
//     bool? success,
//     String? message,
//     List<Vidio>? data,
//   }) =>
//       VidioLecturesresponse(
//         code: code ?? this.code,
//         success: success ?? this.success,
//         message: message ?? this.message,
//         data: data ?? this.data,
//       );

//   factory VidioLecturesresponse.fromJson(Map<String, dynamic> json) =>
//       VidioLecturesresponse(
//         code: json["code"],
//         success: json["success"],
//         message: json["message"],
//         data: json["data"] == null
//             ? []
//             : List<Vidio>.from(json["data"]!.map((x) => Vidio.fromJson(x))),
//       );

//   Map<String, dynamic> toJson() => {
//         "code": code,
//         "success": success,
//         "message": message,
//         "data": data == null
//             ? []
//             : List<dynamic>.from(data!.map((x) => x.toJson())),
//       };
// }

// class Vidio {
//   String? id;
//   Branch? branch;
//   Exam? exam;
//   String? subject;
//   String? title;
//   String? description;
//   String? uploadType;
//   DateTime? createdAt;
//   DateTime? updatedAt;
//   int? v;
//   List<UploadId>? uploadId;

//   Vidio({
//     this.id,
//     this.branch,
//     this.exam,
//     this.subject,
//     this.title,
//     this.description,
//     this.uploadType,
//     this.createdAt,
//     this.updatedAt,
//     this.v,
//     this.uploadId,
//   });

//   Vidio copyWith({
//     String? id,
//     Branch? branch,
//     Exam? exam,
//     String? subject,
//     String? title,
//     String? description,
//     String? uploadType,
//     DateTime? createdAt,
//     DateTime? updatedAt,
//     int? v,
//     List<UploadId>? uploadId,
//   }) =>
//       Vidio(
//         id: id ?? this.id,
//         branch: branch ?? this.branch,
//         exam: exam ?? this.exam,
//         subject: subject ?? this.subject,
//         title: title ?? this.title,
//         description: description ?? this.description,
//         uploadType: uploadType ?? this.uploadType,
//         createdAt: createdAt ?? this.createdAt,
//         updatedAt: updatedAt ?? this.updatedAt,
//         v: v ?? this.v,
//         uploadId: uploadId ?? this.uploadId,
//       );

//   factory Vidio.fromJson(Map<String, dynamic> json) => Vidio(
//         id: json["_id"],
//         branch: json["branch"] == null ? null : Branch.fromJson(json["branch"]),
//         exam: json["exam"] == null ? null : Exam.fromJson(json["exam"]),
//         subject: json["subject"],
//         title: json["title"],
//         description: json["description"],
//         uploadType: json["uploadType"],
//         createdAt: json["createdAt"] == null
//             ? null
//             : DateTime.parse(json["createdAt"]),
//         updatedAt: json["updatedAt"] == null
//             ? null
//             : DateTime.parse(json["updatedAt"]),
//         v: json["__v"],
//         uploadId: json["uploadId"] == null
//             ? []
//             : List<UploadId>.from(
//                 json["uploadId"]!.map((x) => UploadId.fromJson(x))),
//       );

//   Map<String, dynamic> toJson() => {
//         "_id": id,
//         "branch": branch?.toJson(),
//         "exam": exam?.toJson(),
//         "subject": subject,
//         "title": title,
//         "description": description,
//         "uploadType": uploadType,
//         "createdAt": createdAt?.toIso8601String(),
//         "updatedAt": updatedAt?.toIso8601String(),
//         "__v": v,
//         "uploadId": uploadId == null
//             ? []
//             : List<dynamic>.from(uploadId!.map((x) => x.toJson())),
//       };
// }

// class Branch {
//   String? id;
//   String? branch;
//   DateTime? createdAt;
//   DateTime? updatedAt;
//   int? v;

//   Branch({
//     this.id,
//     this.branch,
//     this.createdAt,
//     this.updatedAt,
//     this.v,
//   });

//   Branch copyWith({
//     String? id,
//     String? branch,
//     DateTime? createdAt,
//     DateTime? updatedAt,
//     int? v,
//   }) =>
//       Branch(
//         id: id ?? this.id,
//         branch: branch ?? this.branch,
//         createdAt: createdAt ?? this.createdAt,
//         updatedAt: updatedAt ?? this.updatedAt,
//         v: v ?? this.v,
//       );

//   factory Branch.fromJson(Map<String, dynamic> json) => Branch(
//         id: json["_id"],
//         branch: json["branch"],
//         createdAt: json["createdAt"] == null
//             ? null
//             : DateTime.parse(json["createdAt"]),
//         updatedAt: json["updatedAt"] == null
//             ? null
//             : DateTime.parse(json["updatedAt"]),
//         v: json["__v"],
//       );

//   Map<String, dynamic> toJson() => {
//         "_id": id,
//         "branch": branch,
//         "createdAt": createdAt?.toIso8601String(),
//         "updatedAt": updatedAt?.toIso8601String(),
//         "__v": v,
//       };
// }

// class Exam {
//   String? id;
//   String? exam;
//   List<String>? subjects;
//   String? branch;
//   DateTime? createdAt;
//   DateTime? updatedAt;
//   int? v;

//   Exam({
//     this.id,
//     this.exam,
//     this.subjects,
//     this.branch,
//     this.createdAt,
//     this.updatedAt,
//     this.v,
//   });

//   Exam copyWith({
//     String? id,
//     String? exam,
//     List<String>? subjects,
//     String? branch,
//     DateTime? createdAt,
//     DateTime? updatedAt,
//     int? v,
//   }) =>
//       Exam(
//         id: id ?? this.id,
//         exam: exam ?? this.exam,
//         subjects: subjects ?? this.subjects,
//         branch: branch ?? this.branch,
//         createdAt: createdAt ?? this.createdAt,
//         updatedAt: updatedAt ?? this.updatedAt,
//         v: v ?? this.v,
//       );

//   factory Exam.fromJson(Map<String, dynamic> json) => Exam(
//         id: json["_id"],
//         exam: json["exam"],
//         subjects: json["subjects"] == null
//             ? []
//             : List<String>.from(json["subjects"]!.map((x) => x)),
//         branch: json["branch"],
//         createdAt: json["createdAt"] == null
//             ? null
//             : DateTime.parse(json["createdAt"]),
//         updatedAt: json["updatedAt"] == null
//             ? null
//             : DateTime.parse(json["updatedAt"]),
//         v: json["__v"],
//       );

//   Map<String, dynamic> toJson() => {
//         "_id": id,
//         "exam": exam,
//         "subjects":
//             subjects == null ? [] : List<dynamic>.from(subjects!.map((x) => x)),
//         "branch": branch,
//         "createdAt": createdAt?.toIso8601String(),
//         "updatedAt": updatedAt?.toIso8601String(),
//         "__v": v,
//       };
// }

// class UploadId {
//   String? id;
//   String? branch;
//   String? uploadType;
//   FileClass? file;
//   DateTime? createdAt;
//   DateTime? updatedAt;
//   int? v;
//   String? description;

//   UploadId({
//     this.id,
//     this.branch,
//     this.uploadType,
//     this.file,
//     this.createdAt,
//     this.updatedAt,
//     this.v,
//     this.description,
//   });

//   UploadId copyWith({
//     String? id,
//     String? branch,
//     String? uploadType,
//     FileClass? file,
//     DateTime? createdAt,
//     DateTime? updatedAt,
//     int? v,
//     String? description,
//   }) =>
//       UploadId(
//         id: id ?? this.id,
//         branch: branch ?? this.branch,
//         uploadType: uploadType ?? this.uploadType,
//         file: file ?? this.file,
//         createdAt: createdAt ?? this.createdAt,
//         updatedAt: updatedAt ?? this.updatedAt,
//         v: v ?? this.v,
//         description: description ?? this.description,
//       );

//   factory UploadId.fromJson(Map<String, dynamic> json) => UploadId(
//         id: json["_id"],
//         branch: json["branch"],
//         uploadType: json["uploadType"],
//         file: json["file"] == null ? null : FileClass.fromJson(json["file"]),
//         createdAt: json["createdAt"] == null
//             ? null
//             : DateTime.parse(json["createdAt"]),
//         updatedAt: json["updatedAt"] == null
//             ? null
//             : DateTime.parse(json["updatedAt"]),
//         v: json["__v"],
//         description: json["description"],
//       );

//   Map<String, dynamic> toJson() => {
//         "_id": id,
//         "branch": branch,
//         "uploadType": uploadType,
//         "file": file?.toJson(),
//         "createdAt": createdAt?.toIso8601String(),
//         "updatedAt": updatedAt?.toIso8601String(),
//         "__v": v,
//         "description": description,
//       };
// }

// class FileClass {
//   String? name;
//   String? description;
//   String? type;
//   String? url;

//   FileClass({
//     this.name,
//     this.description,
//     this.type,
//     this.url,
//   });

//   FileClass copyWith({
//     String? name,
//     String? description,
//     String? type,
//     String? url,
//   }) =>
//       FileClass(
//         name: name ?? this.name,
//         description: description ?? this.description,
//         type: type ?? this.type,
//         url: url ?? this.url,
//       );

//   factory FileClass.fromJson(Map<String, dynamic> json) => FileClass(
//         name: json["name"],
//         description: json["description"],
//         type: json["type"],
//         url: json["url"],
//       );

//   Map<String, dynamic> toJson() => {
//         "name": name,
//         "description": description,
//         "type": type,
//         "url": url,
//       };
// }

// To parse this JSON data, do
//
//     final vidioLecturesresponse = vidioLecturesresponseFromJson(jsonString);

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
