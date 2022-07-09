import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flustars/flustars.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:i_chaos/base-getX-framework/view-model/base_view_state_ctrl.dart';
import 'package:i_chaos/ichaos/common-module/get-controllers/font-family/font_family_ctrl.dart';
import 'package:i_chaos/ichaos/common-module/resources/app_style.dart';
import 'package:i_chaos/ichaos/common-module/utils/enum_string_convert.dart';

// app主题模型
class FlexColorThemeCtrl extends BaseViewStateCtrl {
  // light/dark模式
  late ThemeMode _themeMode;

  // FlexColor主题插件模板
  late FlexScheme _flexScheme;

  // 是否是dark模式
  late bool _isDarkMode;

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

  Color get darkModeColor => AppStyle.colors.dark;

  bool get isDarkMode => _isDarkMode;

  @override
  void onBizDataHandle() {}

  @override
  void onStateCtrlDispose() {}

  @override
  void onStateCtrlInit() {
    // light/dark模式初始化
    _themeModeInit();
    // 主题模板初始化
    _flexSchemeInit();
  }

  // 切换light/dark模式
  void switchThemeMode(ThemeMode mode) {
    zeroDelay(() async {
      _themeMode = mode;
      _refreshDarkMode();
      _saveThemeMode(mode);
      Get.changeTheme(getTheme(mode));
      Get.changeThemeMode(themeMode);
      await Get.forceAppUpdate();
      updateListener();
    });
  }

  // 切换主题
  void switchTheme(FlexScheme scheme) {
    _flexScheme = scheme;
    _saveThemeScheme(scheme);

    zeroDelay(() async {
      Get.changeTheme(getTheme(null));
      await Get.forceAppUpdate();
    });
  }

  // 根据模式获取主题
  ThemeData getTheme(ThemeMode? mode) {
    FontFamilyCtrl fontCtrl = findReference();
    ThemeData dark = FlexThemeData.dark(
      scheme: _flexScheme,
    ).copyWith(textTheme: fontCtrl.getTextTheme(ThemeMode.dark));
    ThemeData light = FlexThemeData.light(
      scheme: _flexScheme,
    ).copyWith(textTheme: fontCtrl.getTextTheme(ThemeMode.light));
    if (mode == null) {
      return _isDarkMode ? dark : light;
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
  Color getPrimaryColorByScheme(FlexScheme scheme) {
    return getCurrentThemeData(scheme: scheme).primaryColor;
  }

  Color getPrimaryColor() {
    return getCurrentThemeData().primaryColor;
  }

  ThemeData getCurrentThemeData({FlexScheme? scheme}) {
    return scheme == null ? FlexThemeData.light(scheme: _flexScheme) : FlexThemeData.light(scheme: scheme);
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
    _refreshDarkMode();
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

  void _refreshDarkMode() {
    _isDarkMode = _themeMode == ThemeMode.system ? (Get.isPlatformDarkMode) : _themeMode == ThemeMode.dark;
  }

  // 获取深色模式应该展示的颜色，参数为深色模式时使用的颜色，默认返回主题色
  Color getFitModeColor({
    Color? lightModeColor,
    Color? darkModeColor,
    bool usingPrimary = false,
    bool isBackground = false,
  }) {
    Color primaryColor = getPrimaryColor();
    Color color;
    if (_isDarkMode) {
      if (null != darkModeColor) {
        color = darkModeColor;
      } else {
        if (isBackground) {
          color = AppStyle.colors.dark;
        } else {
          color = usingPrimary ? primaryColor : AppStyle.colors.white;
        }
      }
    } else {
      if (null != lightModeColor) {
        color = lightModeColor;
      } else {
        if (isBackground) {
          color = AppStyle.colors.white;
        } else {
          color = usingPrimary ? primaryColor : AppStyle.colors.black;
        }
      }
    }

    return color;
  }
}
