// To parse this JSON data, do
//
//     final courses = coursesFromJson(jsonString);

import 'dart:convert';

Courses coursesFromJson(String str) => Courses.fromJson(json.decode(str));

String coursesToJson(Courses data) => json.encode(data.toJson());

class Courses {
    int? code;
    bool? success;
    String? message;
    List<Datum>? data;

    Courses({
        this.code,
        this.success,
        this.message,
        this.data,
    });

    factory Courses.fromJson(Map<String, dynamic> json) => Courses(
        code: json["code"],
        success: json["success"],
        message: json["message"],
        data: json["data"] == null ? [] : List<Datum>.from(json["data"]!.map((x) => Datum.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "code": code,
        "success": success,
        "message": message,
        "data": data == null ? [] : List<dynamic>.from(data!.map((x) => x.toJson())),
    };
}

class Datum {
    String? id;
    String? title;
    String? number;
    String? image;
    String? description;
    double? rating;
    String? name;
    String? cost;
    int? durationInMonths;
    DateTime? createdAt;
    DateTime? updatedAt;
    int? v;
    Branch? branch;
    String? courseType;
    Exam? exam;
    String? discount;
    int? discountPrice;
    List<DiscountCode>? discountCodes;
    List<Category>? category;
    DateTime? discountValidity;
    String? hide;
    int? priority;
    String? purchased;
    String? descriptionText;
    List<Thumbnail>? thumbnail;
    List<Package>? packages;

    Datum({
        this.id,
        this.title,
        this.number,
        this.image,
        this.description,
        this.rating,
        this.name,
        this.cost,
        this.durationInMonths,
        this.createdAt,
        this.updatedAt,
        this.v,
        this.branch,
        this.courseType,
        this.exam,
        this.discount,
        this.discountPrice,
        this.discountCodes,
        this.category,
        this.discountValidity,
        this.hide,
        this.priority,
        this.purchased,
        this.descriptionText,
        this.thumbnail,
        this.packages,
    });

    factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["_id"],
        title: json["title"],
        number: json["number"],
        image: json["image"],
        description: json["description"],
        rating: json["rating"]?.toDouble(),
        name: json["name"],
        cost: json["cost"],
        durationInMonths: json["durationInMonths"],
        createdAt: json["createdAt"] == null ? null : DateTime.parse(json["createdAt"]),
        updatedAt: json["updatedAt"] == null ? null : DateTime.parse(json["updatedAt"]),
        v: json["__v"],
        branch: json["branch"] == null ? null : Branch.fromJson(json["branch"]),
        courseType: json["courseType"],
        exam: json["exam"] == null ? null : Exam.fromJson(json["exam"]),
        discount: json["discount"],
        discountPrice: json["discountPrice"],
        discountCodes: json["discountCodes"] == null ? [] : List<DiscountCode>.from(json["discountCodes"]!.map((x) => DiscountCode.fromJson(x))),
        category: json["category"] == null ? [] : List<Category>.from(json["category"]!.map((x) => Category.fromJson(x))),
        discountValidity: json["discountValidity"] == null ? null : DateTime.parse(json["discountValidity"]),
        hide: json["hide"],
        priority: json["priority"],
        purchased: json["purchased"],
        descriptionText: json["descriptionText"],
        thumbnail: json["thumbnail"] == null ? [] : List<Thumbnail>.from(json["thumbnail"]!.map((x) => Thumbnail.fromJson(x))),
        packages: json["packages"] == null ? [] : List<Package>.from(json["packages"]!.map((x) => Package.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "_id": id,
        "title": title,
        "number": number,
        "image": image,
        "description": description,
        "rating": rating,
        "name": name,
        "cost": cost,
        "durationInMonths": durationInMonths,
        "createdAt": createdAt?.toIso8601String(),
        "updatedAt": updatedAt?.toIso8601String(),
        "__v": v,
        "branch": branch?.toJson(),
        "courseType": courseType,
        "exam": exam?.toJson(),
        "discount": discount,
        "discountPrice": discountPrice,
        "discountCodes": discountCodes == null ? [] : List<dynamic>.from(discountCodes!.map((x) => x.toJson())),
        "category": category == null ? [] : List<dynamic>.from(category!.map((x) => x.toJson())),
        "discountValidity": discountValidity?.toIso8601String(),
        "hide": hide,
        "priority": priority,
        "purchased": purchased,
        "descriptionText": descriptionText,
        "thumbnail": thumbnail == null ? [] : List<dynamic>.from(thumbnail!.map((x) => x.toJson())),
        "packages": packages == null ? [] : List<dynamic>.from(packages!.map((x) => x.toJson())),
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
        createdAt: json["createdAt"] == null ? null : DateTime.parse(json["createdAt"]),
        updatedAt: json["updatedAt"] == null ? null : DateTime.parse(json["updatedAt"]),
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

class Category {
    String? id;
    String? category;
    DateTime? createdAt;
    DateTime? updatedAt;
    int? v;
    int? priority;

    Category({
        this.id,
        this.category,
        this.createdAt,
        this.updatedAt,
        this.v,
        this.priority,
    });

    factory Category.fromJson(Map<String, dynamic> json) => Category(
        id: json["_id"],
        category: json["category"],
        createdAt: json["createdAt"] == null ? null : DateTime.parse(json["createdAt"]),
        updatedAt: json["updatedAt"] == null ? null : DateTime.parse(json["updatedAt"]),
        v: json["__v"],
        priority: json["priority"],
    );

    Map<String, dynamic> toJson() => {
        "_id": id,
        "category": category,
        "createdAt": createdAt?.toIso8601String(),
        "updatedAt": updatedAt?.toIso8601String(),
        "__v": v,
        "priority": priority,
    };
}

class DiscountCode {
    String? id;
    String? type;
    List<String>? courseIds;
    List<dynamic>? categoryIds;
    String? status;
    String? removed;
    String? offerName;
    String? code;
    String? discountPercent;
    DateTime? startDate;
    DateTime? endDate;
    DateTime? createdAt;
    DateTime? updatedAt;
    int? v;

    DiscountCode({
        this.id,
        this.type,
        this.courseIds,
        this.categoryIds,
        this.status,
        this.removed,
        this.offerName,
        this.code,
        this.discountPercent,
        this.startDate,
        this.endDate,
        this.createdAt,
        this.updatedAt,
        this.v,
    });

    factory DiscountCode.fromJson(Map<String, dynamic> json) => DiscountCode(
        id: json["_id"],
        type: json["type"],
        courseIds: json["courseIds"] == null ? [] : List<String>.from(json["courseIds"]!.map((x) => x)),
        categoryIds: json["categoryIds"] == null ? [] : List<dynamic>.from(json["categoryIds"]!.map((x) => x)),
        status: json["status"],
        removed: json["removed"],
        offerName: json["offerName"],
        code: json["code"],
        discountPercent: json["discountPercent"],
        startDate: json["startDate"] == null ? null : DateTime.parse(json["startDate"]),
        endDate: json["endDate"] == null ? null : DateTime.parse(json["endDate"]),
        createdAt: json["createdAt"] == null ? null : DateTime.parse(json["createdAt"]),
        updatedAt: json["updatedAt"] == null ? null : DateTime.parse(json["updatedAt"]),
        v: json["__v"],
    );

    Map<String, dynamic> toJson() => {
        "_id": id,
        "type": type,
        "courseIds": courseIds == null ? [] : List<dynamic>.from(courseIds!.map((x) => x)),
        "categoryIds": categoryIds == null ? [] : List<dynamic>.from(categoryIds!.map((x) => x)),
        "status": status,
        "removed": removed,
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
        subjects: json["subjects"] == null ? [] : List<String>.from(json["subjects"]!.map((x) => x)),
        branch: json["branch"],
        createdAt: json["createdAt"] == null ? null : DateTime.parse(json["createdAt"]),
        updatedAt: json["updatedAt"] == null ? null : DateTime.parse(json["updatedAt"]),
        v: json["__v"],
    );

    Map<String, dynamic> toJson() => {
        "_id": id,
        "exam": exam,
        "subjects": subjects == null ? [] : List<dynamic>.from(subjects!.map((x) => x)),
        "branch": branch,
        "createdAt": createdAt?.toIso8601String(),
        "updatedAt": updatedAt?.toIso8601String(),
        "__v": v,
    };
}

class Package {
    String? name;
    int? price;
    String? discount;
    int? discountPrice;
    DateTime? discountValidity;
    int? duration;
    String? description;
    String? id;

    Package({
        this.name,
        this.price,
        this.discount,
        this.discountPrice,
        this.discountValidity,
        this.duration,
        this.description,
        this.id,
    });

    factory Package.fromJson(Map<String, dynamic> json) => Package(
        name: json["name"],
        price: json["price"],
        discount: json["discount"],
        discountPrice: json["discountPrice"],
        discountValidity: json["discountValidity"] == null ? null : DateTime.parse(json["discountValidity"]),
        duration: json["duration"],
        description: json["description"],
        id: json["_id"],
    );

    Map<String, dynamic> toJson() => {
        "name": name,
        "price": price,
        "discount": discount,
        "discountPrice": discountPrice,
        "discountValidity": discountValidity?.toIso8601String(),
        "duration": duration,
        "description": description,
        "_id": id,
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
