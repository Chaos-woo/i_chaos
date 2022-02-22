import 'package:flustars/flustars.dart';
import 'package:flutter/material.dart';
import 'package:i_chaos/base_framework/widget_state/page_state.dart';
import 'package:i_chaos/generated/l10n.dart';
import 'package:i_chaos/ichaos/public/widgets/option-bar-list/option_bar_item.dart';
import 'package:i_chaos/ichaos/public/widgets/option-bar-list/option_bar_list.dart';
import 'package:i_chaos/ichaos/public/widgets/option-bar-list/option_group_tip.dart';
import 'package:i_chaos/ichaos/setting/setting-domain/core/scenes/language/language_setting_page.dart';
import 'package:i_chaos/icons/ali_icons.dart';

// 设置首页
class PageSettingHome extends PageState with AutomaticKeepAliveClientMixin {
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
          return await push(PageLanguageSetting());
        },
      ),
      // 主题色设置
      OptionBarItem(
        S.of(context).setting_option_theme_text,
        icon: AliIcons.IconFlipFill,
      ),
    ];

    // 分组提示
    Map<int, OptionGroupTipTool> optionGroupTip = {
      0: OptionGroupTipTool(
        tip: S.of(context).setting_page_group_tip_text1,
      ),
    };

    return Scaffold(
      appBar: customCommonAppBar(
        title: S.of(context).setting_page_appbar_title,
        leadingButtonIcon: Icons.settings,
        backgroundColor: Colors.black,
      ),
      body: switchStatusBar2Dark(
        child: Container(
          width: ScreenUtil.getInstance().screenWidth,
          color: Colors.grey[300],
          child: OptionBarList(
            optionBarItemGroups: [optionItems],
            optionGroupTips: optionGroupTip,
          ),
        ),
      ),
    );
  }
}
