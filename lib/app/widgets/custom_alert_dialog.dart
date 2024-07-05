import 'package:flutter/material.dart';

class CustomAlertBox extends StatelessWidget {
  final String title;
  final String message;
  final VoidCallback onOkPressed;

  CustomAlertBox(
      {required this.title, required this.message, required this.onOkPressed});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.grey.shade200,
      title: Text(title),
      contentTextStyle: TextStyle(color: Colors.amber),
      content: Text(
        message,
        style: TextStyle(color: Colors.amber),
      ),
      actions: [
        //TextButton(
        //  onPressed: () {
        //    Navigator.of(context).pop(); // Close the alert box
        //  },
        //  child: Text('Cancel'),
        //),
        TextButton(
          onPressed: onOkPressed,
          child: Text('OK'),
        ),
      ],
    );
  }
}
