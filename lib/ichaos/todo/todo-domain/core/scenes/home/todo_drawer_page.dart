import 'package:flustars/flustars.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:i_chaos/generated/l10n.dart';
import 'package:i_chaos/ichaos/public/widgets/abstract_transparent_page.dart';
import 'package:i_chaos/ichaos/public/widgets/option-bar-list/option_bar_item.dart';
import 'package:i_chaos/ichaos/public/widgets/option-bar-list/option_bar_list.dart';
import 'package:i_chaos/icons/ali_icons.dart';

class PageTodoDrawer extends AbstractTransparentPageX {
  final ScreenUtil _scUtil = ScreenUtil.getInstance();
  late double maxWidth;
  late double maxHeight;

  PageTodoDrawer(){
    maxWidth = _scUtil.screenWidth / 3 * 2;
    maxHeight = _scUtil.screenHeight;
  }

  @override
  Widget buildWidget(BuildContext context) {
    const TextStyle optionTextStyle = TextStyle(fontSize: 16, fontWeight: FontWeight.w300, color: Colors.black);

    List<OptionBarItem> todoBaseOptionBarItems = [
      OptionBarItem('Day ToDO', textStyle: optionTextStyle, icon: AliIcons.IconInt, rightIcon: AliIcons.IconEnter, targetPageBuilder: () async {

      }),
      OptionBarItem('近7日ToDO', icon: AliIcons.IconFlipFill, ),
    ];

    List<OptionBarItem> todoTagOptionBarItems = [
      OptionBarItem(S.of(context).setting_option_language_text, icon: AliIcons.IconInt, rightIcon: Icons.adjust, rightIconColor: Colors.teal,targetPageBuilder: () async {

      }),
      OptionBarItem(S.of(context).setting_option_theme_text, icon: AliIcons.IconFlipFill, ),
    ];

    Map<int, String> optionGroupTip = {
      1: '清单'
    };

    return Padding(
      padding: const EdgeInsets.all(0),
      child: Container(
        color: Colors.red,
        width: maxWidth,
        height: maxHeight,
        child: OptionBarList(optionBarItemGroups: [todoBaseOptionBarItems, todoTagOptionBarItems], optionGroupTips: optionGroupTip,),
      ),
    );
  }

  @override
  initPageParams() {
    widgetMaxWidth = maxWidth;
    animationDuration = 250; // ms
    leftStartDirection = true;
    leftPadding = 0;
  }

  @override
  prePageDispose() {}
}
