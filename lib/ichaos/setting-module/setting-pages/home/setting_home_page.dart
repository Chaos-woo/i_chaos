// ignore_for_file: sized_box_for_whitespace

import 'package:flutter/material.dart';
import 'package:i_chaos/base-getX-framework/view/page/base_stateful_view.dart';
import 'package:i_chaos/generated/l10n.dart';
import 'package:i_chaos/ichaos/common-module/common-widgets/option-bar-list/option_bar_item.dart';
import 'package:i_chaos/ichaos/common-module/common-widgets/option-bar-list/option_bar_list.dart';
import 'package:i_chaos/ichaos/common-module/common-widgets/option-bar-list/option_group_tip.dart';
import 'package:i_chaos/ichaos/common-module/configs/routes/app_routes.dart';
import 'package:i_chaos/icons/ali_icons.dart';

// 设置tab首页
class SettingHomePage extends BaseStatefulView with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);

    // 选项列表
    List<OptionBarItem> optionItems = [
      // 多语言设置
      OptionBarItem(
        S.of(context).setting_option_language_text,
        icon: AliIcons.IconInt,
        rightIcon: AliIcons.IconEnter,
        targetPageBuilder: () async {
          return await push(AppRoutes.APP_LANGUAGE_SETTING);
        },
      ),
      // 主题色设置
      OptionBarItem(
        S.of(context).setting_option_theme_text,
        icon: Icons.palette,
        rightIcon: AliIcons.IconEnter,
        targetPageBuilder: () async {
          return await push(AppRoutes.THEME_COLOR_SETTING);
        },
      ),
      // light/dark模式设置
      OptionBarItem(
        S.of(context).setting_option_theme_mode_text,
        icon: Icons.dark_mode,
        rightIcon: AliIcons.IconEnter,
        targetPageBuilder: () async {
          return await push(AppRoutes.THEME_MODE_SETTING);
        },
      ),
      // 字体设置
      OptionBarItem(
        S.of(context).setting_option_text_font_text,
        icon: Icons.text_fields,
        rightIcon: AliIcons.IconEnter,
        targetPageBuilder: () async {
          return await push(AppRoutes.APP_FONT_SETTING);
        },
      ),
    ];

    // 分组提示
    Map<int, OptionGroupTipTool> optionGroupTip = {
      0: OptionGroupTipTool(
        tip: S.of(context).setting_page_group_tip_text1,
      ),
    };

    return Scaffold(
      appBar: commonAppBar(
        title: S.of(context).setting_page_appbar_title,
        leadingButtonIcon: Icons.settings,
      ),
      body: autoBottomBarPaddingFrame(
        child: Container(
          width: screenWidth,
          child: OptionBarList(
            optionBarItemGroups: [optionItems],
            optionGroupTips: optionGroupTip,
          ),
        ),
      ),
    );
  }
}
