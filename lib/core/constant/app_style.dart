import 'package:flutter/material.dart';
import 'package:islami_app/core/constant/app_color.dart';

class AppStyle {
  final Color color;

  AppStyle({this.color = Colors.white});

  // Headlines
  TextStyle get headlineLarge =>
      TextStyle(fontSize: 36, fontWeight: FontWeight.bold, color: color);

  TextStyle get titleLarge =>
      TextStyle(fontSize: 28, fontWeight: FontWeight.bold, color: color);

  TextStyle get titleMedium =>
      TextStyle(fontSize: 22, fontWeight: FontWeight.w700, color: color);

  TextStyle get titleSmall =>
      TextStyle(fontSize: 16, fontWeight: FontWeight.w700, color: color);

  // Body
  TextStyle get bodyLarge =>
      TextStyle(fontSize: 20, fontWeight: FontWeight.w500, color: color);

  TextStyle get bodyMedium =>
      TextStyle(fontSize: 16, fontWeight: FontWeight.w500, color: color);

  TextStyle get bodySmall =>
      TextStyle(fontSize: 14, fontWeight: FontWeight.w400, color: color);

  // Labels
  TextStyle get labelLarge =>
      TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: color);

  TextStyle get labelMedium => TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w600,
    color: AppColor.goldColor,
  );

  TextStyle get labelSmall => TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w500,
    color: AppColor.goldColor,
  );
}

// Arabic
