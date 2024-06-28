import 'package:flutter/material.dart';

Text normalText(String label) {
  return Text(
    label,
    style: const TextStyle(color: Colors.black, fontWeight: FontWeight.w400),
  );
}

Text boldText(String label,
    {FontWeight? fontWeight = FontWeight.w600,
    double? fontSize,
    Color? color = Colors.black}) {
  return Text(
    label,
    style: TextStyle(
        fontWeight: fontWeight, fontSize: fontSize ?? 13, color: color),
  );
}

Text whiteText(String label,
    {double? fontSize = 20.0,
    FontWeight? fontWeight = FontWeight.w700,
    TextAlign? textAlign = TextAlign.center}) {
  return Text(
    label,
    textAlign: textAlign,
    style: TextStyle(
        fontWeight: fontWeight, fontSize: fontSize, color: Colors.white),
  );
}

Text commonText(String label, Color color, double font) {
  return Text(
    label,
    // textScaleFactor: 1.6,
    style: TextStyle(
      fontWeight: FontWeight.w700,
      fontSize: font,
      color: color,
    ),
  );
}

Text commonText2(
    String label, Color color, double font, FontWeight fontWeight) {
  return Text(
    label,
    // textScaleFactor: 1.6,
    style: TextStyle(
      height: 1.5,
      fontWeight: fontWeight,
      fontSize: font,
      color: color,
    ),
  );
}
