import 'package:flutter/material.dart';
import '../../core/constants/app_colors.dart';

class Button2 extends StatelessWidget {
  const Button2({
    super.key, required this.btnText,  this.btnWidth =1,
  });

  final String btnText;
  final double btnWidth;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * btnWidth,
      height: 40,
      child: ElevatedButton(onPressed: () {

      },style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.lightPink, // light pink fill
        foregroundColor: AppColors.pink,
        elevation: 0,
        textStyle: Theme.of(context).textTheme.labelLarge,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5),
          side: const BorderSide(
            color: AppColors.darkPink,
            width: 1,
          ),
        ),
      ), child: Text(btnText)),
    );
  }
}