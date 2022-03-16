import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flustars/flustars.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:i_chaos/base-getX-framework/common/common_google_fonts.dart';
import 'package:i_chaos/base-getX-framework/view-model/base_view_state_controller.dart';
import 'package:i_chaos/ichaos/common-module/get-controllers/color-theme/flex_color_theme_controller.dart';

class FontFamilyController extends BaseViewStateController {
  // 当前系统使用的字体
  late String _fontFamily;

  static const String kFontFamilyCache = 'kFontFamily';

  // 解决google fonts的深色模式字体颜色显示bug
  static final TextTheme _lightGoogleFontsBugger = FlexThemeData.light().textTheme;
  static final TextTheme _darkGoogleFontsBugger = FlexThemeData.dark().textTheme;

  // app首次默认使用的字体
  static const int _defaultFontFamilyIndex = 0;
  static final Map<String, TextTheme> _supportFontFamilyTextTheme = {
    CommonGoogleFont.roboto().fontFamily!: GoogleFonts.robotoTextTheme(_lightGoogleFontsBugger),
    CommonGoogleFont.fredokaOne().fontFamily!: GoogleFonts.fredokaOneTextTheme(_lightGoogleFontsBugger),
    CommonGoogleFont.courgette().fontFamily!: GoogleFonts.courgetteTextTheme(_lightGoogleFontsBugger),
    CommonGoogleFont.rubik().fontFamily!: GoogleFonts.rubikTextTheme(_lightGoogleFontsBugger),
    CommonGoogleFont.josefinSans().fontFamily!: GoogleFonts.jockeyOneTextTheme(_lightGoogleFontsBugger),
    CommonGoogleFont.lobster().fontFamily!: GoogleFonts.lobsterTextTheme(_lightGoogleFontsBugger),
    CommonGoogleFont.acme().fontFamily!: GoogleFonts.acmeTextTheme(_lightGoogleFontsBugger),
    CommonGoogleFont.amaranth().fontFamily!: GoogleFonts.amaranteTextTheme(_lightGoogleFontsBugger),
    CommonGoogleFont.sansitaSwashed().fontFamily!: GoogleFonts.sansitaSwashedTextTheme(_lightGoogleFontsBugger),
    CommonGoogleFont.oleoScript().fontFamily!: GoogleFonts.oleoScriptTextTheme(_lightGoogleFontsBugger),
    CommonGoogleFont.keaniaOne().fontFamily!: GoogleFonts.keaniaOneTextTheme(_lightGoogleFontsBugger),
    CommonGoogleFont.racingSansOne().fontFamily!: GoogleFonts.racingSansOneTextTheme(_lightGoogleFontsBugger),
    CommonGoogleFont.merienda().fontFamily!: GoogleFonts.meriendaTextTheme(_lightGoogleFontsBugger),
    CommonGoogleFont.meriendaOne().fontFamily!: GoogleFonts.meriendaOneTextTheme(_lightGoogleFontsBugger)
  };

  static final Map<String, TextTheme> _supportDarkFontFamilyTextTheme = {
    CommonGoogleFont.roboto().fontFamily!: GoogleFonts.robotoTextTheme(_darkGoogleFontsBugger),
    CommonGoogleFont.fredokaOne().fontFamily!: GoogleFonts.fredokaOneTextTheme(_darkGoogleFontsBugger),
    CommonGoogleFont.courgette().fontFamily!: GoogleFonts.courgetteTextTheme(_darkGoogleFontsBugger),
    CommonGoogleFont.rubik().fontFamily!: GoogleFonts.rubikTextTheme(_darkGoogleFontsBugger),
    CommonGoogleFont.josefinSans().fontFamily!: GoogleFonts.jockeyOneTextTheme(_darkGoogleFontsBugger),
    CommonGoogleFont.lobster().fontFamily!: GoogleFonts.lobsterTextTheme(_darkGoogleFontsBugger),
    CommonGoogleFont.acme().fontFamily!: GoogleFonts.acmeTextTheme(_darkGoogleFontsBugger),
    CommonGoogleFont.amaranth().fontFamily!: GoogleFonts.amaranteTextTheme(_darkGoogleFontsBugger),
    CommonGoogleFont.sansitaSwashed().fontFamily!: GoogleFonts.sansitaSwashedTextTheme(_darkGoogleFontsBugger),
    CommonGoogleFont.oleoScript().fontFamily!: GoogleFonts.oleoScriptTextTheme(_darkGoogleFontsBugger),
    CommonGoogleFont.keaniaOne().fontFamily!: GoogleFonts.keaniaOneTextTheme(_darkGoogleFontsBugger),
    CommonGoogleFont.racingSansOne().fontFamily!: GoogleFonts.racingSansOneTextTheme(_darkGoogleFontsBugger),
    CommonGoogleFont.merienda().fontFamily!: GoogleFonts.meriendaTextTheme(_darkGoogleFontsBugger),
    CommonGoogleFont.meriendaOne().fontFamily!: GoogleFonts.meriendaOneTextTheme(_darkGoogleFontsBugger)
  };

  late List<String> _supportFontFamily;

  String get fontFamily => _fontFamily;

  List<String> get supportFontFamily => _supportFontFamily;

  TextTheme? getTextTheme(ThemeMode mode) {
    if (mode == ThemeMode.dark) {
      return _supportDarkFontFamilyTextTheme[_fontFamily]!;
    } else if (mode == ThemeMode.light) {
      return _supportFontFamilyTextTheme[_fontFamily]!;
    } else {
      return Get.isDarkMode ? _supportDarkFontFamilyTextTheme[_fontFamily]! : _supportFontFamilyTextTheme[_fontFamily]!;
    }
  }

  // 校验是否是当前选择的字体
  bool isCurrentFont(String font) {
    return _fontFamily.trim() == font.trim();
  }

  // 切换字体
  void switchFontFamily(String font) {
    if (!_supportFontFamily.contains(font)) {
      return;
    }

    _fontFamily = font;
    _saveFontFamily();
    // 曲线救国，刷新整体字体/主题
    Future.delayed(const Duration(milliseconds: 0)).then((_) {
      FlexColorThemeController theme = findDependency();
      theme.switchTheme(theme.flexScheme);
    }).whenComplete(() => Get.forceAppUpdate());
    updateListener();
  }

  @override
  void onStateBizHandle() {}

  @override
  void onStateDispose() {}

  @override
  void onStateInit() {
    // 字体资源加载
    _fontFamilyInit();
  }

  void _fontFamilyInit() {
    _supportFontFamily = _supportFontFamilyTextTheme.keys.toList();

    String? font = SpUtil.getString(kFontFamilyCache);
    if (ObjectUtil.isEmpty(font)) {
      _fontFamily = _supportFontFamily[_defaultFontFamilyIndex];
      _saveFontFamily();
    } else {
      _fontFamily = font!;
    }
  }

  // 保存用户字体配置
  void _saveFontFamily() {
    SpUtil.putString(kFontFamilyCache, _fontFamily);
  }
}
