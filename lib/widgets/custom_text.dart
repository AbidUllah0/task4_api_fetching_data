import 'package:flutter/material.dart';

class CustomText extends StatelessWidget {
  String text;
  double? fontSize;
  FontWeight? fontWeight;
  TextOverflow? overflow;

  CustomText(
      {required this.text, this.fontSize, this.fontWeight, this.overflow});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      overflow: overflow,
      style: TextStyle(
        fontWeight: fontWeight,
        fontSize: fontSize,
      ),
    );
  }
}
