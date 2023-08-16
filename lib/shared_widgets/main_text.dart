import 'package:flutter/material.dart';

import '../res/colors/app_colors.dart';

class MainText extends StatelessWidget {
  const MainText(
      {super.key,
      required this.text,
      this.fontSize = 16.0,
      this.color = AppColors.TEXT_DARK,
      this.fontWeight = FontWeight.normal});
  final String text;
  final double fontSize;
  final Color color;
  final FontWeight fontWeight;
  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        fontSize: fontSize,
        color: color,
        fontWeight: fontWeight,
      ),
    );
  }
}
