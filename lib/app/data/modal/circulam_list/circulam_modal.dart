// // To parse this JSON data, do
// //
// //     final circulamModalList = circulamModalListFromJson(jsonString);

// import 'dart:convert';

// CirculamModalList circulamModalListFromJson(String str) => CirculamModalList.fromJson(json.decode(str));

// String circulamModalListToJson(CirculamModalList data) => json.encode(data.toJson());

// class CirculamModalList {
//     int? code;
//     bool? success;
//     String? message;
//     List<circulumlist>? data;

//     CirculamModalList({
//         this.code,
//         this.success,
//         this.message,
//         this.data,
//     });

//     factory CirculamModalList.fromJson(Map<String, dynamic> json) => CirculamModalList(
//         code: json["code"],
//         success: json["success"],
//         message: json["message"],
//         data: json["data"] == null ? [] : List<circulumlist>.from(json["data"]!.map((x) => circulumlist.fromJson(x))),
//     );

//     Map<String, dynamic> toJson() => {
//         "code": code,
//         "success": success,
//         "message": message,
//         "data": data == null ? [] : List<dynamic>.from(data!.map((x) => x.toJson())),
//     };
// }

// class circulumlist {
//     String? heading;
//     List<String>? subHeading;
//     String? id;
//     CourseId? courseId;
//     DateTime? createdAt;
//     DateTime? updatedAt;
//     int? v;

//     circulumlist({
//         this.heading,
//         this.subHeading,
//         this.id,
//         this.courseId,
//         this.createdAt,
//         this.updatedAt,
//         this.v,
//     });

//     factory circulumlist.fromJson(Map<String, dynamic> json) => circulumlist(
//         heading: json["heading"],
//         subHeading: json["subHeading"] == null ? [] : List<String>.from(json["subHeading"]!.map((x) => x)),
//         id: json["_id"],
//         courseId: json["courseId"] == null ? null : CourseId.fromJson(json["courseId"]),
//         createdAt: json["createdAt"] == null ? null : DateTime.parse(json["createdAt"]),
//         updatedAt: json["updatedAt"] == null ? null : DateTime.parse(json["updatedAt"]),
//         v: json["__v"],
//     );

//     Map<String, dynamic> toJson() => {
//         "heading": heading,
//         "subHeading": subHeading == null ? [] : List<dynamic>.from(subHeading!.map((x) => x)),
//         "_id": id,
//         "courseId": courseId?.toJson(),
//         "createdAt": createdAt?.toIso8601String(),
//         "updatedAt": updatedAt?.toIso8601String(),
//         "__v": v,
//     };
// }

// class CourseId {
//     String? name;
//     String? title;
//     String? number;
//     List<String>? category;
//     String? image;
//     String? courseType;
//     String? description;
//     dynamic hide;
//     String? branch;
//     String? exam;
//     double? rating;
//     String? discount;
//     List<String>? discountCodes;
//     DateTime? discountValidity;
//     int? discountPrice;
//     String? id;
//     String? cost;
//     int? durationInMonths;
//     List<dynamic>? thumbnail;
//     DateTime? createdAt;
//     DateTime? updatedAt;
//     int? v;
//     List<Package>? packages;

//     CourseId({
//         this.name,
//         this.title,
//         this.number,
//         this.category,
//         this.image,
//         this.courseType,
//         this.description,
//         this.hide,
//         this.branch,
//         this.exam,
//         this.rating,
//         this.discount,
//         this.discountCodes,
//         this.discountValidity,
//         this.discountPrice,
//         this.id,
//         this.cost,
//         this.durationInMonths,
//         this.thumbnail,
//         this.createdAt,
//         this.updatedAt,
//         this.v,
//         this.packages,
//     });

//     factory CourseId.fromJson(Map<String, dynamic> json) => CourseId(
//         name: json["name"],
//         title: json["title"],
//         number: json["number"],
//         category: json["category"] == null ? [] : List<String>.from(json["category"]!.map((x) => x)),
//         image: json["image"],
//         courseType: json["courseType"],
//         description: json["description"],
//         hide: json["hide"],
//         branch: json["branch"],
//         exam: json["exam"],
//         rating: json["rating"]?.toDouble(),
//         discount: json["discount"],
//         discountCodes: json["discountCodes"] == null ? [] : List<String>.from(json["discountCodes"]!.map((x) => x)),
//         discountValidity: json["discountValidity"] == null ? null : DateTime.parse(json["discountValidity"]),
//         discountPrice: json["discountPrice"],
//         id: json["_id"],
//         cost: json["cost"],
//         durationInMonths: json["durationInMonths"],
//         thumbnail: json["thumbnail"] == null ? [] : List<dynamic>.from(json["thumbnail"]!.map((x) => x)),
//         createdAt: json["createdAt"] == null ? null : DateTime.parse(json["createdAt"]),
//         updatedAt: json["updatedAt"] == null ? null : DateTime.parse(json["updatedAt"]),
//         v: json["__v"],
//         packages: json["packages"] == null ? [] : List<Package>.from(json["packages"]!.map((x) => Package.fromJson(x))),
//     );

//     Map<String, dynamic> toJson() => {
//         "name": name,
//         "title": title,
//         "number": number,
//         "category": category == null ? [] : List<dynamic>.from(category!.map((x) => x)),
//         "image": image,
//         "courseType": courseType,
//         "description": description,
//         "hide": hide,
//         "branch": branch,
//         "exam": exam,
//         "rating": rating,
//         "discount": discount,
//         "discountCodes": discountCodes == null ? [] : List<dynamic>.from(discountCodes!.map((x) => x)),
//         "discountValidity": discountValidity?.toIso8601String(),
//         "discountPrice": discountPrice,
//         "_id": id,
//         "cost": cost,
//         "durationInMonths": durationInMonths,
//         "thumbnail": thumbnail == null ? [] : List<dynamic>.from(thumbnail!.map((x) => x)),
//         "createdAt": createdAt?.toIso8601String(),
//         "updatedAt": updatedAt?.toIso8601String(),
//         "__v": v,
//         "packages": packages == null ? [] : List<dynamic>.from(packages!.map((x) => x.toJson())),
//     };
// }

// class Package {
//     String? name;
//     int? price;
//     String? discount;
//     int? discountPrice;
//     DateTime? discountValidity;
//     int? duration;
//     String? description;
//     String? id;

//     Package({
//         this.name,
//         this.price,
//         this.discount,
//         this.discountPrice,
//         this.discountValidity,
//         this.duration,
//         this.description,
//         this.id,
//     });

//     factory Package.fromJson(Map<String, dynamic> json) => Package(
//         name: json["name"],
//         price: json["price"],
//         discount: json["discount"],
//         discountPrice: json["discountPrice"],
//         discountValidity: json["discountValidity"] == null ? null : DateTime.parse(json["discountValidity"]),
//         duration: json["duration"],
//         description: json["description"],
//         id: json["_id"],
//     );

//     Map<String, dynamic> toJson() => {
//         "name": name,
//         "price": price,
//         "discount": discount,
//         "discountPrice": discountPrice,
//         "discountValidity": discountValidity?.toIso8601String(),
//         "duration": duration,
//         "description": description,
//         "_id": id,
//     };
// }