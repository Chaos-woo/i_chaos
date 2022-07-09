// ignore_for_file: sized_box_for_whitespace

import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:i_chaos/base-getX-framework/ui/widget/option-bar-list/option_bar_item.dart';
import 'package:i_chaos/base-getX-framework/ui/widget/option-bar-list/option_bar_group.dart';
import 'package:i_chaos/base-getX-framework/view/page/base_stateless_view.dart';
import 'package:i_chaos/generated/l10n.dart';
import 'package:i_chaos/ichaos/common-module/get-controllers/color-theme/flex_color_theme_ctrl.dart';
import 'package:i_chaos/icons/ali_icons.dart';

// 主题色设置页
class ThemeSettingPage extends BaseStatelessView {
  ThemeSettingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: backNavBar(
        title: S.current.setting_main_page_option_base_setting_theme,
      ),
      body: Container(
        width: screenWidth,
        child: GetBuilder<FlexColorThemeCtrl>(
          builder: (themeCtrl) {
            // 主题选项
            List<OptionBarItem> themeOptionItems = [];

            List<FlexScheme> themes = themeCtrl.supportFlexScheme;
            for (int i = 0; i < themes.length; i++) {
              themeOptionItems.add(
                OptionBarItem(
                  S.current.setting_theme_page_option_theme_choice('theme_$i'),
                  leadingIcon: Icons.extension,
                  leadingIconColor: themeCtrl.getPrimaryColorByScheme(themes[i]),
                  rightIcon: themeCtrl.flexScheme == themes[i] ? AliIcons.IconRight : null,
                  onTap: () => themeCtrl.switchTheme(themes[i]),
                ),
              );
            }
            return OptionBarGroup(optionBarItemGroups: [themeOptionItems]);
          },
        ),
      ),
    );
  }
}
