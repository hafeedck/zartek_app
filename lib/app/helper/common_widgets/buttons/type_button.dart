
import 'package:flutter/material.dart';

Container circleWidgetWithText(
    double size, Color color, String text, Color fontColor) {
  return Container(
    margin: const EdgeInsets.all(5),
    width: size,
    height: size,
    decoration: BoxDecoration(
      color: color,
      shape: BoxShape.circle,
    ),
    child: Center(
        child: Text(
      text,
      style: TextStyle(fontSize: 10, color: fontColor),
    )),
  );
}