import 'package:flutter/material.dart';
import 'package:i_chaos/base_framework/widget_state/page_state.dart';
import 'package:i_chaos/generated/l10n.dart';
import 'package:i_chaos/ichaos/public/widgets/option-bar-list/option_bar_item.dart';
import 'package:i_chaos/ichaos/public/widgets/option-bar-list/option_bar_list.dart';
import 'package:i_chaos/ichaos/setting/setting-domain/core/scenes/language/language_setting_page.dart';
import 'package:i_chaos/icons/ali_icons.dart';

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
    List<OptionBarItem> optionItems = [
      OptionBarItem(S.of(context).setting_option_language_text, icon: AliIcons.IconInt, rightIcon: AliIcons.IconEnter, targetPageBuilder: () async {
        return await push(PageLanguageSetting());
      }),
      OptionBarItem(S.of(context).setting_option_theme_text, icon: AliIcons.IconFlipFill, rightIcon: AliIcons.IconEnter, ),
    ];

    Map<int, String> optionGroupTip = {
      0: S.of(context).setting_page_group_tip_text1
    };

    return Scaffold(
      appBar: AppBar(
        leading: const Icon(Icons.settings),
        title: Row(
          children: <Widget>[
            Text(
              S.of(context).setting_page_appbar_title,
              style: const TextStyle(
                fontSize: 18,
              ),
            ),
          ],
        ),
        titleSpacing: -5,
        toolbarHeight: 40,
        elevation: 0,
        backgroundColor: Colors.black,
      ),
      body: switchStatusBar2Dark(
        child: Container(
          color: Colors.grey[300],
          child: OptionBarList(optionBarItemGroups: [optionItems], optionGroupTips: optionGroupTip,),
        ),
      ),
    );
  }
}
