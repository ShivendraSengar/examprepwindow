// import 'package:exam_prep_tool/app/modules/terms_conditionscreen/views/terms_conditionscreen_view.dart';
import 'package:flutter/material.dart';

class WaveCustomPaint extends CustomPainter {
  Color backgroundColor;
  WaveCustomPaint({required this.backgroundColor});

  @override
  void paint(Canvas canvas, Size size) {
    var painter = Paint()
      ..color = backgroundColor
      ..strokeWidth = 1
      ..style = PaintingStyle.fill;
    var path = Path();
    var height = size.height;
    var width = size.width;

    path.moveTo(0, height / 3.0 + height / 7);
    var des1 = width / 4.5;
    var des2 = height / 3.6 + height / 10; //height/5 /2
    path.quadraticBezierTo(des1, des2, width / 2, height / 3.0 + height / 10);
    path.quadraticBezierTo(
        width / 2 + width / 4, height / 3 + height / 7, width, height / 3.3);
    path.lineTo(width, height);
    path.lineTo(0, height);
    path.lineTo(0, height / 2 + height / 2);
    path.close();
    canvas.drawPath(path, painter);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}
