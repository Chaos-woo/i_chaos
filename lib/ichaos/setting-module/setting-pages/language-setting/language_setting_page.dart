// ignore_for_file: sized_box_for_whitespace

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:i_chaos/base-getX-framework/view-model/app-model/locale_ctrl.dart';
import 'package:i_chaos/base-getX-framework/view/page/base_stateless_view.dart';
import 'package:i_chaos/generated/l10n.dart';
import 'package:i_chaos/ichaos/common-module/common-widgets/option-bar-list/option_bar_item.dart';
import 'package:i_chaos/ichaos/common-module/common-widgets/option-bar-list/option_bar_list.dart';
import 'package:i_chaos/icons/ali_icons.dart';

// 语言设置页
class LanguageSettingPage extends BaseStatelessView {
  LanguageSettingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: commonAppBar(
        title: S.current.setting_main_page_option_base_setting_language,
      ),
      body: Container(
        width: screenWidth,
        child: GetBuilder<LocaleCtrl> (
          builder: (locale) {
            // 多语言选项
            List<OptionBarItem> lanOptionItems = [];
            for (int i = 0; i < LocaleCtrl.localeValueList.length; i++) {
              lanOptionItems.add(
                OptionBarItem(
                  S.current.setting_language_page_option_language_choice('lan_$i'),
                  rightIcon: locale.currentLocaleIndex == i ? AliIcons.IconRight : null,
                  onTap: () => locale.switchLocale(i),
                ),
              );
            }

            return OptionBarList(optionBarItemGroups: [lanOptionItems]);
          },
        ),
      ),
    );
  }
}
