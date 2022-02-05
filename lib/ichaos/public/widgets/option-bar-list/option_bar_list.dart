// ignore_for_file: use_key_in_widget_constructors, non_constant_identifier_names, prefer_initializing_formals, must_be_immutable

import 'package:flustars/flustars.dart';
import 'package:flutter/material.dart';
import 'package:i_chaos/ichaos/public/widgets/option-bar-list/option_bar_item.dart';

class OptionBarList extends StatelessWidget {
  // 选项分组
  late List<List<OptionBarItem>> optionBarItemGroups;

  // 选项分组提示
  late Map<int, String>? optionGroupTips;

  // 分组提示样式
  late TextStyle tipTextStyle;

  // 选项条高度
  late double optionItemHeight;

  // 选项条背景色
  late Color optionBarItemColor;

  OptionBarList(
      {required List<List<OptionBarItem>> optionBarItemGroups,
      Map<int, String>? optionGroupTips,
      TextStyle tipTextStyle = const TextStyle(fontSize: 12, fontWeight: FontWeight.w300, color: Colors.black54),
      double optionItemHeight = 40, Color optionBarItemColor = Colors.white}) {
    this.optionBarItemGroups = optionBarItemGroups;
    this.optionGroupTips = optionGroupTips;
    this.tipTextStyle = tipTextStyle;
    this.optionItemHeight = optionItemHeight;
    this.optionBarItemColor = optionBarItemColor;
  }

  @override
  Widget build(BuildContext context) {
    int optionItemCnt = 0;
    for (int i = 0; i < optionBarItemGroups.length; i++) {
      optionItemCnt += optionBarItemGroups[i].length;
    }

    if (optionItemCnt <= 0) {
      return Container();
    }

    return Container(
      child: ListView.builder(
        itemBuilder: (ctx, index) {
          List<OptionBarItem> optionItemGroup = optionBarItemGroups[index];
          int currentItemGroupLength = optionItemGroup.length;

          List<Widget> widgetOptionItems = [];
          if (optionGroupTips != null) {
            String? tip = optionGroupTips![index];
            if (tip != null) {
              widgetOptionItems.add(Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: Text(tip, style: tipTextStyle),
                  )
                ],
              ));
              widgetOptionItems.add(const SizedBox(
                height: 3,
              ));
            }
          }

          for (int i = 0; i < currentItemGroupLength; i++) {
            if (i == currentItemGroupLength - 1) {
              widgetOptionItems.add(const Divider(
                height: 1,
              ));
              widgetOptionItems.add(_widgetOptionItem(optionItemGroup[i]));
            } else {
              widgetOptionItems.add(_widgetOptionItem(optionItemGroup[i]));
            }
          }

          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 5),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: widgetOptionItems,
            ),
          );
        },
        itemCount: optionBarItemGroups.length,
      ),
    );
  }

  Widget _widgetOptionItem(OptionBarItem item) {
    double iconSize = item.textStyle!.fontSize! + 2;

    Widget leftWidgetRow = Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        if (item.icon != null)
          Padding(
            padding: const EdgeInsets.only(right: 10),
            child: Icon(
              item.icon,
              size: iconSize,
              color: item.iconColor,
            ),
          ),
        Text(
          item.text,
          style: item.textStyle,
        ),
        if (item.extensionText != null && item.position == OptionItemPosition.left)
          Text(
            item.extensionText!,
            style: item.textStyle,
          ),
      ],
    );

    Widget rightWidgetRow = Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        if (item.extensionText != null && item.position == OptionItemPosition.right)
          Text(
            item.extensionText!,
            style: item.textStyle,
          ),
        if (item.rightIcon != null)
          Icon(
            item.rightIcon,
            size: iconSize,
            color: item.rightIconColor,
          ),
      ],
    );

    return InkWell(
      onTap: () async {
        item.onTap?.call();

        if (item.targetPageBuilder != null) {
          dynamic result = await item.targetPageBuilder!.call();
          item.pagePopCallback?.call(result);
        }
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        color: optionBarItemColor,
        height: optionItemHeight,
        child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [leftWidgetRow, rightWidgetRow],
          ),
        ),
      ),
    );
  }
}
