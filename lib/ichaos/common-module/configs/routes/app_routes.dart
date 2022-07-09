// ignore_for_file: constant_identifier_names

class AppRoutes {
  static const APP_HOME = _Paths.APP_HOME_PATH;

  static const TODOS_EDITING = '${_Paths.TODOS_TAB_PATH}${_Paths.TODOS_EDITING}';

  static const APP_LANGUAGE_SETTING = '${_Paths.SETTING_TAB_PATH}${_Paths.APP_LANGUAGE_SETTING}';
  static const THEME_COLOR_SETTING = '${_Paths.SETTING_TAB_PATH}${_Paths.THEME_COLOR_SETTING}';
  static const THEME_MODE_SETTING = '${_Paths.SETTING_TAB_PATH}${_Paths.THEME_MODE_SETTING}';
  static const APP_FONT_SETTING = '${_Paths.SETTING_TAB_PATH}${_Paths.APP_FONT_SETTING}';
}

abstract class _Paths {
  static const APP_HOME_PATH = '/';

  // Todos页面tab基本路径
  static const TODOS_TAB_PATH = '/todos';
  // 设置页tab基本路径
  static const SETTING_TAB_PATH = '/setting';

  // Todos页路由
  static const TODOS_EDITING = '/editing';

  // 设置页路由
  static const THEME_MODE_SETTING = '/theme-setting/mode';
  static const THEME_COLOR_SETTING = '/theme-setting/color';
  static const APP_LANGUAGE_SETTING = '/language';
  static const APP_FONT_SETTING = '/font';
}
