
import 'package:flutter/material.dart';

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
        backgroundColor: const Color(0xFFFAE7EE), // light pink fill
        foregroundColor: Colors.pink,
        elevation: 0,
        textStyle: Theme.of(context).textTheme.labelLarge,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5),
          side: const BorderSide(
            color: Color(0xFFF8A3C5),
            width: 1,
          ),
        ),
      ), child: Text(btnText)),
    );
  }
}