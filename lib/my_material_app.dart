// ignore_for_file: avoid_renaming_method_parameters, implementation_imports

import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:get/get.dart';
import 'package:i_chaos/base-getX-framework/get-x/bindings/getx_bindings_guider.dart';
import 'package:i_chaos/base-getX-framework/view-model/app-model/locale_ctrl.dart';
import 'package:i_chaos/base-getX-framework/view/page/base_stateful_view.dart';
import 'package:i_chaos/base-getX-framework/view/page/base_stateless_view.dart';
import 'package:i_chaos/generated/l10n.dart';
import 'package:i_chaos/ichaos/common-module/configs/brn-config/brn_config.dart';
import 'package:i_chaos/ichaos/common-module/get-controllers/color-theme/flex_color_theme_ctrl.dart';
import 'package:i_chaos/ichaos/common-module/get-controllers/font-family/font_family_ctrl.dart';
import 'package:i_chaos/chaos_home_page.dart';

import 'ichaos/common-module/configs/routes/app_pages.dart';

class MyMaterialApp extends BaseStatelessView {
  MyMaterialApp({Key? key}) : super(key: key) {
    // // 注入多语言
    // putReference<LocaleCtrl>(LocaleCtrl());
    // // 注入字体样式
    // putReference<FontFamilyCtrl>(FontFamilyCtrl());
    // // 注入主题模板、主题色
    // putReference<FlexColorThemeCtrl>(FlexColorThemeCtrl());
    initBaseReferences();
  }

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      initialRoute: '/',
      title: 'iChaos',
      theme: findReference<FlexColorThemeCtrl>().getTheme(ThemeMode.light),
      darkTheme: findReference<FlexColorThemeCtrl>().getTheme(ThemeMode.dark),
      themeMode: findReference<FlexColorThemeCtrl>().themeMode,
      debugShowCheckedModeBanner: false,
      locale: findReference<LocaleCtrl>().locale,
      // 国际化工厂代理
      localizationsDelegates: const [
        // Intl 插件（需要安装）
        S.delegate,
        // 系统控件 国际化
        GlobalCupertinoLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate //文本方向等
      ],
      supportedLocales: S.delegate.supportedLocales,
      getPages: AppPages().appRoutes,
      defaultTransition: Transition.fade,
      opaqueRoute: Get.isOpaqueRouteDefault,
      popGesture: Get.isPopGestureEnable,
//      transitionDuration: Get.defaultDurationTransition,
//       home: generateWidget(() => IChaosMainPage(), key: GlobalKey()),
      // flutter_smart_dialog
      navigatorObservers: [FlutterSmartDialog.observer],
      // flutter_smart_dialog
      builder: FlutterSmartDialog.init(),
    );
  }

  void initBaseReferences() {
    // 注入多语言
    putReference<LocaleCtrl>(LocaleCtrl());
    // 注入字体样式
    putReference<FontFamilyCtrl>(FontFamilyCtrl());
    // 注入主题模板、主题色
    putReference<FlexColorThemeCtrl>(FlexColorThemeCtrl());
    // Brn配置处理
    putReference<BrnConfigCtrl>(BrnConfigCtrl());
  }
}
