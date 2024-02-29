import 'package:flutter/material.dart';

class CustomText extends StatelessWidget {
  CustomText({
    required this.textColor,
    required this.textSize,
    required this.textWeight,
    required this.textes,
    this.maxLines,
    super.key,
  });

  Color? textColor;
  double? textSize;
  String? textes;
  FontWeight textWeight;
  int? maxLines;
  @override
  Widget build(BuildContext context) {
    return Text(textes ??'',style: TextStyle(
      fontSize: textSize,
      fontWeight: textWeight,
      color: textColor
    ),
   maxLines:maxLines , 
    );
  }
}