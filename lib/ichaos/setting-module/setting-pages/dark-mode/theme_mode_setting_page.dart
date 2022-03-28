// ignore_for_file: sized_box_for_whitespace, import_of_legacy_library_into_null_safe

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:i_chaos/base-getX-framework/view/page/base_stateless_view.dart';
import 'package:i_chaos/generated/l10n.dart';
import 'package:i_chaos/ichaos/common-module/common-widgets/option-bar-list/option_bar_item.dart';
import 'package:i_chaos/ichaos/common-module/common-widgets/option-bar-list/option_bar_list.dart';
import 'package:i_chaos/ichaos/common-module/get-controllers/color-theme/flex_color_theme_ctrl.dart';
import 'package:i_chaos/icons/ali_icons.dart';
import 'package:widget_chain/widget_chain.dart';

// 主题模式设置页light/dark
class ThemeModeSettingPage extends BaseStatelessView {
  ThemeModeSettingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: commonAppBar(
        title: S.current.setting_main_page_option_base_setting_theme_mode,
      ),
      body: GetBuilder<FlexColorThemeCtrl>(
        builder: (themeModelCtrl) {
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

          return OptionBarList(optionBarItemGroups: [themeModeOptionItems]);
        },
      ).intoContainer(width: screenWidth),
    );
  }
}
