import 'package:exam_prep_tool/app/data/modal/test_series/weekley_testSeries_modal.dart';
import 'package:exam_prep_tool/app/modules/testseries_mcq/controllers/testseries_mcq_controller.dart';
import 'package:exam_prep_tool/app/widgets/custom_numeric_keyboard.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';

import 'package:exam_prep_tool/app/routes/app_pages.dart';

import 'package:flutter/widgets.dart';

import 'package:get/get.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:velocity_x/velocity_x.dart';
class NumericKeyboardExample extends StatefulWidget {
  @override
  _NumericKeyboardExampleState createState() => _NumericKeyboardExampleState();
}

class _NumericKeyboardExampleState extends State<NumericKeyboardExample> {
  final TextEditingController _inputController = TextEditingController();
  bool _showKeyboard = false; // To manage the visibility of the custom keyboard

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextField(
          controller: _inputController,
          focusNode: FocusNode(), // Prevent the default keyboard from showing
          keyboardType: TextInputType.none, // Disable default keyboard
          decoration: const InputDecoration(
            labelText: "Enter your answer",
          ),
          onTap: () {
            setState(() {
              _showKeyboard = true; // Show custom keyboard on tap
            });
          },
        ),
        
        if (_showKeyboard)
          NumericKeyboard(
            onKeyTap: (value) {
              // Append the tapped value to the TextField
              setState(() {
                _inputController.text += value;
              });
            },
            onBackspace: () {
              // Handle backspace
              if (_inputController.text.isNotEmpty) {
                setState(() {
                  _inputController.text = _inputController.text
                      .substring(0, _inputController.text.length - 1);
                });
              }
            },
            onClear: () {
              // Clear the TextField
              setState(() {
                _inputController.clear();
              });
            },
          ),
      ],
    );
  }
}