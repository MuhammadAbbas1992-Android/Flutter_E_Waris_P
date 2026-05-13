import 'package:e_waris/core/contants/app_colors.dart';
import 'package:e_waris/core/contants/app_fonts.dart';
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
        //minimumSize: const Size(double.infinity, 40),
        // Remove fixed width
        minimumSize: Size.zero,
        padding: const EdgeInsets.symmetric(
          horizontal: 20,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5),
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
          color: AppColors.kCGrey,
        ),
        borderRadius: BorderRadius.circular(12),
      ),
    ),
    // Floating Action Button Theme
    floatingActionButtonTheme: const FloatingActionButtonThemeData(
      backgroundColor:  AppColors.kCWhite,
      foregroundColor: Colors.white,
    ),

    textTheme: const TextTheme(

      // Large Heading
      headlineLarge: TextStyle(
        fontSize: 30,
        fontFamily: AppFonts.robotoExtraBold,
        color: Colors.black,
      ),

      // Medium Heading
      headlineMedium: TextStyle(
        fontSize: 24,
        fontFamily: AppFonts.robotoBold,
        color: Colors.black,
      ),

      // Small Heading
      headlineSmall: TextStyle(
        fontSize: 18,
        fontFamily: AppFonts.robotoBold,
        color: Colors.black,
      ),

      // Title
      titleLarge: TextStyle(
        fontSize: 18,
        fontFamily: AppFonts.robotoSemiBold,
        color: Colors.black,
      ),

      titleMedium: TextStyle(
        fontSize: 16,
        fontFamily: AppFonts.robotoSemiBold,
        color: Colors.black87,
      ),

      titleSmall: TextStyle(
        fontSize: 14,
        fontFamily: AppFonts.robotoSemiBold,
        color: Colors.black87,
      ),

      // Body Text
      bodyLarge: TextStyle(
        fontSize: 15,
        fontFamily: AppFonts.robotoSemiBold,
        color: Colors.black,
      ),

      bodyMedium: TextStyle(
        fontSize: 15,
        fontFamily: AppFonts.robotoRegular,
        color: Colors.black87,
      ),

      // Button Text
      labelLarge: TextStyle(
        fontSize: 14,
        fontFamily: AppFonts.robotoSemiBold,
        color: Colors.black,
      ),

    ),
  );
  }