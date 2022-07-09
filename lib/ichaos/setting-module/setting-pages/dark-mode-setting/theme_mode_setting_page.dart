// ignore_for_file: sized_box_for_whitespace, import_of_legacy_library_into_null_safe

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:i_chaos/base-getX-framework/ui/widget/option-bar-list/option_bar_group.dart';
import 'package:i_chaos/base-getX-framework/ui/widget/option-bar-list/option_bar_item.dart';
import 'package:i_chaos/base-getX-framework/view/page/base_stateless_view.dart';
import 'package:i_chaos/generated/l10n.dart';
import 'package:i_chaos/ichaos/common-module/get-controllers/color-theme/flex_color_theme_ctrl.dart';
import 'package:i_chaos/icons/ali_icons.dart';

// 主题模式设置页light/dark
class ThemeModeSettingPage extends BaseStatelessView {
  ThemeModeSettingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<FlexColorThemeCtrl>(
      builder: (themeModelCtrl) => _themeModeWidgetBuilder(themeModelCtrl),
    );
  }

  Widget _themeModeWidgetBuilder(FlexColorThemeCtrl themeModelCtrl) {
    // 模式选项
    List<OptionBarItem> themeModeOptionItems = [];

    List<ThemeMode> themeModes = ThemeMode.values;
    for (int i = 0; i < themeModes.length; i++) {
      themeModeOptionItems.add(
        OptionBarItem(
          S.current.setting_theme_mode_page_option_theme_mode_choice('mode_$i'),
          rightIcon: themeModelCtrl.themeMode == themeModes[i] ? AliIcons.IconRight : null,
          onTap: () => themeModelCtrl.switchThemeMode(themeModes[i]),
        ),
      );
    }

    Widget themeModePage = OptionBarGroup(optionBarItemGroups: [themeModeOptionItems]);

    return Scaffold(
      appBar: backNavBar(
        title: S.current.setting_main_page_option_base_setting_theme_mode,
      ),
      body: Container(
        width: screenWidth,
        child: themeModePage,
      ),
    );
  }
}
