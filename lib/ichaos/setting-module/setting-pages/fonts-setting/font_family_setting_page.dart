// ignore_for_file: sized_box_for_whitespace

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:i_chaos/base-getX-framework/extension/size_adapter_extension.dart';
import 'package:i_chaos/base-getX-framework/ui/widget/option-bar-list/option_bar_group.dart';
import 'package:i_chaos/base-getX-framework/ui/widget/option-bar-list/option_bar_item.dart';
import 'package:i_chaos/base-getX-framework/ui/widget/option-bar-list/option_group_tip.dart';
import 'package:i_chaos/base-getX-framework/view/page/base_stateless_view.dart';
import 'package:i_chaos/generated/l10n.dart';
import 'package:i_chaos/ichaos/common-module/get-controllers/font-family/font_family_ctrl.dart';
import 'package:i_chaos/icons/ali_icons.dart';

// 字体设置页
class FontFamilySettingPage extends BaseStatelessView {
  FontFamilySettingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: backNavBar(
        title: S.current.setting_main_page_option_base_setting_font,
      ),
      body: Container(
        width: screenWidth,
        child: GetBuilder<FontFamilyCtrl>(
          builder: (fontSettingCtrl) {
            Map<int, OptionGroupTitle> tips = {
              0: OptionGroupTitle(
                title: S.current.setting_font_page_tip_support_fonts,
              ),
            };

            // 字体选项
            List<OptionBarItem> fontOptionItems = [];

            List<String> fonts = fontSettingCtrl.supportFontFamily;
            for (int i = 0; i < fonts.length; i++) {
              fontOptionItems.add(
                OptionBarItem(
                  fonts[i].split('_')[0],
                  titleStyle: TextStyle(fontFamily: fonts[i]),
                  rightIcon: fontSettingCtrl.isCurrentFont(fonts[i]) ? AliIcons.IconRight : null,
                  onTap: () => fontSettingCtrl.switchFontFamily(fonts[i]),
                ),
              );
            }

            final fontFamilyDisplayContainer = Padding(
              padding: const EdgeInsets.only(top: 10, bottom: 10),
              child: Center(
                child: ConstrainedBox(
                  constraints: const BoxConstraints(minHeight: 95, maxHeight: 120),
                  child: Container(
                    height: 95,
                    width: screenWidth - 20,
                    color: Get.isDarkMode ? Colors.grey[800] : Colors.grey[200],
                    child: Center(
                      child: Text(
                        S.current.setting_font_page_text_example,
                        style: TextStyle(fontFamily: fontSettingCtrl.fontFamily),
                      ),
                    ),
                  ),
                ),
              ),
            );

            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                fontFamilyDisplayContainer,
                10.vGap,
                Expanded(
                    child: OptionBarGroup(
                  optionBarItemGroups: [fontOptionItems],
                  optionGroupTips: tips,
                ))
              ],
            );
          },
        ),
      ),
    );
  }
}
