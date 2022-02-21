
import 'package:flustars/flustars.dart';

mixin ScreenAdapterMixin {
  final ScreenUtil screen = ScreenUtil.getInstance();

  double get screenWidth => screen.screenWidth;
  double get screenHeight => screen.screenHeight;
  double get statusBarHeight => screen.statusBarHeight;
  double get bottomBarHeight => screen.bottomBarHeight;
  double get appBarHeight => screen.appBarHeight;
}