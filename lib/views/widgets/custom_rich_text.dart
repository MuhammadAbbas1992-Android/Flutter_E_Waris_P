
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';

import '../../core/constants/app_fonts.dart';

class CustomRichText extends StatelessWidget {
  final String leftTextSpan;
  final String rightTextSpan;
  final Color leftTextSpanColor;
  final Color rightTextSpanColor;
  final VoidCallback onTap;

  const CustomRichText({
    super.key, required this.leftTextSpan, required this.rightTextSpan, required this.leftTextSpanColor, required this.rightTextSpanColor, required this.onTap,
  });



  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: RichText(
        text: TextSpan(
          text: leftTextSpan,
          style: TextStyle(
            color: leftTextSpanColor,
            fontFamily: AppFonts.robotoSemiBold,
            fontSize: 18,
          ),
          children: [
            TextSpan(
              text: rightTextSpan,
              style: TextStyle(
                color: rightTextSpanColor,
                fontFamily: AppFonts.robotoSemiBold,
              ),

              recognizer: TapGestureRecognizer()
                ..onTap = onTap,
            ),
          ],
        ),
      ),
    );
  }
}
