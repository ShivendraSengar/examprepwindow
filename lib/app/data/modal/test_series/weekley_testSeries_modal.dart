import 'dart:convert';

WeeklyTestseriesModal weeklyTestseriesModalFromJson(String str) =>
    WeeklyTestseriesModal.fromJson(json.decode(str));

String weeklyTestseriesModalToJson(WeeklyTestseriesModal data) =>
    json.encode(data.toJson());

class WeeklyTestseriesModal {
  int? code;
  bool? success;
  String? message;
  List<Testseries>? data;

  WeeklyTestseriesModal({
    this.code,
    this.success,
    this.message,
    this.data,
  });

  factory WeeklyTestseriesModal.fromJson(Map<String, dynamic> json) =>
      WeeklyTestseriesModal(
        code: json["code"],
        success: json["success"],
        message: json["message"],
        data: json["data"] == null
            ? []
            : List<Testseries>.from(
                json["data"]!.map((x) => Testseries.fromJson(x))),
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

class Testseries {
  String? id;
  String? testName;
  String? testType;
  List<CourseId>? courseId;
  List<String>? subject;
  dynamic questionType;
  String? questionSubType;
  List<Question>? questions;
  String? title;
  int? totalMarks;
  TimeData? timeData;
  String? status;
  DateTime? createdAt;
  DateTime? updatedAt;
  int? v;
  String? attempted;

  Testseries({
    this.id,
    this.testName,
    this.testType,
    this.courseId,
    this.subject,
    this.questionType,
    this.questionSubType,
    this.questions,
    this.title,
    this.totalMarks,
    this.timeData,
    this.status,
    this.createdAt,
    this.updatedAt,
    this.v,
    this.attempted,
  });

  factory Testseries.fromJson(Map<String, dynamic> json) => Testseries(
        id: json["_id"],
        testName: json["testName"],
        testType: json["testType"],
        courseId: json["courseId"] == null
            ? []
            : List<CourseId>.from(
                json["courseId"]!.map((x) => CourseId.fromJson(x))),
        subject: json["subject"] == null
            ? []
            : List<String>.from(json["subject"]!.map((x) => x)),
        questionType: json["questionType"],
        questionSubType: json["questionSubType"],
        questions: json["questions"] == null
            ? []
            : List<Question>.from(
                json["questions"]!.map((x) => Question.fromJson(x))),
        title: json["title"],
        totalMarks: json["totalMarks"],
        timeData: json["timeData"] == null
            ? null
            : TimeData.fromJson(json["timeData"]),
        status: json["status"],
        createdAt: json["createdAt"] == null
            ? null
            : DateTime.parse(json["createdAt"]),
        updatedAt: json["updatedAt"] == null
            ? null
            : DateTime.parse(json["updatedAt"]),
        v: json["__v"],
        attempted: json["attempted"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "testName": testName,
        "testType": testType,
        "courseId": courseId == null
            ? []
            : List<dynamic>.from(courseId!.map((x) => x.toJson())),
        "subject":
            subject == null ? [] : List<dynamic>.from(subject!.map((x) => x)),
        "questionType": questionType,
        "questionSubType": questionSubType,
        "questions": questions == null
            ? []
            : List<dynamic>.from(questions!.map((x) => x.toJson())),
        "title": title,
        "totalMarks": totalMarks,
        "timeData": timeData?.toJson(),
        "status": status,
        "createdAt": createdAt?.toIso8601String(),
        "updatedAt": updatedAt?.toIso8601String(),
        "__v": v,
        "attempted": attempted,
      };
}

class CourseId {
  String? id;
  String? name;
  String? cost;

  CourseId({
    this.id,
    this.name,
    this.cost,
  });

  factory CourseId.fromJson(Map<String, dynamic> json) => CourseId(
        id: json["_id"],
        name: json["name"],
        cost: json["cost"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "name": name,
        "cost": cost,
      };
}

class Question {
  String? id;
  String? question;
  String? questionImage;
  String? type;
  List<Option>? options;
  Explanation? explanation;
  String? subject;
  String? title;
  int? marks;
  double? negativeMarks;
  DateTime? createdAt;
  DateTime? updatedAt;
  int? v;

  Question({
    this.id,
    this.question,
    this.questionImage,
    this.type,
    this.options,
    this.explanation,
    this.subject,
    this.title,
    this.marks,
    this.negativeMarks,
    this.createdAt,
    this.updatedAt,
    this.v,
  });

  factory Question.fromJson(Map<String, dynamic> json) => Question(
        id: json["_id"],
        question: json["question"],
        questionImage: json["questionImage"],
        type: json["type"],
        options: json["options"] == null
            ? []
            : List<Option>.from(
                json["options"]!.map((x) => Option.fromJson(x))),
        explanation: json["explanation"] == null
            ? null
            : Explanation.fromJson(json["explanation"]),
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
        "_id": id,
        "question": question,
        "questionImage": questionImage,
        "type": type,
        "options": options == null
            ? []
            : List<dynamic>.from(options!.map((x) => x.toJson())),
        "explanation": explanation?.toJson(),
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
  int? optionType;
  String? id;

  Option({
    this.option,
    this.optionType,
    this.id,
  });

  factory Option.fromJson(Map<String, dynamic> json) => Option(
        option: json["option"],
        optionType: json["optionType"],
        id: json["_id"],
      );

  Map<String, dynamic> toJson() => {
        "option": option,
        "optionType": optionType,
        "_id": id,
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
