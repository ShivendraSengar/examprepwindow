

import 'dart:convert';

SubjectfilterlistModal subjectfilterlistModalFromJson(String str) => SubjectfilterlistModal.fromJson(json.decode(str));

String subjectfilterlistModalToJson(SubjectfilterlistModal data) => json.encode(data.toJson());

class SubjectfilterlistModal {
    int? code;
    bool? success;
    String? message;
    List<SelectedSubjectlist>? data;

    SubjectfilterlistModal({
        this.code,
        this.success,
        this.message,
        this.data,
    });

    factory SubjectfilterlistModal.fromJson(Map<String, dynamic> json) => SubjectfilterlistModal(
        code: json["code"],
        success: json["success"],
        message: json["message"],
        data: json["data"] == null ? [] : List<SelectedSubjectlist>.from(json["data"]!.map((x) => SelectedSubjectlist.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "code": code,
        "success": success,
        "message": message,
        "data": data == null ? [] : List<dynamic>.from(data!.map((x) => x.toJson())),
    };
}

class SelectedSubjectlist {
    String? id;
    String? subject;
    List<String>? tags;
    DateTime? createdAt;
    DateTime? updatedAt;
    int? v;
    int? priority;

    SelectedSubjectlist({
        this.id,
        this.subject,
        this.tags,
        this.createdAt,
        this.updatedAt,
        this.v,
        this.priority,
    });

    factory SelectedSubjectlist.fromJson(Map<String, dynamic> json) => SelectedSubjectlist(
        id: json["_id"],
        subject: json["subject"],
        tags: json["tags"] == null ? [] : List<String>.from(json["tags"]!.map((x) => x)),
        createdAt: json["createdAt"] == null ? null : DateTime.parse(json["createdAt"]),
        updatedAt: json["updatedAt"] == null ? null : DateTime.parse(json["updatedAt"]),
        v: json["__v"],
        priority: json["priority"],
    );

    Map<String, dynamic> toJson() => {
        "_id": id,
        "subject": subject,
        "tags": tags == null ? [] : List<dynamic>.from(tags!.map((x) => x)),
        "createdAt": createdAt?.toIso8601String(),
        "updatedAt": updatedAt?.toIso8601String(),
        "__v": v,
        "priority": priority,
    };
}
