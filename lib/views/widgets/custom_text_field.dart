import 'package:e_waris/core/contants/app_colors.dart';
import 'package:e_waris/core/utils/app_utils.dart';
import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final String hintText;
  final TextEditingController controller;
  final double borderRadius;
  final Color borderColor;
  final double borderWidth;

  const CustomTextField({
    super.key,
    required this.hintText,
    required this.controller,
    this.borderRadius = 8,
    this.borderColor = AppColors.textFieldBorder,
    this.borderWidth = 1,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      style: Theme.of(context).textTheme.bodyMedium,

      decoration: InputDecoration(
        hintText: hintText,

        // Hint Style
        hintStyle: AppUtils.hintStyle,

        // Enabled Border
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(borderRadius),
          borderSide: BorderSide(
            color: borderColor,
            width: borderWidth,
          ),
        ),

        // Focused Border
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(borderRadius),
          borderSide: BorderSide(
            color: borderColor,
            width: borderWidth,
          ),
        ),
      ),
    );
  }
}