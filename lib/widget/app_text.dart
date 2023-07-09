// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';

class AppText extends StatelessWidget {
  final String text;
  final double fontSize;
  final Color color;
  FontWeight fontWeight;
  TextAlign? textAlign;
  bool isUnderline;

  AppText({
    Key? key,
    required this.text,
    required this.fontSize,
     this.color=Colors.white,
    this.textAlign,
    this.isUnderline = false,
    this.fontWeight = FontWeight.normal,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: textAlign,
      style: TextStyle(
        fontSize: fontSize,
        color: color,
        decoration: isUnderline ? TextDecoration.underline : null,
        fontWeight: fontWeight,
      ),
    );
    // );
  }
}
