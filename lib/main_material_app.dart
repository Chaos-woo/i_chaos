// ignore_for_file: avoid_renaming_method_parameters, implementation_imports

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:get/get.dart';
import 'package:i_chaos/base-getX-framework/view-model/app-model/locale_controller.dart';
import 'package:i_chaos/base-getX-framework/view/page/base_stateful_view.dart';
import 'package:i_chaos/generated/l10n.dart';
import 'package:i_chaos/ichaos/common-module/get-controllers/color-theme/flex_color_theme_controller.dart';
import 'package:i_chaos/ichaos/common-module/get-controllers/font-family/font_family_controller.dart';
import 'package:i_chaos/ichaos_main_page.dart';

import 'ichaos/common-module/configs/routes/app_pages.dart';

class MainMaterialApp extends BaseStatefulView {
  MainMaterialApp({Key? key}) {
    // 注入多语言
    putDependency<LocaleController>(LocaleController());
    // 注入字体样式
    putDependency<FontFamilyController>(FontFamilyController());
    // 注入主题模板、主题色
    putDependency<FlexColorThemeController>(FlexColorThemeController());
  }

  @override
  Widget build(BuildContext context) {
    FlexColorThemeController themeCtrl = findDependency();

    return GetMaterialApp(
      title: 'iChaos',
      theme: themeCtrl.getTheme(ThemeMode.light),
      darkTheme: themeCtrl.getTheme(ThemeMode.dark),
      themeMode: themeCtrl.themeMode,
      debugShowCheckedModeBanner: false,
      locale: findDependency<LocaleController>().locale,
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
      home: generateWidget(() => IChaosMainPage(), key: GlobalKey()),
      // flutter_smart_dialog
      navigatorObservers: [FlutterSmartDialog.observer],
      // flutter_smart_dialog
      builder: FlutterSmartDialog.init(),
    );
  }
}
