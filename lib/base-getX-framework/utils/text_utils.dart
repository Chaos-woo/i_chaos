import 'dart:convert';
import 'dart:math';

import 'package:flutter/material.dart';

double computeMaxWidthOfStrings(List<String> strings, double baseline) {
  double finalWidth = 0.0;

  for (String string in strings) {
    double singleStringWidth = 0.0;
    for (int i = 0; i < string.length; i++) {
      String char = string[i];
      int singleCharLength = utf8.encode(char).length;
      singleStringWidth += singleCharLength > 1 ? singleCharLength * baseline : (baseline / 2);
    }
    finalWidth = max(singleStringWidth, finalWidth);
  }

  return finalWidth;
}

class TextUtils {
  static Size getTextSize(String text, {TextStyle? style, int maxLines = 1, double maxWidth = double.infinity}) {
    TextPainter painter = TextPainter(
      text: TextSpan(text: text, style: style),
      textDirection: TextDirection.ltr,
      maxLines: maxLines,
      ellipsis: '...',
    );
    painter.layout(maxWidth: maxWidth);
    return painter.size;
  }

  static double computeMaxWidthOfItems(List<String> strings, {TextStyle? style}) {
    return strings.map((text) => getTextSize(text, style: style, maxLines: 1).width).reduce((v, e) => max(v, e));
  }

  static StringWidth computeMaxWidthStringOfItems(List<String> strings, {TextStyle? style}) {
    double maxWidth = 0.0;
    String maxWidthString = '';
    for (String text in strings) {
      double temp = getTextSize(text).width;
      if (temp > maxWidth) {
        maxWidth = temp;
        maxWidthString = text;
      }
    }
    return StringWidth(maxWidthString, maxWidth);
  }
}

class StringWidth {
  final String text;
  final double width;

  StringWidth(this.text, this.width);
}
