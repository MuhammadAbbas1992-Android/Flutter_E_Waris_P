import 'package:flutter/material.dart';
import '../constants/app_colors.dart';
import '../constants/app_fonts.dart';

class AppUtils{
  static const dbName='EWaris';
  static String userId='userId';
  static const nominees='Nominees';
  static const assets='Assets';
  static final TextStyle hintStyle = TextStyle(
    fontSize: 13,
    fontFamily: AppFonts.robotoRegular,
    color: AppColors.grey,
  );


  static void showSnack({required BuildContext context, required String msg, bool isError = false}) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(msg),
        backgroundColor: isError ? Colors.redAccent : AppColors.primary,
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      ),
    );
  }

  static String? validateFieldStringData(String? value, String field) {
  if (value == null || value.isEmpty) {
  return 'Please enter $field';
  }
  return null;
  }

  static String? validateFieldNumericData(String? value, String field) {
  if (value == null || value.isEmpty) {
  return 'Please enter $field';
  }
  // Check if the value is a valid number
  if (double.tryParse(value) == null) {
  return 'Please enter a valid numeric value for $field';
  }
  return null; // Return null if validation passes
  }

  static String? validateEmail(String? email) {
    if (email == null || email.isEmpty) {
      return 'Please enter email';
    } else {
      email = email.trim();
      final emailRegex = RegExp(
        r"^[a-zA-Z0-9.!#$%&\'*+/=?^_`{|}~-]+@[a-zA-Z0-9-]+(?:\.[a-zA-Z]{2,})+$",
      );

      return emailRegex.hasMatch(email) ? null : "Please enter a valid email";
    }
  }

  static String? validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter a password';
    }
    if (value.length < 6) {
      return 'Requires at least 6 characters';
    }
    return null;
  }

  static String? validateConfirmPassword(String? value, String password) {
    if (value == null || value.isEmpty) {
      return 'Confirm password is required';
    }
    if (value != password) {
      return 'Passwords do not match';
    }
    return null;
  }

  static String? validateFieldData(String? value, String field) {
    if (value == null || value.isEmpty) {
      return 'Please enter $field';
    }
    return null;
  }

  static String? validateDropDownItem(String value, String choice) {
    if (value == choice) {
      return 'Please select an item from dropdown ';
    }
    return null;
  }
}