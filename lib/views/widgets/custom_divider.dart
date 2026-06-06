import 'package:flutter/material.dart';

class CustomDivider extends StatelessWidget {
  final Color color;
  const CustomDivider({
    super.key, required this.color,
  });


  @override
  Widget build(BuildContext context) {
    return  Row(
      children: [
        Expanded(child: Divider()),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 10),
          child: Text(
            "or",
            style: TextStyle(color: color),
          ),
        ),
        Expanded(child: Divider()),
      ],
    );
  }
}