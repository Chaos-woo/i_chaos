import 'package:flustars/flustars.dart';
import 'package:i_chaos/base-getX-framework/utils/text_utils.dart';

mixin ScreenMixin {
  final ScreenUtil screen = ScreenUtil.getInstance();

  double get screenWidth => screen.screenWidth;

  double get screenHeight => screen.screenHeight;

  double get statusBarHeight => screen.statusBarHeight;

  double get bottomBarHeight => screen.bottomBarHeight;

  double get appBarHeight => screen.appBarHeight;

  double fontSizeAdapt(double fontSize) {
    return screen.getSp(fontSize);
  }

  double varTextWidthAdapt(List<String> strings, double baseline) => computeMaxWidthOfStrings(strings, baseline);
}
