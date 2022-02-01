import 'package:flustars/flustars.dart';
import 'package:flutter/material.dart';

class LocaleModel extends ChangeNotifier {
  static const localeValueList = ['zh', 'en'];
  static const int _defaultLocaleLanguage = 0;

  static const kLocaleIndex = 'kLocaleIndex';

  int? _localeIndex = -1;

  int? get localeIndex => _localeIndex;

  Locale? get locale {
    //初始化放在全局， 放在下面会导致每次刷新index 并且导致国际化切换失败
    //_localeIndex = 1;
    if (_localeIndex! > 0) {
      var value = localeValueList[_localeIndex!].split("-");
      return Locale(value[0], value.length == 2 ? value[1] : '');
    }
    // 默认使用中文
    _localeIndex = _defaultLocaleLanguage;
    SpUtil.putInt(kLocaleIndex, _localeIndex!);
  }

  LocaleModel() {
    int? localLocaleIndex = SpUtil.getInt(kLocaleIndex, defValue: -1);
    bool invalidSpLocaleIndex = localLocaleIndex == null || localLocaleIndex < 0;
    _localeIndex = invalidSpLocaleIndex ? _defaultLocaleLanguage : localLocaleIndex;
    if (invalidSpLocaleIndex) {
      SpUtil.putInt(kLocaleIndex, _localeIndex!);
    }
  }

  switchLocale(int index) {
    _localeIndex = index;
    notifyListeners();
    SpUtil.putInt(kLocaleIndex, index);
  }

  static String localeName(index) {
    switch (index) {
      case 0:
        return '简体中文';
      case 1:
        return 'English';
      default:
        return '';
    }
  }
}
