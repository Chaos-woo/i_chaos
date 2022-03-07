
import 'dart:convert';
import 'dart:math';

import 'package:flustars/flustars.dart';

mixin ScreenAdapterMixin {
  final ScreenUtil screen = ScreenUtil.getInstance();

  double get screenWidth => screen.screenWidth;
  double get screenHeight => screen.screenHeight;
  double get statusBarHeight => screen.statusBarHeight;
  double get bottomBarHeight => screen.bottomBarHeight;
  double get appBarHeight => screen.appBarHeight;

  double fontSizeAdapt(double fontSize) {
    return screen.getSp(fontSize);
  }

  double menuWindowWidthAdapt(List<String> strings, double baseline) {
    int adaptWidth = 0;

    for (String s in strings) {
      int bytesLen = utf8.encode(s).length;
      adaptWidth = max(bytesLen, adaptWidth);
    }

    return adaptWidth * baseline;
  }
}