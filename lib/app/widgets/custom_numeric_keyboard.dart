
import 'package:exam_prep_tool/app/data/modal/test_series/weekley_testSeries_modal.dart';
import 'package:exam_prep_tool/app/modules/testseries_mcq/controllers/testseries_mcq_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';

import 'package:exam_prep_tool/app/routes/app_pages.dart';

import 'package:flutter/widgets.dart';

import 'package:get/get.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
class NumericKeyboard extends StatelessWidget {
  final Function(String) onKeyTap;
  final VoidCallback onBackspace;
  final VoidCallback onClear;

  NumericKeyboard({
    required this.onKeyTap,
    required this.onBackspace,
    required this.onClear,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      color: Colors.grey[200],
      child: GridView.builder(
        shrinkWrap: true,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          childAspectRatio: 2.5,
        ),
        itemCount: 12, // 10 digits, backspace, and clear
        itemBuilder: (context, index) {
          if (index < 9) {
            // For digits 1-9
            return GestureDetector(
              onTap: () {
                onKeyTap((index + 1).toString());
              },
              child: Container(
                margin: EdgeInsets.all(5),
                alignment: Alignment.center,
                color: Colors.blueAccent,
                child: Text(
                  (index + 1).toString(),
                  style: TextStyle(fontSize: 22, color: Colors.white),
                ),
              ),
            );
          } else if (index == 9) {
            // For digit 0
            return GestureDetector(
              onTap: () {
                onKeyTap("0");
              },
              child: Container(
                margin: EdgeInsets.all(5),
                alignment: Alignment.center,
                color: Colors.blueAccent,
                child: Text(
                  "0",
                  style: TextStyle(fontSize: 22, color: Colors.white),
                ),
              ),
            );
          } else if (index == 10) {
            // Backspace button
            return GestureDetector(
              onTap: onBackspace,
              child: Container(
                margin: EdgeInsets.all(5),
                alignment: Alignment.center,
                color: Colors.redAccent,
                child: Icon(
                  Icons.backspace,
                  color: Colors.white,
                ),
              ),
            );
          } else {
            // Clear button
            return GestureDetector(
              onTap: onClear,
              child: Container(
                margin: EdgeInsets.all(5),
                alignment: Alignment.center,
                color: Colors.orangeAccent,
                child: Text(
                  "Clear",
                  style: TextStyle(fontSize: 18, color: Colors.white),
                ),
              ),
            );
          }
        },
      ),
    );
  }
}