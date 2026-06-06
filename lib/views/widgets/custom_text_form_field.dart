import 'package:e_waris/core/utils/app_utils.dart';
import 'package:flutter/material.dart';
import '../../core/constants/app_colors.dart';

class CustomTextFormField extends StatelessWidget {
  final double height;
  final double size;
  final String hintText;
  final double borderRadius;
  final Color borderColor;
  final double borderWidth;
  final String? labelText;
  final bool obscureText;
  final TextInputType keyboardType;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final int maxLines;
  final String? Function(String?)? validator;
  final TextEditingController controller;
  final VoidCallback? onTap;

  const CustomTextFormField({
    super.key,
    this.size = 14.0,
    this.height = 85.0,
    required this.hintText,
    this.borderRadius = 8,
    this.borderColor = AppColors.primary,
    this.borderWidth = 1,
    this.labelText,
    this.obscureText = false,
    this.keyboardType = TextInputType.text,
    this.prefixIcon,
    this.suffixIcon,
    this.maxLines = 1,
    this.validator,
    required this.controller,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      child: TextFormField(
        onTap: onTap,
        controller: controller,
        validator: validator,
        textAlignVertical: TextAlignVertical.top,
        maxLines: maxLines, // Allows the TextField to grow with content
        // expands: true,
        obscuringCharacter: '*',
        obscureText: obscureText,
        keyboardType: keyboardType,
        style: Theme.of(context).textTheme.bodyMedium,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        decoration: InputDecoration(
          hintText: hintText,
          // Hint Style
          hintStyle: AppUtils.hintStyle,
          prefix: prefixIcon,
          suffixIcon: suffixIcon,
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(borderRadius),
              borderSide:  BorderSide(color:  borderColor)),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(borderRadius),
              borderSide: BorderSide(color:  borderColor)),
          errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(borderRadius),
              borderSide:  BorderSide(color: AppColors.red)),
          focusedErrorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(borderRadius),
              borderSide:  BorderSide(color:  AppColors.red)),
        ),
      ),
    );
  }
}