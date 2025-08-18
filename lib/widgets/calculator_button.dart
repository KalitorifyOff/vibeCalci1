import 'package:flutter/material.dart';

class CalculatorButton extends StatelessWidget {
  final String text;
  final Color color;
  final Color textColor;
  final double fontSize;
  final VoidCallback onPressed;
  final bool bigButton;

  const CalculatorButton({
    super.key,
    required this.text,
    this.color = const Color(0xFFE0E0E0), // Light Gray
    this.textColor = Colors.black,
    this.fontSize = 32.0,
    required this.onPressed,
    this.bigButton = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(4.0),
      child: SizedBox(
        width: bigButton ? 160.0 : 75.0, // Approximate width for double button
        height: 75.0,
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
      ),
    );
  }
}
