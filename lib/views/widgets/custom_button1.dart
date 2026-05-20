import 'package:e_waris/views/widgets/custom_text.dart';
import 'package:flutter/material.dart';
import '../../core/constants/app_colors.dart';
import '../../core/constants/app_fonts.dart';

class CustomButton1 extends StatelessWidget {
  final bool isLoading;
  final String btnText;
  final double? btnWidth;
  final double? btnHeight;
  final VoidCallback? onPressed;

  // Customization
  final Color? textColor;
  final double? borderRadius;
  final Color? borderColor;
  final double? borderWidth;
  final Color? backgroundColor;

  const CustomButton1({
    super.key,
    this.isLoading = false,
    required this.btnText,
    this.btnWidth = 1,
    this.btnHeight = 40,
    required this.onPressed,
    this.textColor = AppColors.white,
    this.borderRadius = 8,
    this.borderColor = AppColors.primary,
    this.borderWidth = 1,
    this.backgroundColor = AppColors.primary,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * btnWidth!,
      height: btnHeight,
      child: ElevatedButton(
        onPressed: isLoading ? null : onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: backgroundColor,
          foregroundColor: textColor,
          // Remove fixed width
          minimumSize: Size.zero,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(borderRadius!),
            side: BorderSide(color: borderColor!, width: borderWidth!),
          ),
        ),
        child: isLoading
            ? SizedBox(
                height: 22,
                width: 22,
                child: CircularProgressIndicator(
                  color: AppColors.primary,
                  strokeWidth: 2.5,
                ),
              )
            : CustomText(
                text: btnText,
                fontColor: textColor!,
                fontFamily: AppFonts.robotoBold,
              ),
      ),
    );
  }
}
