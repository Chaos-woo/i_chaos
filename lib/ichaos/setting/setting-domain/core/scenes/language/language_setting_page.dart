import 'package:flustars/flustars.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:i_chaos/base_framework/view_model/app_model/locale_model.dart';
import 'package:i_chaos/base_framework/widget_state/page_state.dart';
import 'package:i_chaos/generated/l10n.dart';
import 'package:i_chaos/ichaos/public/widgets/option-bar-list/option_bar_item.dart';
import 'package:i_chaos/ichaos/public/widgets/option-bar-list/option_bar_list.dart';
import 'package:i_chaos/icons/ali_icons.dart';
import 'package:provider/provider.dart';

class PageLanguageSetting extends PageState {
  @override
  Widget build(BuildContext context) {
    const appBarTitleIcon = Padding(
      padding: EdgeInsets.only(right: 5),
      child: Icon(
        AliIcons.IconInt,
        size: 20,
      ),
    );

    final appBarTitleText = Text(
      S.of(context).setting_option_language_text,
      style: const TextStyle(
        fontSize: 18,
      ),
    );

    return Scaffold(
      appBar: customCommonAppBar(
        needPop: true,
        backgroundColor: Colors.black,
        customTitle: Row(
          children: <Widget>[
            appBarTitleIcon,
            appBarTitleText,
          ],
        ),
      ),
      body: Consumer<LocaleModel>(
        builder: (ctx, localeModel, _) {
          int localeIndex = localeModel.localeIndex!;

          // 多语言选项
          List<OptionBarItem> lanOptionItems = [
            OptionBarItem(
              S.of(context).setting_language_set_text1,
              rightIcon: localeIndex == 0 ? AliIcons.IconRight : null,
              onTap: () {
                _switchLocal(localeModel, 0);
              },
            ),
            OptionBarItem(
              S.of(context).setting_language_set_text2,
              rightIcon: localeIndex == 1 ? AliIcons.IconRight : null,
              onTap: () {
                _switchLocal(localeModel, 1);
              },
            ),
          ];
          return Container(
            width: ScreenUtil.getInstance().screenWidth,
            color: Colors.grey[300],
            child: OptionBarList(optionBarItemGroups: [lanOptionItems]),
          );
        },
      ),
    );
  }

  void _switchLocal(LocaleModel model, int index) {
    model.switchLocale(index);
  }
}
