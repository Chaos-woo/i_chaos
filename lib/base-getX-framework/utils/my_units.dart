import 'dart:convert';
import 'dart:math';

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
