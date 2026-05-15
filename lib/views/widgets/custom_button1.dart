import 'package:flutter/material.dart';

class CustomButton1 extends StatelessWidget {
  final bool isLoading;
  final String btnText;
  final double? btnWidth;
  final VoidCallback? onPressed;

  const CustomButton1({
    super.key,
    required this.isLoading,
    required this.btnText,
     this.btnWidth = 1,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * btnWidth!,
      height: 40,
      child: ElevatedButton(
        onPressed: isLoading ? null : onPressed,
        child: isLoading
            ? const CircularProgressIndicator(
          color: Colors.white,
        )
            : ElevatedButton(onPressed: onPressed, child: Text(btnText)),
        ),
      );
  }
}