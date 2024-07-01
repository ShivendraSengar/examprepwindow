import 'dart:convert';

GetExamid getExamidFromJson(String str) => GetExamid.fromJson(json.decode(str));

String getExamidToJson(GetExamid data) => json.encode(data.toJson());

class GetExamid {
  int? code;
  bool? success;
  String? message;
  List<CourseList>? data;

  GetExamid({
    this.code,
    this.success,
    this.message,
    this.data,
  });

  factory GetExamid.fromJson(Map<String, dynamic> json) => GetExamid(
        code: json["code"],
        success: json["success"],
        message: json["message"],
        data: json["data"] == null
            ? []
            : List<CourseList>.from(
                json["data"]!.map((x) => CourseList.fromJson(x))),
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

class CourseList {
  String? id;
  String? name;
  String? title;
  String? number;
  List<Branch>? category;
  String? image;
  String? courseType;
  String? description;
  String? hide;
  Branch? branch;
  Exam? exam;
  double? rating;
  String? discount;
  DateTime? discountValidity;
  int? discountPrice;
  String? cost;
  int? durationInMonths;
  List<Thumbnail>? thumbnail;
  DateTime? createdAt;
  DateTime? updatedAt;
  int? v;
  String? purchased;

  CourseList({
    this.id,
    this.name,
    this.title,
    this.number,
    this.category,
    this.image,
    this.courseType,
    this.description,
    this.hide,
    this.branch,
    this.exam,
    this.rating,
    this.discount,
    this.discountValidity,
    this.discountPrice,
    this.cost,
    this.durationInMonths,
    this.thumbnail,
    this.createdAt,
    this.updatedAt,
    this.v,
    this.purchased,
  });

  factory CourseList.fromJson(Map<String, dynamic> json) => CourseList(
        id: json["_id"],
        name: json["name"],
        title: json["title"],
        number: json["number"],
        category: json["category"] == null
            ? []
            : List<Branch>.from(
                json["category"]!.map((x) => Branch.fromJson(x))),
        image: json["image"],
        courseType: json["courseType"],
        description: json["description"],
        hide: json["hide"],
        branch: json["branch"] == null ? null : Branch.fromJson(json["branch"]),
        exam: json["exam"] == null ? null : Exam.fromJson(json["exam"]),
        rating: json["rating"]?.toDouble(),
        discount: json["discount"],
        discountValidity: json["discountValidity"] == null
            ? null
            : DateTime.parse(json["discountValidity"]),
        discountPrice: json["discountPrice"],
        cost: json["cost"],
        durationInMonths: json["durationInMonths"],
        thumbnail: json["thumbnail"] == null
            ? []
            : List<Thumbnail>.from(
                json["thumbnail"]!.map((x) => Thumbnail.fromJson(x))),
        createdAt: json["createdAt"] == null
            ? null
            : DateTime.parse(json["createdAt"]),
        updatedAt: json["updatedAt"] == null
            ? null
            : DateTime.parse(json["updatedAt"]),
        v: json["__v"],
        purchased: json["purchased"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "name": name,
        "title": title,
        "number": number,
        "category": category == null
            ? []
            : List<dynamic>.from(category!.map((x) => x.toJson())),
        "image": image,
        "courseType": courseType,
        "description": description,
        "hide": hide,
        "branch": branch?.toJson(),
        "exam": exam?.toJson(),
        "rating": rating,
        "discount": discount,
        "discountValidity": discountValidity?.toIso8601String(),
        "discountPrice": discountPrice,
        "cost": cost,
        "durationInMonths": durationInMonths,
        "thumbnail": thumbnail == null
            ? []
            : List<dynamic>.from(thumbnail!.map((x) => x.toJson())),
        "createdAt": createdAt?.toIso8601String(),
        "updatedAt": updatedAt?.toIso8601String(),
        "__v": v,
        "purchased": purchased,
      };
}

class Branch {
  String? id;
  String? branch;
  DateTime? createdAt;
  DateTime? updatedAt;
  int? v;
  String? category;

  Branch({
    this.id,
    this.branch,
    this.createdAt,
    this.updatedAt,
    this.v,
    this.category,
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
        category: json["category"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "branch": branch,
        "createdAt": createdAt?.toIso8601String(),
        "updatedAt": updatedAt?.toIso8601String(),
        "__v": v,
        "category": category,
      };
}

class Exam {
  String? id;
  String? branch;
  String? exam;
  List<String>? subjects;
  DateTime? createdAt;
  DateTime? updatedAt;
  int? v;

  Exam({
    this.id,
    this.branch,
    this.exam,
    this.subjects,
    this.createdAt,
    this.updatedAt,
    this.v,
  });

  factory Exam.fromJson(Map<String, dynamic> json) => Exam(
        id: json["_id"],
        branch: json["branch"],
        exam: json["exam"],
        subjects: json["subjects"] == null
            ? []
            : List<String>.from(json["subjects"]!.map((x) => x)),
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
        "exam": exam,
        "subjects":
            subjects == null ? [] : List<dynamic>.from(subjects!.map((x) => x)),
        "createdAt": createdAt?.toIso8601String(),
        "updatedAt": updatedAt?.toIso8601String(),
        "__v": v,
      };
}

class Thumbnail {
  String? id;
  String? image;

  Thumbnail({
    this.id,
    this.image,
  });

  factory Thumbnail.fromJson(Map<String, dynamic> json) => Thumbnail(
        id: json["_id"],
        image: json["image"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "image": image,
      };
}
