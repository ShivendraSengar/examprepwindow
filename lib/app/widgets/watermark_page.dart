import 'dart:math';

import 'package:flutter/material.dart';

class Watarmark extends StatelessWidget {
  final int rowCount;
  final int columnCount;
  final String text;
  final String title;

  const Watarmark(
      {Key? key,
      required this.rowCount,
      required this.columnCount,
      required this.title,
      required this.text})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IgnorePointer(
      child: Container(
          child: Column(
        children: creatColumnWidgets(),
      )),
    );
  }

  List<Widget> creatRowWdiges() {
    List<Widget> list = [];
    for (var i = 0; i < rowCount; i++) {
      final widget = Expanded(
          child: Center(
              child: Transform.rotate(
        angle: -pi / 10,
        child: Column(
          children: [
            Text(
              title,
              style: TextStyle(
                  color: Colors.blue.withOpacity(.4), // Color(0x08000000),
                  fontSize: 14,
                  decoration: TextDecoration.none),
            ),
            Text(
              text,
              style: TextStyle(
                  color: Colors.blue.withOpacity(.4), // Color(0x08000000),
                  fontSize: 14,
                  decoration: TextDecoration.none),
            ),
          ],
        ),
      )));
      list.add(widget);
    }
    return list;
  }

  List<Widget> creatColumnWidgets() {
    List<Widget> list = [];
    for (var i = 0; i < columnCount; i++) {
      final widget = Expanded(
          child: Row(
        children: creatRowWdiges(),
      ));
      list.add(widget);
    }
    return list;
  }
}
