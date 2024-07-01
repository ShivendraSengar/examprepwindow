class ProfileUpdated {
  bool? success;
  String? msg;

  ProfileUpdated({this.success, this.msg});

  factory ProfileUpdated.fromJson(Map<String, dynamic> json) {
    return ProfileUpdated(
      success: json['success'] as bool?,
      msg: json['msg'] as String?,
    );
  }

  Map<String, dynamic> toJson() => {
        'success': success,
        'msg': msg,
      };
}
