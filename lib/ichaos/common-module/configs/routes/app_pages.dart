import 'package:get/get.dart';
import 'package:i_chaos/base-getX-framework/get-route/routes/abstract_route_pages.dart';
import 'package:i_chaos/ichaos/common-module/configs/routes/app_routes.dart';
import 'package:i_chaos/ichaos/setting-module/setting-dark-mode/theme_mode_setting_page.dart';
import 'package:i_chaos/ichaos/setting-module/setting-fonts/font_family_setting_page.dart';
import 'package:i_chaos/ichaos/setting-module/setting-language/language_setting_page.dart';
import 'package:i_chaos/ichaos/setting-module/setting-theme/theme_setting_page.dart';

class AppPages extends RoutePages {
  AppPages() {
    initRoutes();
  }

  List<GetPage> get appRoutes => RoutePages.routes;

  @override
  void initRoutes() {
    RoutePages.routes.addAll([
      GetPage(
        name: AppRoutes.APP_LANGUAGE_SETTING,
        page: () => LanguageSettingPage(),
      ),
      GetPage(
        name: AppRoutes.THEME_COLOR_SETTING,
        page: () => ThemeSettingPage(),
      ),
      GetPage(
        name: AppRoutes.THEME_MODE_SETTING,
        page: () => ThemeModeSettingPage(),
      ),
      GetPage(
        name: AppRoutes.APP_FONT_SETTING,
        page: () => FontFamilySettingPage(),
      ),
    ]);
  }
}
