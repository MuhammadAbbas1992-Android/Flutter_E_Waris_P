import 'package:flutter/cupertino.dart';
import '../../core/contants/app_colors.dart';
import '../../core/contants/app_fonts.dart';

class CustomText extends StatelessWidget {
  final String text;
  final double fontSize;
  final Color fontColor;
  final FontWeight fontWeight;
  final String? fontFamily;
  final TextAlign textAlign;

  const CustomText( {
    super.key,
    required this.text,
    this.fontSize = 15,
    this.fontColor = AppColors.black,
    this.fontWeight = FontWeight.normal,
    this.fontFamily = AppFonts.robotoRegular,
    this.textAlign = TextAlign.start,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: textAlign,
      style: TextStyle(
        fontSize: fontSize,
        color: fontColor,
        fontWeight: fontWeight,
        fontFamily: fontFamily,
      ),
    );
  }
}
