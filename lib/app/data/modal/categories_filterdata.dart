import 'dart:convert';

CategoriesFilter categoriesFilterFromJson(String str) =>
    CategoriesFilter.fromJson(json.decode(str));

String categoriesFilterToJson(CategoriesFilter data) =>
    json.encode(data.toJson());

class CategoriesFilter {
  int? code;
  bool? success;
  String? message;
  List<FilterData>? data;

  CategoriesFilter({
    this.code,
    this.success,
    this.message,
    this.data,
  });

  factory CategoriesFilter.fromJson(Map<String, dynamic> json) =>
      CategoriesFilter(
        code: json["code"],
        success: json["success"],
        message: json["message"],
        data: json["data"] == null
            ? []
            : List<FilterData>.from(
                json["data"]!.map((x) => FilterData.fromJson(x))),
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

class FilterData {
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
  List<DiscountCodes>? discountCodes;
  DateTime? discountValidity;
  int? discountPrice;
  String? cost;
  int? durationInMonths;
  List<dynamic>? thumbnail;
  DateTime? createdAt;
  DateTime? updatedAt;
  int? v;
  String? purchased;

  FilterData({
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
    this.discountCodes,
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

  factory FilterData.fromJson(Map<String, dynamic> json) => FilterData(
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
        discountCodes: json["discountCodes"] == null
            ? []
            : List<DiscountCodes>.from(
                json["discountCodes"]!.map((x) => DiscountCodes.fromJson(x))),
        discountValidity: json["discountValidity"] == null
            ? null
            : DateTime.parse(json["discountValidity"]),
        discountPrice: json["discountPrice"],
        cost: json["cost"],
        durationInMonths: json["durationInMonths"],
        thumbnail: json["thumbnail"] == null
            ? []
            : List<dynamic>.from(json["thumbnail"]!.map((x) => x)),
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
        "discountCodes": discountCodes == null
            ? []
            : List<dynamic>.from(discountCodes!.map((x) => x.toJson())),
        "discountValidity": discountValidity?.toIso8601String(),
        "discountPrice": discountPrice,
        "cost": cost,
        "durationInMonths": durationInMonths,
        "thumbnail": thumbnail == null
            ? []
            : List<dynamic>.from(thumbnail!.map((x) => x)),
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

class DiscountCodes {
  String? id;
  String? type;
  List<String>? courseIds;
  List<String>? categoryIds;
  String? status;
  String? offerName;
  String? code;
  String? discountPercent;
  DateTime? startDate;
  DateTime? endDate;
  DateTime? createdAt;
  DateTime? updatedAt;
  int? v;

  DiscountCodes({
    this.id,
    this.type,
    this.courseIds,
    this.categoryIds,
    this.status,
    this.offerName,
    this.code,
    this.discountPercent,
    this.startDate,
    this.endDate,
    this.createdAt,
    this.updatedAt,
    this.v,
  });

  factory DiscountCodes.fromJson(Map<String, dynamic> json) => DiscountCodes(
        id: json["_id"],
        type: json["type"],
        courseIds: json["courseIds"] == null
            ? []
            : List<String>.from(json["courseIds"]!.map((x) => x)),
        categoryIds: json["categoryIds"] == null
            ? []
            : List<String>.from(json["categoryIds"]!.map((x) => x)),
        status: json["status"],
        offerName: json["offerName"],
        code: json["code"],
        discountPercent: json["discountPercent"],
        startDate: json["startDate"] == null
            ? null
            : DateTime.parse(json["startDate"]),
        endDate:
            json["endDate"] == null ? null : DateTime.parse(json["endDate"]),
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
        "type": type,
        "courseIds": courseIds == null
            ? []
            : List<dynamic>.from(courseIds!.map((x) => x)),
        "categoryIds": categoryIds == null
            ? []
            : List<dynamic>.from(categoryIds!.map((x) => x)),
        "status": status,
        "offerName": offerName,
        "code": code,
        "discountPercent": discountPercent,
        "startDate": startDate?.toIso8601String(),
        "endDate": endDate?.toIso8601String(),
        "createdAt": createdAt?.toIso8601String(),
        "updatedAt": updatedAt?.toIso8601String(),
        "__v": v,
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
