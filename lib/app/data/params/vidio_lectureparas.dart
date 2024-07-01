class VidioLectureparas {
  String? exam;
  String? subject;
  String? uploadType;

  VidioLectureparas({this.exam, this.subject, this.uploadType});

  factory VidioLectureparas.fromJson(Map<String, dynamic> json) {
    return VidioLectureparas(
      exam: json['exam'] as String?,
      subject: json['subject'] as String?,
      uploadType: json['uploadType'] as String?,
    );
  }

  Map<String, dynamic> toJson() => {
        'exam': exam,
        'subject': subject,
        'uploadType': uploadType,
      };
}
