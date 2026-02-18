import 'package:body/config/constant/app_colors.dart';
import 'package:body/config/style/app_text_style.dart';
import 'package:flutter/material.dart';

final darkTheme = ThemeData(
  useMaterial3: true,
  brightness: Brightness.dark,
  scaffoldBackgroundColor: AppColors.neutral900,
  primaryColor: AppColors.primary,

  textTheme: AppTextStyle.darkTheme,
  cardColor: AppColors.primary400,

  appBarTheme: AppBarTheme(backgroundColor: AppColors.neutral950),

  colorScheme: ColorScheme.light(
    brightness: Brightness.dark,
    primary: AppColors.primary,
    onPrimary: AppColors.neutral50,
  ),
);
