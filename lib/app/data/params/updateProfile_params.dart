// To parse this JSON data, do
//
//     final updateProfileParams = updateProfileParamsFromJson(jsonString);

import 'dart:convert';

UpdateProfileParams updateProfileParamsFromJson(String str) =>
    UpdateProfileParams.fromJson(json.decode(str));

String updateProfileParamsToJson(UpdateProfileParams data) =>
    json.encode(data.toJson());

class UpdateProfileParams {
  String? branch;
  String? email;
  String? exam;
  String? image;
  List<String>? language;
  String? name;
  String? id;
  String? mobile;

  UpdateProfileParams({
    this.branch,
    this.email,
    this.exam,
    this.image,
    this.language,
    this.name,
    this.id,
    this.mobile,
  });

  factory UpdateProfileParams.fromJson(Map<String, dynamic> json) =>
      UpdateProfileParams(
        branch: json["branch"],
        email: json["email"],
        exam: json["exam"],
        image: json["image"],
        language: json["language"] == null
            ? []
            : List<String>.from(json["language"]!.map((x) => x)),
        name: json["name"],
        id: json["_id"],
        mobile: json["mobile"],
      );

  Map<String, dynamic> toJson() => {
        "branch": branch,
        "email": email,
        "exam": exam,
        "image": image,
        "language":
            language == null ? [] : List<dynamic>.from(language!.map((x) => x)),
        "name": name,
        "_id": id,
        "mobile": mobile,
      };
}
