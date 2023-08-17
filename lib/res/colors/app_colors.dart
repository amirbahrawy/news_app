import 'package:flutter/material.dart';

class AppColors {
  static const PRIMARY_COLOR = Colors.deepPurple;
  static const Color ACCENT_COLOR = Colors.purple;
  static const Color TEXT_LIGHT = Color(0xFFFFFFFF);
  static const Color TEXT_DARK = Color(0xFF000000);
  static const Color TEXT_GREY = Color(0xFF9E9E9E);
  static const Color BACKGROUND_COLOR = Color(0xFFE0E0E0);
  static const LinearGradient PRIMARY_GRADIENT = LinearGradient(
    colors: [
      AppColors.ACCENT_COLOR,
      Colors.deepPurpleAccent,
    ],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );
}
