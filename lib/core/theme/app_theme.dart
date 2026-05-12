import 'package:e_waris/core/contants/app_colors.dart';
import 'package:flutter/material.dart';

class AppTheme {

  static ThemeData lightTheme = ThemeData(
    useMaterial3: true,
    primaryColor: AppColors.kCPrimary,
    scaffoldBackgroundColor: AppColors.kCWhite,

    colorScheme: ColorScheme.fromSeed(
      seedColor: AppColors.kCPrimary,
    ),

    appBarTheme: const AppBarTheme(
      backgroundColor: AppColors.kCPrimary,
      foregroundColor: AppColors.kCWhite,
      centerTitle: true,
    ),

    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.kCPrimary,
        foregroundColor: AppColors.kCWhite,
        minimumSize: const Size(double.infinity, 55),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(14),
        ),
      ),
    ),
  );
}