
// ignore_for_file: constant_identifier_names

import 'package:i_chaos/base-getX-framework/get-route/routes/abstract_routes.dart';

class AppRoutes extends AbstractRoutes {

  static const APP_LANGUAGE_SETTING = '${_Paths.SETTING_TAB_PATH}${_Paths.APP_LANGUAGE_SETTING}';
  static const THEME_COLOR_SETTING = '${_Paths.SETTING_TAB_PATH}${_Paths.THEME_COLOR_SETTING}';
  static const THEME_MODE_SETTING = '${_Paths.SETTING_TAB_PATH}${_Paths.THEME_MODE_SETTING}';
  static const APP_FONT_SETTING = '${_Paths.SETTING_TAB_PATH}${_Paths.APP_FONT_SETTING}';
}

abstract class _Paths {
  // 设置页tab基本路径
  static const SETTING_TAB_PATH = '/setting';

  // 设置页路由
  static const THEME_MODE_SETTING = '/theme/mode';
  static const THEME_COLOR_SETTING = '/theme/color';
  static const APP_LANGUAGE_SETTING = '/language';
  static const APP_FONT_SETTING = '/font';
}