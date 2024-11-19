
import 'dart:convert';

CoursesCategory coursesCategoryFromJson(String str) => CoursesCategory.fromJson(json.decode(str));

String coursesCategoryToJson(CoursesCategory data) => json.encode(data.toJson());

class CoursesCategory {
    int? code;
    bool? success;
    String? message;
    List<Categories>? data;

    CoursesCategory({
        this.code,
        this.success,
        this.message,
        this.data,
    });

    factory CoursesCategory.fromJson(Map<String, dynamic> json) => CoursesCategory(
        code: json["code"],
        success: json["success"],
        message: json["message"],
        data: json["data"] == null ? [] : List<Categories>.from(json["data"]!.map((x) => Categories.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "code": code,
        "success": success,
        "message": message,
        "data": data == null ? [] : List<dynamic>.from(data!.map((x) => x.toJson())),
    };
}

class Categories {
    String? id;
    String? category;
    String? image;
    int? priority;
    String? batchTitle;
    String? bannerImage;
    String? description;
    DateTime? createdAt;
    DateTime? updatedAt;
    int? v;
    String? batchImage;

    Categories({
        this.id,
        this.category,
        this.image,
        this.priority,
        this.batchTitle,
        this.bannerImage,
        this.description,
        this.createdAt,
        this.updatedAt,
        this.v,
        this.batchImage,
    });

    factory Categories.fromJson(Map<String, dynamic> json) => Categories(
        id: json["_id"],
        category: json["category"],
        image: json["image"],
        priority: json["priority"],
        batchTitle: json["batchTitle"],
        bannerImage: json["bannerImage"],
        description: json["description"],
        createdAt: json["createdAt"] == null ? null : DateTime.parse(json["createdAt"]),
        updatedAt: json["updatedAt"] == null ? null : DateTime.parse(json["updatedAt"]),
        v: json["__v"],
        batchImage: json["batchImage"],
    );

    Map<String, dynamic> toJson() => {
        "_id": id,
        "category": category,
        "image": image,
        "priority": priority,
        "batchTitle": batchTitle,
        "bannerImage": bannerImage,
        "description": description,
        "createdAt": createdAt?.toIso8601String(),
        "updatedAt": updatedAt?.toIso8601String(),
        "__v": v,
        "batchImage": batchImage,
    };
}
