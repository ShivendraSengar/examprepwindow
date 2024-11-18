// To parse this JSON data, do
//
//     final pyqandNotesfilter = pyqandNotesfilterFromJson(jsonString);

import 'dart:convert';

PyqandNotesfilter pyqandNotesfilterFromJson(String str) => PyqandNotesfilter.fromJson(json.decode(str));

String pyqandNotesfilterToJson(PyqandNotesfilter data) => json.encode(data.toJson());

class PyqandNotesfilter {
    int? code;
    bool? success;
    String? message;
    List<filterNotes>? data;

    PyqandNotesfilter({
        this.code,
        this.success,
        this.message,
        this.data,
    });

    factory PyqandNotesfilter.fromJson(Map<String, dynamic> json) => PyqandNotesfilter(
        code: json["code"],
        success: json["success"],
        message: json["message"],
        data: json["data"] == null ? [] : List<filterNotes>.from(json["data"]!.map((x) => filterNotes.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "code": code,
        "success": success,
        "message": message,
        "data": data == null ? [] : List<dynamic>.from(data!.map((x) => x.toJson())),
    };
}

class filterNotes {
    String? id;
    String? uploadType;
    String? paid;
    String? description;
    String? subject;
    String? branch;
    FileClass? file;
    DateTime? createdAt;
    DateTime? updatedAt;
    int? v;
    String? title;

    filterNotes({
        this.id,
        this.uploadType,
        this.paid,
        this.description,
        this.subject,
        this.branch,
        this.file,
        this.createdAt,
        this.updatedAt,
        this.v,
        this.title,
    });

    factory filterNotes.fromJson(Map<String, dynamic> json) => filterNotes(
        id: json["_id"],
        uploadType: json["uploadType"],
        paid: json["paid"],
        description: json["description"],
        subject: json["subject"],
        branch: json["branch"],
        file: json["file"] == null ? null : FileClass.fromJson(json["file"]),
        createdAt: json["createdAt"] == null ? null : DateTime.parse(json["createdAt"]),
        updatedAt: json["updatedAt"] == null ? null : DateTime.parse(json["updatedAt"]),
        v: json["__v"],
        title: json["title"],
    );

    Map<String, dynamic> toJson() => {
        "_id": id,
        "uploadType": uploadType,
        "paid": paid,
        "description": description,
        "subject": subject,
        "branch": branch,
        "file": file?.toJson(),
        "createdAt": createdAt?.toIso8601String(),
        "updatedAt": updatedAt?.toIso8601String(),
        "__v": v,
        "title": title,
    };
}

class FileClass {
    String? name;
    String? url;
    String? type;
    String? size;
    String? description;

    FileClass({
        this.name,
        this.url,
        this.type,
        this.size,
        this.description,
    });

    factory FileClass.fromJson(Map<String, dynamic> json) => FileClass(
        name: json["name"],
        url: json["url"],
        type: json["type"],
        size: json["size"],
        description: json["description"],
    );

    Map<String, dynamic> toJson() => {
        "name": name,
        "url": url,
        "type": type,
        "size": size,
        "description": description,
    };
}
