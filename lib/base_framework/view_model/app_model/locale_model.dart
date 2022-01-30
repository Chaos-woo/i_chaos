import 'package:flustars/flustars.dart';
import 'package:flutter/material.dart';
import 'package:i_chaos/generated/l10n.dart';

class LocaleModel extends ChangeNotifier {
//  static const localeNameList = ['auto', '中文', 'English'];
  ///Platform.localeName
  static const localeValueList = ['zh', 'en'];
  // 无法获取系统语言时默认使用中文
  static const int defaultLocaleLanguage = 0;

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
    // 跟随系统
    return null;
  }

  LocaleModel() {
    int? localLocaleIndex = SpUtil.getInt(kLocaleIndex, defValue: -1);
    _localeIndex = localLocaleIndex == -1 ? defaultLocaleLanguage : localLocaleIndex;
  }

  switchLocale(int index) {
    _localeIndex = index;
    notifyListeners();
    SpUtil.putInt(kLocaleIndex, index);
  }

  static String localeName(index, context) {
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
