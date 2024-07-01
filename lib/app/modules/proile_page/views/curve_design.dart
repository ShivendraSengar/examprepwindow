import 'package:flutter/material.dart';

class CustomDesign extends CustomPainter {
  Color backgroundColor;
  CustomDesign({required this.backgroundColor});

  @override
  void paint(Canvas canvas, Size size) {
    var painter = Paint()
      ..color = backgroundColor
      ..strokeWidth = 1
      ..style = PaintingStyle.fill;
    var path = Path();
    var height = size.height;
    var width = size.width;

    path.moveTo(0, height / 10.0 + height / 19);
    var des1 = width / 7;
    var des2 = height / 10 + height / 8; //height/5 /2
    path.quadraticBezierTo(des1, des2, width / 2, height / 8.0 + height / 9);
    path.quadraticBezierTo(
        width / 3 + width / 9, height / 15 + height / 13, width, height / 17);
    path.lineTo(width, height);
    path.lineTo(0, height);
    path.lineTo(0, height / 10 + height / 16);
    path.close();
    canvas.drawPath(path, painter);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}
