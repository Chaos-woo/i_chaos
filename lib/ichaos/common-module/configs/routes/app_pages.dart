import 'package:get/get.dart';
import 'package:i_chaos/base-getX-framework/get-route/routes/abstract_route_pages.dart';
import 'package:i_chaos/chaos_home_page.dart';
import 'package:i_chaos/ichaos/common-module/configs/routes/app_routes.dart';
import 'package:i_chaos/ichaos/setting-module/setting-pages/dark-mode-setting/theme_mode_setting_page.dart';
import 'package:i_chaos/ichaos/setting-module/setting-pages/fonts-setting/font_family_setting_page.dart';
import 'package:i_chaos/ichaos/setting-module/setting-pages/language-setting/language_setting_page.dart';
import 'package:i_chaos/ichaos/setting-module/setting-pages/theme-setting/theme_setting_page.dart';
import 'package:i_chaos/ichaos/todos-module/todos-domain/todos-pages/todo-edit-page/todos_editing_bindinds.dart';
import 'package:i_chaos/ichaos/todos-module/todos-domain/todos-pages/todo-edit-page/todos_editing_page.dart';
import 'package:i_chaos/ichaos/todos-module/todos-domain/todos-pages/todo-homepage/todos_homepage_bindinds.dart';

class AppPages extends RoutePages {
  AppPages() {
    initRoutes();
  }

  List<GetPage> get appRoutes => RoutePages.routes;

  @override
  void initRoutes() {
    RoutePages.routes.addAll([
      GetPage(
        name: AppRoutes.APP_HOME,
        page: () => ChaosHomePage().transformToPageWidget(),
        binding: TodosHomepageBindings(),
      ),
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
      GetPage(
        name: AppRoutes.TODOS_EDITING,
        page: () => TodosEditingPage(),
        binding: TodosEditingBindings(),
      ),
    ]);
  }
}
