// ignore_for_file: sized_box_for_whitespace

import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:i_chaos/base-getX-framework/view/page/base_stateless_view.dart';
import 'package:i_chaos/generated/l10n.dart';
import 'package:i_chaos/ichaos/common-module/common-widgets/option-bar-list/option_bar_item.dart';
import 'package:i_chaos/ichaos/common-module/common-widgets/option-bar-list/option_bar_list.dart';
import 'package:i_chaos/ichaos/common-module/get-controllers/color-theme/flex_color_theme_controller.dart';
import 'package:i_chaos/icons/ali_icons.dart';

// 主题色设置页
class ThemeSettingPage extends BaseStatelessView {
  ThemeSettingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: commonAppBar(
        title: S.of(context).setting_option_theme_text,
      ),
      body: Container(
        width: screenWidth,
        child: GetBuilder<FlexColorThemeController>(
          builder: (themeCtrl) {
            // 主题选项
            List<OptionBarItem> themeOptionItems = [];

            List<FlexScheme> themes = themeCtrl.supportFlexScheme;
            for (int i = 0; i < themes.length; i++) {
              themeOptionItems.add(
                OptionBarItem(
                  S.of(context).setting_theme_set_options('theme_$i'),
                  icon: Icons.extension,
                  iconColor: themeCtrl.getThemeColorByCurrentMode(themes[i]),
                  rightIcon: themeCtrl.flexScheme == themes[i] ? AliIcons.IconRight : null,
                  onTap: () => themeCtrl.switchTheme(themes[i]),
                ),
              );
            }
            return OptionBarList(optionBarItemGroups: [themeOptionItems]);
          },
        ),
      ),
    );
  }
}
