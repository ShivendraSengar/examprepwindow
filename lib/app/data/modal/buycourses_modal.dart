// import 'dart:convert';

// BuyCourses buyCoursesFromJson(String str) =>
//     BuyCourses.fromJson(json.decode(str));

// String buyCoursesToJson(BuyCourses data) => json.encode(data.toJson());

// class BuyCourses {
//   int? code;
//   bool? success;
//   String? message;
//   List<CourseSub>? data;

//   BuyCourses({
//     this.code,
//     this.success,
//     this.message,
//     this.data,
//   });

//   factory BuyCourses.fromJson(Map<String, dynamic> json) => BuyCourses(
//         code: json["code"],
//         success: json["success"],
//         message: json["message"],
//         data: json["data"] == null
//             ? []
//             : List<CourseSub>.from(
//                 json["data"]!.map((x) => CourseSub.fromJson(x))),
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

// class CourseSub {
//   String? id;
//   UserId? userId;
//   String? active;
//   String? name;
//   CourseId? courseId;
//   String? expiry;
//   String? startDate;
//   int? durationInMonths;
//   String? expired;
//   DateTime? createdAt;
//   DateTime? updatedAt;

//   CourseSub({
//     this.id,
//     this.userId,
//     this.active,
//     this.name,
//     this.courseId,
//     this.expiry,
//     this.startDate,
//     this.durationInMonths,
//     this.expired,
//     this.createdAt,
//     this.updatedAt,
//   });

//   factory CourseSub.fromJson(Map<String, dynamic> json) => CourseSub(
//         id: json["_id"],
//         userId: json["userId"] == null ? null : UserId.fromJson(json["userId"]),
//         active: json["active"],
//         name: json["name"],
//         courseId: json["courseId"] == null
//             ? null
//             : CourseId.fromJson(json["courseId"]),
//         expiry: json["expiry"],
//         startDate: json["startDate"],
//         durationInMonths: json["durationInMonths"],
//         expired: json["expired"],
//         createdAt: json["createdAt"] == null
//             ? null
//             : DateTime.parse(json["createdAt"]),
//         updatedAt: json["updatedAt"] == null
//             ? null
//             : DateTime.parse(json["updatedAt"]),
//       );

//   Map<String, dynamic> toJson() => {
//         "_id": id,
//         "userId": userId?.toJson(),
//         "active": active,
//         "name": name,
//         "courseId": courseId?.toJson(),
//         "expiry": expiry,
//         "startDate": startDate,
//         "durationInMonths": durationInMonths,
//         "expired": expired,
//         "createdAt": createdAt?.toIso8601String(),
//         "updatedAt": updatedAt?.toIso8601String(),
//       };
// }

// class CourseId {
//   String? name;
//   String? title;
//   String? number;
//   List<String>? category;
//   String? image;
//   String? courseType;
//   String? description;
//   dynamic hide;
//   Branch? branch;
//   Exam? exam;
//   double? rating;
//   String? discount;
//   List<String>? discountCodes;
//   DateTime? discountValidity;
//   int? discountPrice;
//   String? id;
//   String? cost;
//   int? durationInMonths;
//   DateTime? createdAt;
//   DateTime? updatedAt;
//   int? v;
//   List<dynamic>? thumbnail;

//   CourseId({
//     this.name,
//     this.title,
//     this.number,
//     this.category,
//     this.image,
//     this.courseType,
//     this.description,
//     this.hide,
//     this.branch,
//     this.exam,
//     this.rating,
//     this.discount,
//     this.discountCodes,
//     this.discountValidity,
//     this.discountPrice,
//     this.id,
//     this.cost,
//     this.durationInMonths,
//     this.createdAt,
//     this.updatedAt,
//     this.v,
//     this.thumbnail,
//   });

//   factory CourseId.fromJson(Map<String, dynamic> json) => CourseId(
//         name: json["name"],
//         title: json["title"],
//         number: json["number"],
//         category: json["category"] == null
//             ? []
//             : List<String>.from(json["category"]!.map((x) => x)),
//         image: json["image"],
//         courseType: json["courseType"],
//         description: json["description"],
//         hide: json["hide"],
//         branch: json["branch"] == null ? null : Branch.fromJson(json["branch"]),
//         exam: json["exam"] == null ? null : Exam.fromJson(json["exam"]),
//         rating: json["rating"]?.toDouble(),
//         discount: json["discount"],
//         discountCodes: json["discountCodes"] == null
//             ? []
//             : List<String>.from(json["discountCodes"]!.map((x) => x)),
//         discountValidity: json["discountValidity"] == null
//             ? null
//             : DateTime.parse(json["discountValidity"]),
//         discountPrice: json["discountPrice"],
//         id: json["_id"],
//         cost: json["cost"],
//         durationInMonths: json["durationInMonths"],
//         createdAt: json["createdAt"] == null
//             ? null
//             : DateTime.parse(json["createdAt"]),
//         updatedAt: json["updatedAt"] == null
//             ? null
//             : DateTime.parse(json["updatedAt"]),
//         v: json["__v"],
//         thumbnail: json["thumbnail"] == null
//             ? []
//             : List<dynamic>.from(json["thumbnail"]!.map((x) => x)),
//       );

//   Map<String, dynamic> toJson() => {
//         "name": name,
//         "title": title,
//         "number": number,
//         "category":
//             category == null ? [] : List<dynamic>.from(category!.map((x) => x)),
//         "image": image,
//         "courseType": courseType,
//         "description": description,
//         "hide": hide,
//         "branch": branch?.toJson(),
//         "exam": exam?.toJson(),
//         "rating": rating,
//         "discount": discount,
//         "discountCodes": discountCodes == null
//             ? []
//             : List<dynamic>.from(discountCodes!.map((x) => x)),
//         "discountValidity": discountValidity?.toIso8601String(),
//         "discountPrice": discountPrice,
//         "_id": id,
//         "cost": cost,
//         "durationInMonths": durationInMonths,
//         "createdAt": createdAt?.toIso8601String(),
//         "updatedAt": updatedAt?.toIso8601String(),
//         "__v": v,
//         "thumbnail": thumbnail == null
//             ? []
//             : List<dynamic>.from(thumbnail!.map((x) => x)),
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
//   String? branch;
//   String? exam;
//   List<String>? subjects;
//   String? id;
//   DateTime? createdAt;
//   DateTime? updatedAt;
//   int? v;

//   Exam({
//     this.branch,
//     this.exam,
//     this.subjects,
//     this.id,
//     this.createdAt,
//     this.updatedAt,
//     this.v,
//   });

//   factory Exam.fromJson(Map<String, dynamic> json) => Exam(
//         branch: json["branch"],
//         exam: json["exam"],
//         subjects: json["subjects"] == null
//             ? []
//             : List<String>.from(json["subjects"]!.map((x) => x)),
//         id: json["_id"],
//         createdAt: json["createdAt"] == null
//             ? null
//             : DateTime.parse(json["createdAt"]),
//         updatedAt: json["updatedAt"] == null
//             ? null
//             : DateTime.parse(json["updatedAt"]),
//         v: json["__v"],
//       );

//   Map<String, dynamic> toJson() => {
//         "branch": branch,
//         "exam": exam,
//         "subjects":
//             subjects == null ? [] : List<dynamic>.from(subjects!.map((x) => x)),
//         "_id": id,
//         "createdAt": createdAt?.toIso8601String(),
//         "updatedAt": updatedAt?.toIso8601String(),
//         "__v": v,
//       };
// }

// class UserId {
//   String? mobile;
//   String? id;
//   String? name;
//   String? email;

//   UserId({
//     this.mobile,
//     this.id,
//     this.name,
//     this.email,
//   });

//   factory UserId.fromJson(Map<String, dynamic> json) => UserId(
//         mobile: json["mobile"],
//         id: json["_id"],
//         name: json["name"],
//         email: json["email"],
//       );

//   Map<String, dynamic> toJson() => {
//         "mobile": mobile,
//         "_id": id,
//         "name": name,
//         "email": email,
//       };
// }
// To parse this JSON data, do
//
//     final buyCourses = buyCoursesFromJson(jsonString);

import 'dart:convert';

BuyCourses buyCoursesFromJson(String str) => BuyCourses.fromJson(json.decode(str));

String buyCoursesToJson(BuyCourses data) => json.encode(data.toJson());

class BuyCourses {
    int? code;
    bool? success;
    String? message;
    List<CourseSub>? data;

    BuyCourses({
        this.code,
        this.success,
        this.message,
        this.data,
    });

    factory BuyCourses.fromJson(Map<String, dynamic> json) => BuyCourses(
        code: json["code"],
        success: json["success"],
        message: json["message"],
        data: json["data"] == null ? [] : List<CourseSub>.from(json["data"]!.map((x) => CourseSub.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "code": code,
        "success": success,
        "message": message,
        "data": data == null ? [] : List<dynamic>.from(data!.map((x) => x.toJson())),
    };
}

class CourseSub {
    String? id;
    UserId? userId;
    String? active;
    String? name;
    CourseId? courseId;
    String? expiry;
    String? startDate;
    int? durationInMonths;
    String? expired;
    DateTime? createdAt;
    DateTime? updatedAt;

    CourseSub({
        this.id,
        this.userId,
        this.active,
        this.name,
        this.courseId,
        this.expiry,
        this.startDate,
        this.durationInMonths,
        this.expired,
        this.createdAt,
        this.updatedAt,
    });

    factory CourseSub.fromJson(Map<String, dynamic> json) => CourseSub(
        id: json["_id"],
        userId: json["userId"] == null ? null : UserId.fromJson(json["userId"]),
        active: json["active"],
        name: json["name"],
        courseId: json["courseId"] == null ? null : CourseId.fromJson(json["courseId"]),
        expiry: json["expiry"],
        startDate: json["startDate"],
        durationInMonths: json["durationInMonths"],
        expired: json["expired"],
        createdAt: json["createdAt"] == null ? null : DateTime.parse(json["createdAt"]),
        updatedAt: json["updatedAt"] == null ? null : DateTime.parse(json["updatedAt"]),
    );

    Map<String, dynamic> toJson() => {
        "_id": id,
        "userId": userId?.toJson(),
        "active": active,
        "name": name,
        "courseId": courseId?.toJson(),
        "expiry": expiry,
        "startDate": startDate,
        "durationInMonths": durationInMonths,
        "expired": expired,
        "createdAt": createdAt?.toIso8601String(),
        "updatedAt": updatedAt?.toIso8601String(),
    };
}

class CourseId {
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
    List<String>? discountCodes;
    List<String>? category;
    DateTime? discountValidity;
    String? hide;
    int? priority;
    int? ratingCount;
    List<Package>? packages;
    List<Thumbnail>? thumbnail;

    CourseId({
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
        this.ratingCount,
        this.packages,
        this.thumbnail,
    });

    factory CourseId.fromJson(Map<String, dynamic> json) => CourseId(
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
        discountCodes: json["discountCodes"] == null ? [] : List<String>.from(json["discountCodes"]!.map((x) => x)),
        category: json["category"] == null ? [] : List<String>.from(json["category"]!.map((x) => x)),
        discountValidity: json["discountValidity"] == null ? null : DateTime.parse(json["discountValidity"]),
        hide: json["hide"],
        priority: json["priority"],
        ratingCount: json["ratingCount"],
        packages: json["packages"] == null ? [] : List<Package>.from(json["packages"]!.map((x) => Package.fromJson(x))),
        thumbnail: json["thumbnail"] == null ? [] : List<Thumbnail>.from(json["thumbnail"]!.map((x) => Thumbnail.fromJson(x))),
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
        "discountCodes": discountCodes == null ? [] : List<dynamic>.from(discountCodes!.map((x) => x)),
        "category": category == null ? [] : List<dynamic>.from(category!.map((x) => x)),
        "discountValidity": discountValidity?.toIso8601String(),
        "hide": hide,
        "priority": priority,
        "ratingCount": ratingCount,
        "packages": packages == null ? [] : List<dynamic>.from(packages!.map((x) => x.toJson())),
        "thumbnail": thumbnail == null ? [] : List<dynamic>.from(thumbnail!.map((x) => x.toJson())),
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
    dynamic discountValidity;
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
        discountValidity: json["discountValidity"],
        duration: json["duration"],
        description: json["description"],
        id: json["_id"],
    );

    Map<String, dynamic> toJson() => {
        "name": name,
        "price": price,
        "discount": discount,
        "discountPrice": discountPrice,
        "discountValidity": discountValidity,
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

class UserId {
    String? id;
    String? mobile;
    String? name;
    String? email;

    UserId({
        this.id,
        this.mobile,
        this.name,
        this.email,
    });

    factory UserId.fromJson(Map<String, dynamic> json) => UserId(
        id: json["_id"],
        mobile: json["mobile"],
        name: json["name"],
        email: json["email"],
    );

    Map<String, dynamic> toJson() => {
        "_id": id,
        "mobile": mobile,
        "name": name,
        "email": email,
    };
}
