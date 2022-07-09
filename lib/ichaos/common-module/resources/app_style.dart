import 'package:flutter/material.dart';

class AppStyle {
  static final fontWidget = _FontWidget();
  static final fontSize = _FontSize();
  static final colors = _Colors();
  static final textStyles = _TextStyle();
}

class _FontWidget {
  final light = FontWeight.w200;
  final normal = FontWeight.w400;
  final normalMore = FontWeight.w500;
  final medium = FontWeight.w600;
  final bold = FontWeight.w800;
}

class _FontSize {
  final mini_10 = 10.0;
  final small_12 = 12.0;
  final normal_14 = 14.0;
  final medium_16 = 16.0;
  final large_22 = 22.0;
  final big_26 = 26.0;

  double custom(double size) => size;
}

class _Colors {
  final transparent = Colors.transparent;
  final dark = const Color(0xFF0C0C0C);
  final black = Colors.black;
  final black54 = Colors.black54;
  final black87 = Colors.black87;
  final white = Colors.white;
  final gray = Colors.grey;
  final gray50 = Colors.grey[50];
  final lightGray = const Color(0xFFD3D3D3);
  final neutralGray = const Color(0xFF616161);
  final teal = Colors.teal;
  final blue = Colors.blue;
  final blueAccent = Colors.blueAccent;
  final red = Colors.red;
  final warn = Colors.orange;
  final whiteLite = const Color(0xFFEEEEEE);
  final grayBlue = const Color(0xFFB2B4C6);
}

class _TextStyle {
//  example:
//  final f10RegularBlack = TextStyle(
//    fontSize: 12,
//    color: AppStyle.colors.black
//  );
  TextStyle Function(Color color) get f14CustomColor => (Color color) {
    return TextStyle(
      fontSize: 14,
      color: color,
    );
  };

  TextStyle Function(Color color) get f18CustomColor => (Color color) {
    return TextStyle(
      fontSize: 18,
      color: color,
    );
  };

  final f14MediumNoColor = const TextStyle(
    fontSize: 14,
  );

  final f14MediumBlack = TextStyle(
    fontSize: 14,
    color: AppStyle.colors.black,
  );

  final f14MediumWhite = TextStyle(
    fontSize: 14,
    color: AppStyle.colors.white,
  );

  final f18MediumTeal = TextStyle(
    fontSize: 18,
    color: AppStyle.colors.teal,
  );
}
