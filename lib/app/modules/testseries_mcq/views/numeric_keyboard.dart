import 'package:flutter/material.dart';

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
      width: 250,
      padding: const EdgeInsets.all(10),
      color: Colors.grey[200],
      child: GridView.builder(
        shrinkWrap: true,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          childAspectRatio: 1.5,
        ),
        itemCount: 12, // 10 digits, backspace, and clear
        itemBuilder: (context, index) {
          if (index < 9) {
            // For digits 1-9
            return GestureDetector(
              onTap: () => onKeyTap((index + 1).toString()),
              child: Container(
                margin: const EdgeInsets.all(5),
                alignment: Alignment.center,
                color: Colors.blueAccent,
                child: Text(
                  (index + 1).toString(),
                  style: const TextStyle(fontSize: 22, color: Colors.white),
                ),
              ),
            );
          } else if (index == 9) {
            // For digit 0
            return GestureDetector(
              onTap: () => onKeyTap("0"),
              child: Container(
                margin: const EdgeInsets.all(5),
                alignment: Alignment.center,
                color: Colors.blueAccent,
                child: const Text(
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
                margin: const EdgeInsets.all(5),
                alignment: Alignment.center,
                color: Colors.redAccent,
                child: const Icon(
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
                margin: const EdgeInsets.all(5),
                alignment: Alignment.center,
                color: Colors.orangeAccent,
                child: const Text(
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
