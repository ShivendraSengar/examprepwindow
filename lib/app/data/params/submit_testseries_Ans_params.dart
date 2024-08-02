// To parse this JSON data, do
//
//     final submitAnswerparams = submitAnswerparamsFromJson(jsonString);

import 'dart:convert';

SubmitAnswerparams submitAnswerparamsFromJson(String str) =>
    SubmitAnswerparams.fromJson(json.decode(str));

String submitAnswerparamsToJson(SubmitAnswerparams data) =>
    json.encode(data.toJson());

class SubmitAnswerparams {
  String? userId;
  String? testId;
  int? marksGot;
  String? startTime;
  String? submit;
  String? endTime;
  List<Answer>? answers;

  SubmitAnswerparams({
    this.userId,
    this.testId,
    this.marksGot,
    this.startTime,
    this.submit,
    this.endTime,
    this.answers,
  });

  factory SubmitAnswerparams.fromJson(Map<String, dynamic> json) =>
      SubmitAnswerparams(
        userId: json["userId"],
        testId: json["testId"],
        marksGot: json["marksGot"],
        startTime: json["startTime"],
        submit: json["submit"],
        endTime: json["endTime"],
        answers: json["answers"] == null
            ? []
            : List<Answer>.from(
                json["answers"]!.map((x) => Answer.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "userId": userId,
        "testId": testId,
        "marksGot": marksGot,
        "startTime": startTime,
        "submit": submit,
        "endTime": endTime,
        "answers": answers == null
            ? []
            : List<dynamic>.from(answers!.map((x) => x.toJson())),
      };
}

class Answer {
  String? answer;
  String? question;
  bool? isRight;

  Answer({
    this.answer,
    this.question,
    this.isRight,
  });

  factory Answer.fromJson(Map<String, dynamic> json) => Answer(
        answer: json["answer"],
        question: json["question"],
        isRight: json["isRight"],
      );

  Map<String, dynamic> toJson() => {
        "answer": answer,
        "question": question,
        "isRight": isRight,
      };
}
