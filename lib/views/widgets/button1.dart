
import 'package:flutter/material.dart';

class Button1 extends StatelessWidget {
  const Button1({
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

      }, child: Text(btnText)),
    );
  }
}