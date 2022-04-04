import 'package:flustars/flustars.dart';
import 'package:i_chaos/base-getX-framework/utils/my_units.dart';

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

  double variableTextWidthAdapt(List<String> strings, double baseline) => computeMaxWidthOfStrings(strings, baseline);
}
