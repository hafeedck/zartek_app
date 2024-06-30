import 'package:flutter/material.dart';



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
