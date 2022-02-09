import 'package:flutter/material.dart';
import 'package:omdb_app/services/constants.dart';

Widget glowButton(
    {required String title,
    required VoidCallback onClick,
    required bool isPressed}) {
  Color buttonColor = pink;
  if (!isPressed) {
    buttonColor = Colors.grey.shade900;
  }
  return GestureDetector(
    onTap: onClick,
    child: AnimatedContainer(
      duration: const Duration(milliseconds: 100),
      padding: EdgeInsets.symmetric(
        horizontal: isPressed ? 20 : 15,
        vertical: 10,
      ),
      decoration: BoxDecoration(
        color: buttonColor,
        borderRadius: BorderRadius.circular(5),
        boxShadow: [
          BoxShadow(
            color: buttonColor.withAlpha(60),
            blurRadius: 6.0,
            spreadRadius: 5.0,
            offset: const Offset(0.0, 3.0),
          ),
          BoxShadow(
            color: buttonColor.withAlpha(60),
            blurRadius: 6.0,
            spreadRadius: 5.0,
            offset: const Offset(0.0, -3.0),
          ),
        ],
      ),
      child: Text(
        title,
        style: TextStyle(
          color: Colors.white,
          fontSize: isPressed ? 15 : 12,
          fontWeight: FontWeight.bold,
        ),
      ),
    ),
  );
}
