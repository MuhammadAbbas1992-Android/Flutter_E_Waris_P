import 'package:e_waris/core/contants/app_colors.dart';
import 'package:e_waris/core/contants/app_fonts.dart';
import 'package:flutter/material.dart';

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
      backgroundColor: AppColors.primary,
      foregroundColor: AppColors.white,
      centerTitle: true,
      elevation: 0,
    ),
// Elevated Button Theme
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.primary,
        foregroundColor: AppColors.white,
        //minimumSize: const Size(double.infinity, 40),
        // Remove fixed width
        minimumSize: Size.zero,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
      ),
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