
import 'package:flutter/material.dart';

class Button1 extends StatelessWidget {
  const Button1({
    super.key, required this.btnText,  this.btnWidth =1, required this.onPress,
  });

  final String btnText;
  final double btnWidth;
  final VoidCallback onPress;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * btnWidth,
      height: 40,
      child: ElevatedButton(onPressed: onPress, child: Text(btnText)),
    );
  }
}