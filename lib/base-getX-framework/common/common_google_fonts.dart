import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

abstract class CommonGoogleFont {
  static const double commonFontSize = 18.0;
  static const FontWeight commonFontWeight = FontWeight.w500;

  static TextStyle fredoka({
    Color color = Colors.white,
    double fontSize = commonFontSize,
    FontWeight fontWeight = commonFontWeight,
  }) =>
      GoogleFonts.fredokaOne(
        color: color,
        fontSize: fontSize,
        fontWeight: fontWeight,
      );
}
