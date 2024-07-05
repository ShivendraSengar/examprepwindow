// To parse this JSON data, do
//
//     final quizModals = quizModalsFromJson(jsonString);

import 'dart:convert';

QuizModals quizModalsFromJson(String str) =>
    QuizModals.fromJson(json.decode(str));

String quizModalsToJson(QuizModals data) => json.encode(data.toJson());

class QuizModals {
  int? code;
  bool? success;
  String? message;
  List<Datum>? data;

  QuizModals({
    this.code,
    this.success,
    this.message,
    this.data,
  });

  factory QuizModals.fromJson(Map<String, dynamic> json) => QuizModals(
        code: json["code"],
        success: json["success"],
        message: json["message"],
        data: json["data"] == null
            ? []
            : List<Datum>.from(json["data"]!.map((x) => Datum.fromJson(x))),
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

class Datum {
  Explanation? explanation;
  String? id;
  String? question;
  String? questionImage;
  String? type;
  List<Option>? options;
  String? subject;
  String? title;
  int? marks;
  double? negativeMarks;
  DateTime? createdAt;
  DateTime? updatedAt;
  int? v;

  Datum({
    this.explanation,
    this.id,
    this.question,
    this.questionImage,
    this.type,
    this.options,
    this.subject,
    this.title,
    this.marks,
    this.negativeMarks,
    this.createdAt,
    this.updatedAt,
    this.v,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        explanation: json["explanation"] == null
            ? null
            : Explanation.fromJson(json["explanation"]),
        id: json["_id"],
        question: json["question"],
        questionImage: json["questionImage"],
        type: json["type"],
        options: json["options"] == null
            ? []
            : List<Option>.from(
                json["options"]!.map((x) => Option.fromJson(x))),
        subject: json["subject"],
        title: json["title"],
        marks: json["marks"],
        negativeMarks: json["negativeMarks"]?.toDouble(),
        createdAt: json["createdAt"] == null
            ? null
            : DateTime.parse(json["createdAt"]),
        updatedAt: json["updatedAt"] == null
            ? null
            : DateTime.parse(json["updatedAt"]),
        v: json["__v"],
      );

  Map<String, dynamic> toJson() => {
        "explanation": explanation?.toJson(),
        "_id": id,
        "question": question,
        "questionImage": questionImage,
        "type": type,
        "options": options == null
            ? []
            : List<dynamic>.from(options!.map((x) => x.toJson())),
        "subject": subject,
        "title": title,
        "marks": marks,
        "negativeMarks": negativeMarks,
        "createdAt": createdAt?.toIso8601String(),
        "updatedAt": updatedAt?.toIso8601String(),
        "__v": v,
      };
}

class Explanation {
  String? text;
  String? image;
  String? video;

  Explanation({
    this.text,
    this.image,
    this.video,
  });

  factory Explanation.fromJson(Map<String, dynamic> json) => Explanation(
        text: json["text"],
        image: json["image"],
        video: json["video"],
      );

  Map<String, dynamic> toJson() => {
        "text": text,
        "image": image,
        "video": video,
      };
}

class Option {
  String? option;
  bool? isRight;
  String? id;

  Option({
    this.option,
    this.isRight,
    this.id,
  });

  factory Option.fromJson(Map<String, dynamic> json) => Option(
        option: json["option"],
        isRight: json["isRight"],
        id: json["_id"],
      );

  Map<String, dynamic> toJson() => {
        "option": option,
        "isRight": isRight,
        "_id": id,
      };
}
