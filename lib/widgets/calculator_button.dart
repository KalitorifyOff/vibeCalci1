import 'package:flutter/material.dart';

class CalculatorButton extends StatelessWidget {
  final String text;
  final Color color;
  final Color textColor;
  final VoidCallback onPressed;

  const CalculatorButton({
    super.key,
    required this.text,
    this.color = const Color(0xFFE0E0E0), // Light Gray
    this.textColor = Colors.black,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final fontSize = screenWidth * 0.08; // 8% of screen width

    return Container(
      margin: const EdgeInsets.all(4.0),
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: color,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(40.0), // Rounded corners
          ),
          padding: EdgeInsets.zero, // Remove default padding
        ),
        child: Text(
          text,
          style: TextStyle(
            color: textColor,
            fontSize: fontSize,
            fontWeight: FontWeight.normal,
          ),
        ),
      ),
    );
  }
}
