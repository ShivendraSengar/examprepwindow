

// import 'dart:convert';

// ViewAnswerDetailModal viewAnswerDetailModalFromJson(String str) => ViewAnswerDetailModal.fromJson(json.decode(str));

// String viewAnswerDetailModalToJson(ViewAnswerDetailModal data) => json.encode(data.toJson());

// class ViewAnswerDetailModal {
//     int? code;
//     bool? success;
//     String? message;
//     List<Answerlist>? data;

//     ViewAnswerDetailModal({
//         this.code,
//         this.success,
//         this.message,
//         this.data,
//     });

//     factory ViewAnswerDetailModal.fromJson(Map<String, dynamic> json) => ViewAnswerDetailModal(
//         code: json["code"],
//         success: json["success"],
//         message: json["message"],
//         data: json["data"] == null ? [] : List<Answerlist>.from(json["data"]!.map((x) => Answerlist.fromJson(x))),
//     );

//     Map<String, dynamic> toJson() => {
//         "code": code,
//         "success": success,
//         "message": message,
//         "data": data == null ? [] : List<dynamic>.from(data!.map((x) => x.toJson())),
//     };
// }

// class Answerlist {
//     String? id;
//     UserId? userId;
//     TestId? testId;
//     List<Answer>? answers;
//     int? marksGot;
//     TimeData? timeData;
//     dynamic attempt;
//     String? submit;
//     DateTime? createdAt;
//     DateTime? updatedAt;
//     int? v;
//     String? rank;

//     Answerlist({
//         this.id,
//         this.userId,
//         this.testId,
//         this.answers,
//         this.marksGot,
//         this.timeData,
//         this.attempt,
//         this.submit,
//         this.createdAt,
//         this.updatedAt,
//         this.v,
//         this.rank,
//     });

//     factory Answerlist.fromJson(Map<String, dynamic> json) => Answerlist(
//         id: json["_id"],
//         userId: json["userId"] == null ? null : UserId.fromJson(json["userId"]),
//         testId: json["testId"] == null ? null : TestId.fromJson(json["testId"]),
//         answers: json["answers"] == null ? [] : List<Answer>.from(json["answers"]!.map((x) => Answer.fromJson(x))),
//         marksGot: json["marksGot"],
//         timeData: json["timeData"] == null ? null : TimeData.fromJson(json["timeData"]),
//         attempt: json["attempt"],
//         submit: json["submit"],
//         createdAt: json["createdAt"] == null ? null : DateTime.parse(json["createdAt"]),
//         updatedAt: json["updatedAt"] == null ? null : DateTime.parse(json["updatedAt"]),
//         v: json["__v"],
//         rank: json["rank"],
//     );

//     Map<String, dynamic> toJson() => {
//         "_id": id,
//         "userId": userId?.toJson(),
//         "testId": testId?.toJson(),
//         "answers": answers == null ? [] : List<dynamic>.from(answers!.map((x) => x.toJson())),
//         "marksGot": marksGot,
//         "timeData": timeData?.toJson(),
//         "attempt": attempt,
//         "submit": submit,
//         "createdAt": createdAt?.toIso8601String(),
//         "updatedAt": updatedAt?.toIso8601String(),
//         "__v": v,
//         "rank": rank,
//     };
// }

// class Answer {
//     String? question;
//     bool? isRight;
//     String? answer;
//     String? id;

//     Answer({
//         this.question,
//         this.isRight,
//         this.answer,
//         this.id,
//     });

//     factory Answer.fromJson(Map<String, dynamic> json) => Answer(
//         question: json["question"],
//         isRight: json["isRight"],
//         answer: json["answer"],
//         id: json["_id"],
//     );

//     Map<String, dynamic> toJson() => {
//         "question": question,
//         "isRight": isRight,
//         "answer": answer,
//         "_id": id,
//     };
// }

// class TestId {
//     String? id;
//     List<Question>? questions;
//     int? totalMarks;

//     TestId({
//         this.id,
//         this.questions,
//         this.totalMarks,
//     });

//     factory TestId.fromJson(Map<String, dynamic> json) => TestId(
//         id: json["_id"],
//         questions: json["questions"] == null ? [] : List<Question>.from(json["questions"]!.map((x) => Question.fromJson(x))),
//         totalMarks: json["totalMarks"],
//     );

//     Map<String, dynamic> toJson() => {
//         "_id": id,
//         "questions": questions == null ? [] : List<dynamic>.from(questions!.map((x) => x.toJson())),
//         "totalMarks": totalMarks,
//     };
// }

// class Question {
//     String? id;
//     String? question;
//     String? questionImage;
//     String? type;
//     List<Option>? options;
//     Explanation? explanation;
//     int? marks;
//     double? negativeMarks;

//     Question({
//         this.id,
//         this.question,
//         this.questionImage,
//         this.type,
//         this.options,
//         this.explanation,
//         this.marks,
//         this.negativeMarks,
//     });

//     factory Question.fromJson(Map<String, dynamic> json) => Question(
//         id: json["_id"],
//         question: json["question"],
//         questionImage: json["questionImage"],
//         type: json["type"],
//         options: json["options"] == null ? [] : List<Option>.from(json["options"]!.map((x) => Option.fromJson(x))),
//         explanation: json["explanation"] == null ? null : Explanation.fromJson(json["explanation"]),
//         marks: json["marks"],
//         negativeMarks: json["negativeMarks"]?.toDouble(),
//     );

//     Map<String, dynamic> toJson() => {
//         "_id": id,
//         "question": question,
//         "questionImage": questionImage,
//         "type": type,
//         "options": options == null ? [] : List<dynamic>.from(options!.map((x) => x.toJson())),
//         "explanation": explanation?.toJson(),
//         "marks": marks,
//         "negativeMarks": negativeMarks,
//     };
// }

// class Explanation {
//     String? text;
//     String? image;
//     String? video;

//     Explanation({
//         this.text,
//         this.image,
//         this.video,
//     });

//     factory Explanation.fromJson(Map<String, dynamic> json) => Explanation(
//         text: json["text"],
//         image: json["image"],
//         video: json["video"],
//     );

//     Map<String, dynamic> toJson() => {
//         "text": text,
//         "image": image,
//         "video": video,
//     };
// }

// class Option {
//     String? option;
//     int? optionType;
//     String? id;

//     Option({
//         this.option,
//         this.optionType,
//         this.id,
//     });

//     factory Option.fromJson(Map<String, dynamic> json) => Option(
//         option: json["option"],
//         optionType: json["optionType"],
//         id: json["_id"],
//     );

//     Map<String, dynamic> toJson() => {
//         "option": option,
//         "optionType": optionType,
//         "_id": id,
//     };
// }

// class TimeData {
//     String? rawStartDate;
//     DateTime? startTimeString;
//     int? usedTime;
//     DateTime? endTimeString;
//     int? duration;

//     TimeData({
//         this.rawStartDate,
//         this.startTimeString,
//         this.usedTime,
//         this.endTimeString,
//         this.duration,
//     });

//     factory TimeData.fromJson(Map<String, dynamic> json) => TimeData(
//         rawStartDate: json["rawStartDate"],
//         startTimeString: json["startTimeString"] == null ? null : DateTime.parse(json["startTimeString"]),
//         usedTime: json["usedTime"],
//         endTimeString: json["endTimeString"] == null ? null : DateTime.parse(json["endTimeString"]),
//         duration: json["duration"],
//     );

//     Map<String, dynamic> toJson() => {
//         "rawStartDate": rawStartDate,
//         "startTimeString": startTimeString?.toIso8601String(),
//         "usedTime": usedTime,
//         "endTimeString": endTimeString?.toIso8601String(),
//         "duration": duration,
//     };
// }

// class UserId {
//     String? id;
//     String? photo;
//     String? email;
//     String? name;

//     UserId({
//         this.id,
//         this.photo,
//         this.email,
//         this.name,
//     });

//     factory UserId.fromJson(Map<String, dynamic> json) => UserId(
//         id: json["_id"],
//         photo: json["photo"],
//         email: json["email"],
//         name: json["name"],
//     );

//     Map<String, dynamic> toJson() => {
//         "_id": id,
//         "photo": photo,
//         "email": email,
//         "name": name,
//     };
// }
// To parse this JSON data, do
//
//     final viewAnswerDetailModal = viewAnswerDetailModalFromJson(jsonString);

import 'dart:convert';

ViewAnswerDetailModal viewAnswerDetailModalFromJson(String str) => ViewAnswerDetailModal.fromJson(json.decode(str));

String viewAnswerDetailModalToJson(ViewAnswerDetailModal data) => json.encode(data.toJson());

class ViewAnswerDetailModal {
    int? code;
    bool? success;
    String? message;
    List<Answerlist>? data;

    ViewAnswerDetailModal({
        this.code,
        this.success,
        this.message,
        this.data,
    });

    factory ViewAnswerDetailModal.fromJson(Map<String, dynamic> json) => ViewAnswerDetailModal(
        code: json["code"],
        success: json["success"],
        message: json["message"],
        data: json["data"] == null ? [] : List<Answerlist>.from(json["data"]!.map((x) => Answerlist.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "code": code,
        "success": success,
        "message": message,
        "data": data == null ? [] : List<dynamic>.from(data!.map((x) => x.toJson())),
    };
}

class Answerlist {
    String? id;
    UserId? userId;
    TestId? testId;
    List<Answer>? answers;
    int? marksGot;
    TimeData? timeData;
    String? attempt;
    String? submit;
    DateTime? createdAt;
    DateTime? updatedAt;
    int? v;
    String? rank;

    Answerlist({
        this.id,
        this.userId,
        this.testId,
        this.answers,
        this.marksGot,
        this.timeData,
        this.attempt,
        this.submit,
        this.createdAt,
        this.updatedAt,
        this.v,
        this.rank,
    });

    factory Answerlist.fromJson(Map<String, dynamic> json) => Answerlist(
        id: json["_id"],
        userId: json["userId"] == null ? null : UserId.fromJson(json["userId"]),
        testId: json["testId"] == null ? null : TestId.fromJson(json["testId"]),
        answers: json["answers"] == null ? [] : List<Answer>.from(json["answers"]!.map((x) => Answer.fromJson(x))),
        marksGot: json["marksGot"],
        timeData: json["timeData"] == null ? null : TimeData.fromJson(json["timeData"]),
        attempt: json["attempt"],
        submit: json["submit"],
        createdAt: json["createdAt"] == null ? null : DateTime.parse(json["createdAt"]),
        updatedAt: json["updatedAt"] == null ? null : DateTime.parse(json["updatedAt"]),
        v: json["__v"],
        rank: json["rank"],
    );

    Map<String, dynamic> toJson() => {
        "_id": id,
        "userId": userId?.toJson(),
        "testId": testId?.toJson(),
        "answers": answers == null ? [] : List<dynamic>.from(answers!.map((x) => x.toJson())),
        "marksGot": marksGot,
        "timeData": timeData?.toJson(),
        "attempt": attempt,
        "submit": submit,
        "createdAt": createdAt?.toIso8601String(),
        "updatedAt": updatedAt?.toIso8601String(),
        "__v": v,
        "rank": rank,
    };
}

class Answer {
    String? question;
    bool? isRight;
    String? answer;
    String? id;

    Answer({
        this.question,
        this.isRight,
        this.answer,
        this.id,
    });

    factory Answer.fromJson(Map<String, dynamic> json) => Answer(
        question: json["question"],
        isRight: json["isRight"],
        answer: json["answer"],
        id: json["_id"],
    );

    Map<String, dynamic> toJson() => {
        "question": question,
        "isRight": isRight,
        "answer": answer,
        "_id": id,
    };
}

class TestId {
    String? id;
    List<Question>? questions;
    int? totalMarks;

    TestId({
        this.id,
        this.questions,
        this.totalMarks,
    });

    factory TestId.fromJson(Map<String, dynamic> json) => TestId(
        id: json["_id"],
        questions: json["questions"] == null ? [] : List<Question>.from(json["questions"]!.map((x) => Question.fromJson(x))),
        totalMarks: json["totalMarks"],
    );

    Map<String, dynamic> toJson() => {
        "_id": id,
        "questions": questions == null ? [] : List<dynamic>.from(questions!.map((x) => x.toJson())),
        "totalMarks": totalMarks,
    };
}

class Question {
    String? id;
    String? question;
    String? questionImage;
    String? type;
    List<Option>? options;
    Explanation? explanation;
    int? marks;
    double? negativeMarks;

    Question({
        this.id,
        this.question,
        this.questionImage,
        this.type,
        this.options,
        this.explanation,
        this.marks,
        this.negativeMarks,
    });

    factory Question.fromJson(Map<String, dynamic> json) => Question(
        id: json["_id"],
        question: json["question"],
        questionImage: json["questionImage"],
        type: json["type"],
        options: json["options"] == null ? [] : List<Option>.from(json["options"]!.map((x) => Option.fromJson(x))),
        explanation: json["explanation"] == null ? null : Explanation.fromJson(json["explanation"]),
        marks: json["marks"],
        negativeMarks: json["negativeMarks"]?.toDouble(),
    );

    Map<String, dynamic> toJson() => {
        "_id": id,
        "question": question,
        "questionImage": questionImage,
        "type": type,
        "options": options == null ? [] : List<dynamic>.from(options!.map((x) => x.toJson())),
        "explanation": explanation?.toJson(),
        "marks": marks,
        "negativeMarks": negativeMarks,
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
    int? usedTime;
    DateTime? endTimeString;
    int? duration;

    TimeData({
        this.rawStartDate,
        this.startTimeString,
        this.usedTime,
        this.endTimeString,
        this.duration,
    });

    factory TimeData.fromJson(Map<String, dynamic> json) => TimeData(
        rawStartDate: json["rawStartDate"],
        startTimeString: json["startTimeString"] == null ? null : DateTime.parse(json["startTimeString"]),
        usedTime: json["usedTime"],
        endTimeString: json["endTimeString"] == null ? null : DateTime.parse(json["endTimeString"]),
        duration: json["duration"],
    );

    Map<String, dynamic> toJson() => {
        "rawStartDate": rawStartDate,
        "startTimeString": startTimeString?.toIso8601String(),
        "usedTime": usedTime,
        "endTimeString": endTimeString?.toIso8601String(),
        "duration": duration,
    };
}

class UserId {
    String? id;
    String? photo;
    String? name;
    String? email;

    UserId({
        this.id,
        this.photo,
        this.name,
        this.email,
    });

    factory UserId.fromJson(Map<String, dynamic> json) => UserId(
        id: json["_id"],
        photo: json["photo"],
        name: json["name"],
        email: json["email"],
    );

    Map<String, dynamic> toJson() => {
        "_id": id,
        "photo": photo,
        "name": name,
        "email": email,
    };
}
