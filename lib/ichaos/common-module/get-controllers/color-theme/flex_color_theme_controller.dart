import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flustars/flustars.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:i_chaos/base-getX-framework/view-model/base_view_state_controller.dart';
import 'package:i_chaos/ichaos/common-module/get-controllers/font-family/font_family_controller.dart';
import 'package:i_chaos/ichaos/common-module/utils/enum_string_convert.dart';

// app主题模型
class FlexColorThemeController extends BaseViewStateController {
  // light/dark模式
  late ThemeMode _themeMode;

  // FlexColor主题插件模板
  late FlexScheme _flexScheme;

  static const String kThemeModeCache = 'kThemeMode';
  static const String kFlexScheme = 'kFlexScheme';
  static const List<FlexScheme> _supportFlexScheme = [
    FlexScheme.bahamaBlue,
    FlexScheme.mandyRed,
    FlexScheme.money,
    FlexScheme.mango,
    FlexScheme.espresso,
    FlexScheme.sanJuanBlue,
    FlexScheme.redWine,
    FlexScheme.green,
  ];
  static const FlexScheme _defaultFlexScheme = FlexScheme.bahamaBlue;

  ThemeMode get themeMode => _themeMode;

  FlexScheme get flexScheme => _flexScheme;

  List<FlexScheme> get supportFlexScheme => _supportFlexScheme;

  @override
  void onStateBizHandle() {}

  @override
  void onStateDispose() {}

  @override
  void onStateInit() {
    // light/dark模式初始化
    _themeModeInit();
    // 主题模板初始化
    _flexSchemeInit();
  }

  // 切换light/dark模式
  void switchThemeMode(ThemeMode mode) {
    _themeMode = mode;
    _saveThemeMode(mode);

    Future.delayed(const Duration(milliseconds: 0))
        .then((_) => Get.changeTheme(getTheme(mode)))
        .whenComplete(() => updateListener());
  }

  // 切换主题
  void switchTheme(FlexScheme scheme) {
    _flexScheme = scheme;
    _saveThemeScheme(scheme);

    Future.delayed(const Duration(milliseconds: 0))
        .then((_) => Get.changeTheme(getTheme(null)))
        .whenComplete(() => updateListener());
  }

  // 根据模式获取主题，主要是为了将主题定义统一放到此处
  ThemeData getTheme(ThemeMode? mode) {
    FontFamilyController fontCtrl = findDependency();
    ThemeData dark = FlexThemeData.dark(
      scheme: _flexScheme,
    ).copyWith(textTheme: fontCtrl.getTextTheme(ThemeMode.dark));
    ThemeData light = FlexThemeData.light(
      scheme: _flexScheme,
    ).copyWith(textTheme: fontCtrl.getTextTheme(ThemeMode.light));
    if (mode == null) {
      return Get.isDarkMode ? dark : light;
    }

    switch (mode) {
      case ThemeMode.light:
        return light;
      case ThemeMode.system:
        // 跟随系统时判断系统当前的深色模式：该接口android Q+
        return Get.isPlatformDarkMode ? dark : light;
      case ThemeMode.dark:
        return dark;
    }
  }

  // 获取主题色
  Color getThemeColorByCurrentMode(FlexScheme scheme) {
    return FlexThemeData.light(scheme: scheme).primaryColor;
  }

  void _themeModeInit() {
    String? mode = SpUtil.getString(kThemeModeCache);
    bool initNeedSave = false;
    if (mode == null || mode.isEmpty) {
      mode = enumToString(ThemeMode.system);
      initNeedSave = true;
    }

    _themeMode = enumFromString(ThemeMode.values, mode);
    if (initNeedSave) {
      _saveThemeMode(_themeMode);
    }
  }

  void _flexSchemeInit() {
    String? scheme = SpUtil.getString(kFlexScheme);
    bool initNeedSave = false;
    if (scheme == null || scheme.isEmpty) {
      scheme = enumToString(_defaultFlexScheme);
      initNeedSave = true;
    }

    _flexScheme = enumFromString(FlexScheme.values, scheme);
    if (initNeedSave) {
      _saveThemeScheme(_flexScheme);
    }
  }

  // 保存light/dark模式
  void _saveThemeMode(ThemeMode mode) {
    SpUtil.putString(kThemeModeCache, enumToString(mode));
  }

  // 保存用户主题配置
  void _saveThemeScheme(FlexScheme scheme) {
    SpUtil.putString(kFlexScheme, enumToString(scheme));
  }
}
