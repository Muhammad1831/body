import 'package:body/config/constant/app_colors.dart';
import 'package:flutter/material.dart';

abstract class AppTextStyle {
  AppTextStyle._();

  static const TextTheme darkTheme = TextTheme(
    // dispaly
    displayLarge: TextStyle(fontSize: 48, color: AppColors.neutral50),
    displayMedium: TextStyle(fontSize: 36, color: AppColors.neutral50),
    displaySmall: TextStyle(fontSize: 32, color: AppColors.neutral50),
    // headline
    headlineLarge: TextStyle(fontSize: 32, color: AppColors.neutral50, fontWeight: FontWeight.w700),
    headlineMedium: TextStyle(
      fontSize: 24,
      color: AppColors.neutral50,
      fontWeight: FontWeight.w700,
    ),
    headlineSmall: TextStyle(
      fontSize: 20,
      color: AppColors.neutral900,
      fontWeight: FontWeight.w500,
    ),
    // title
    titleLarge: TextStyle(fontSize: 24, color: AppColors.neutral50, fontWeight: FontWeight.w500),
    titleMedium: TextStyle(fontSize: 18, color: AppColors.neutral50, fontWeight: FontWeight.w500),
    titleSmall: TextStyle(fontSize: 16, color: AppColors.neutral50, fontWeight: FontWeight.w500),
    // body
    bodyLarge: TextStyle(fontSize: 20, color: AppColors.neutral50, fontWeight: FontWeight.w400),
    bodyMedium: TextStyle(fontSize: 16, color: AppColors.neutral50, fontWeight: FontWeight.w400),
    bodySmall: TextStyle(fontSize: 14, color: AppColors.neutral50, fontWeight: FontWeight.w400),
    // label
    labelLarge: TextStyle(fontSize: 14, color: AppColors.neutral50, fontWeight: FontWeight.w500),
    labelMedium: TextStyle(fontSize: 12, color: AppColors.neutral50, fontWeight: FontWeight.w400),
    labelSmall: TextStyle(fontSize: 10, color: AppColors.neutral50, fontWeight: FontWeight.w500),
  );
}
