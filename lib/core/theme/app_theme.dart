import 'package:e_waris/core/contants/app_colors.dart';
import 'package:flutter/material.dart';

class AppTheme {

  static ThemeData lightTheme = ThemeData(
    useMaterial3: true,
    primaryColor: AppColors.kCPrimary,
    // Scaffold Background
    scaffoldBackgroundColor: AppColors.kCWhite,
// Primary Color Scheme
    colorScheme: ColorScheme.fromSeed(
      seedColor: AppColors.kCPrimary,
      brightness: Brightness.light,
    ),
// AppBar Theme
    appBarTheme: const AppBarTheme(
      backgroundColor: AppColors.kCPrimary,
      foregroundColor: AppColors.kCWhite,
      centerTitle: true,
      elevation: 0,
    ),
// Elevated Button Theme
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.kCPrimary,
        foregroundColor: AppColors.kCWhite,
        minimumSize: const Size(double.infinity, 55),
        padding: const EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 14,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(14),
        ),
      ),
    ),
    // Input Decoration Theme
    inputDecorationTheme: InputDecorationTheme(
      focusedBorder: OutlineInputBorder(
        borderSide: const BorderSide(
          color:  AppColors.kCWhite,
          width: 2,
        ),
        borderRadius: BorderRadius.circular(12),
      ),
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(
          color: Colors.grey.shade300,
        ),
        borderRadius: BorderRadius.circular(12),
      ),
    ),
    // Floating Action Button Theme
    floatingActionButtonTheme: const FloatingActionButtonThemeData(
      backgroundColor:  AppColors.kCWhite,
      foregroundColor: Colors.white,
    ),

  );
}