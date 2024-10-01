import 'package:flutter/material.dart';

var ColorRowad=Color(0xff403685);
var ColorYellow= Color(0xffFF922E);
var darkYellow=Color(0xffFF7A00);
var grey=Color(0xff465352);

// General function to return Directionality widget based on the direction, text, and optional style passed.
Widget buildDirectionalText(String s, {
  required String? text,
  required TextDirection direction,
  TextStyle? style, // Optional TextStyle
}) {
  return Directionality(
    textDirection: direction,
    child: Text(
      text ?? s, // Use `text` or the positional argument `s`
      style: style ?? TextStyle(fontSize: 20), // Default style if none is provided
    ),
  );
}