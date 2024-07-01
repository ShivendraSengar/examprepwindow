class Data {
  String? id;
  String? referral;
  String? exam;
  String? userType;
  String? name;
  String? email;
  String? branch;
  String? token;
  String? mobile;

  Data({
    this.id,
    this.referral,
    this.exam,
    this.userType,
    this.name,
    this.email,
    this.branch,
    this.token,
    this.mobile,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        id: json['_id'] as String?,
        referral: json['referral'] as String?,
        exam: json['exam'] as String?,
        userType: json['userType'] as String?,
        name: json['name'] as String?,
        email: json['email'] as String?,
        branch: json['branch'] as String?,
        token: json['token'] as String?,
        mobile: json['mobile'] as String?,
      );

  Map<String, dynamic> toJson() => {
        '_id': id,
        'referral': referral,
        'exam': exam,
        'userType': userType,
        'name': name,
        'email': email,
        'branch': branch,
        'token': token,
        'mobile': mobile,
      };
}
