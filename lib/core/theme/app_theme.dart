import 'package:flutter/material.dart';
import '../constants/app_colors.dart';

class AppTheme {

  static ThemeData lightTheme = ThemeData(
    useMaterial3: true,
    primaryColor: AppColors.primary,
    // Scaffold Background
    scaffoldBackgroundColor: AppColors.white,
// Primary Color Scheme
    colorScheme: ColorScheme.fromSeed(
      seedColor: AppColors.primary,
      brightness: Brightness.light,
    ),
// AppBar Theme
    appBarTheme: AppBarTheme(
      backgroundColor: AppColors.white,
      foregroundColor: AppColors.primary,
      centerTitle: true,
      elevation: 0,
    ),

    // Input Decoration Theme
    inputDecorationTheme: InputDecorationTheme(
      focusedBorder: OutlineInputBorder(
        borderSide: const BorderSide(
          color:  AppColors.white,
          width: 2,
        ),
        borderRadius: BorderRadius.circular(12),
      ),
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(
          color: AppColors.grey,
        ),
        borderRadius: BorderRadius.circular(12),
      ),
    ),
    // Floating Action Button Theme
    floatingActionButtonTheme: const FloatingActionButtonThemeData(
      backgroundColor:  AppColors.white,
      foregroundColor: AppColors.white,
    ),

  );
  }