import 'package:flustars/flustars.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:i_chaos/base-getX-framework/view-model/base_view_state_ctrl.dart';

class LocaleCtrl extends BaseViewStateCtrl {
  static const localeValueList = ['zh', 'en'];

  // 默认语言下标
  static const int _defaultLanguageIndex = 0;

  // app本地化存储用户选择的国际化语言下标
  static const kAppLocaleIndex = 'kAppLocaleIndex';

  // 当前选择的语言下标状态
  int _currentLanguageIndex = -1;

  int get currentLocaleIndex => _currentLanguageIndex;

  LocaleCtrl();

  // 初始化全局语言资源
  void _initGlobalLocaleRes() {
    int? localLocaleIndex = SpUtil.getInt(kAppLocaleIndex, defValue: -1);
    bool invalidSpLocaleIndex = localLocaleIndex == null || localLocaleIndex < 0;
    _currentLanguageIndex = invalidSpLocaleIndex ? _defaultLanguageIndex : localLocaleIndex;
    _cacheLocaleRes();
  }

  // 保存当前用户选择语言
  void _cacheLocaleRes() {
    SpUtil.putInt(kAppLocaleIndex, _currentLanguageIndex);
  }

  String? get localeString {
    return localeValueList[_currentLanguageIndex];
  }

  Locale? get locale {
    return Locale(localeValueList[_currentLanguageIndex], '');
  }

  // 语言切换
  switchLocale(int index) {
    _currentLanguageIndex = index;
    _cacheLocaleRes();
    Get.updateLocale(locale!);
    updateListener();
  }

  @override
  void onStateBizHandle() {
  }

  @override
  void onStateDispose() {}

  @override
  void onStateInit() {
    _initGlobalLocaleRes();
  }
}
