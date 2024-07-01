import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:hexcolor/hexcolor.dart';

class MyCustomTextField extends StatelessWidget {
  final String hintText;
  final IconData prefixIcon;
  final IconData suffixIcon;
  final ValueChanged<String> onChanged;
  final TextEditingController controller;

  MyCustomTextField({
    required this.hintText,
    required this.prefixIcon,
    required this.suffixIcon,
    required this.onChanged,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: HexColor("#F3FFFF"), // Use your desired color here
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(30),
        ),
      ),
      elevation: 3.0,
      clipBehavior: Clip.antiAliasWithSaveLayer,
      child: Container(
        alignment: Alignment.center,
        height: 60,
        child: TextFormField(
          controller: controller,
          keyboardType: TextInputType.emailAddress, // Set the email input type
          decoration: InputDecoration(
            prefixIcon: Icon(prefixIcon, color: Colors.grey),
            hintText: hintText,
            border: InputBorder.none,
          ),
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Please enter an email';
            } else if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$',
                    caseSensitive: false)
                .hasMatch(value)) {
              return 'Please enter a valid email';
            }
            return null;
          },
        ).paddingSymmetric(horizontal: 8),
      ),
    ).paddingSymmetric(horizontal: 0);
  }
}
