// ignore_for_file: use_key_in_widget_constructors, non_constant_identifier_names, prefer_initializing_formals, must_be_immutable

import 'package:flustars/flustars.dart';
import 'package:flutter/material.dart';
import 'package:i_chaos/ichaos/public/widgets/option-bar-list/option_bar_item.dart';

import 'option_group_tip.dart';

class OptionBarList extends StatelessWidget {
  // 选项分组
  late List<List<OptionBarItem>> optionBarItemGroups;

  // 选项分组提示
  late Map<int, OptionGroupTipTool>? optionGroupTips;

  // 分组提示样式
  late TextStyle tipTextStyle;

  // 选项条高度
  late double optionItemHeight;

  // 选项条背景色
  late Color optionBarItemColor;

  OptionBarList({
    required List<List<OptionBarItem>> optionBarItemGroups,
    Map<int, OptionGroupTipTool>? optionGroupTips,
    TextStyle tipTextStyle = const TextStyle(fontSize: 12, fontWeight: FontWeight.w300, color: Colors.black54),
    double optionItemHeight = 40,
    Color optionBarItemColor = Colors.white,
  }) {
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

    return ListView.builder(
      padding: const EdgeInsets.all(0),
      itemBuilder: (ctx, index) {
        List<OptionBarItem> optionItemGroup = optionBarItemGroups[index];
        int currentItemGroupLength = optionItemGroup.length;

        // 添加分组提示文案和可选的自定义组件
        List<Widget> widgetOptionItems = [];
        if (optionGroupTips != null && optionGroupTips![index] != null) {
          widgetOptionItems.add(_widgetOptionGroupTipTool(optionGroupTips![index]!));
          widgetOptionItems.add(const SizedBox(
            height: 3,
          ));
        }

        // 添加当前分组的选项
        for (int i = 0; i < currentItemGroupLength; i++) {
          if (i != 0) {
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
    );
  }

  // 选项组自定义文案和组件
  Widget _widgetOptionGroupTipTool(OptionGroupTipTool groupTipTool) {
    List<Widget> rowLeftWidgets = [];
    List<Widget> rowRightWidgets = [];

    if (groupTipTool.tip != null && groupTipTool.tool != null) {
      // 处理分组提示文案和组件的位置
      if (groupTipTool.tipPosition == OptionGroupTipPosition.left && groupTipTool.toolPosition == OptionGroupTipPosition.left) {
        if (groupTipTool.tipFirst) {
          rowLeftWidgets.add(Text(groupTipTool.tip!, style: tipTextStyle));
          rowLeftWidgets.add(groupTipTool.tool!);
        } else {
          rowLeftWidgets.add(groupTipTool.tool!);
          rowLeftWidgets.add(Text(groupTipTool.tip!, style: tipTextStyle));
        }
      } else if (groupTipTool.tipPosition == OptionGroupTipPosition.right && groupTipTool.toolPosition == OptionGroupTipPosition.right) {
        if (groupTipTool.tipFirst) {
          rowLeftWidgets.add(groupTipTool.tool!);
          rowLeftWidgets.add(Text(groupTipTool.tip!, style: tipTextStyle));
        } else {
          rowLeftWidgets.add(Text(groupTipTool.tip!, style: tipTextStyle));
          rowLeftWidgets.add(groupTipTool.tool!);
        }
      } else {
        if (groupTipTool.tipPosition == OptionGroupTipPosition.left) {
          rowLeftWidgets.add(Text(groupTipTool.tip!, style: tipTextStyle));
        } else {
          rowRightWidgets.add(Text(groupTipTool.tip!, style: tipTextStyle));
        }

        if (groupTipTool.toolPosition == OptionGroupTipPosition.left) {
          rowLeftWidgets.add(groupTipTool.tool!);
        } else {
          rowRightWidgets.add(groupTipTool.tool!);
        }
      }
    } else if (groupTipTool.tip != null) {
      // 处理仅有分组提示文案
      Text tipText = Text(groupTipTool.tip!, style: tipTextStyle);
      if (groupTipTool.tipPosition == OptionGroupTipPosition.left) {
        rowLeftWidgets.add(tipText);
      } else {
        rowRightWidgets.add(tipText);
      }
    } else if (groupTipTool.tool != null) {
      // 处理仅有分组自定义组件
      if (groupTipTool.toolPosition == OptionGroupTipPosition.left) {
        rowLeftWidgets.add(groupTipTool.tool!);
      } else {
        rowRightWidgets.add(groupTipTool.tool!);
      }
    }

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: rowLeftWidgets,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: rowRightWidgets,
          ),
        ],
      ),
    );
  }

  // 选项组件
  Widget _widgetOptionItem(OptionBarItem item) {
    double iconSize = item.iconSize ?? item.textStyle!.fontSize! + 2;
    double rightIconSize = item.rightIconSize ?? item.textStyle!.fontSize! + 2;

    // 选项左边组件
    final Widget leftWidgetRow = Row(
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
        for (Widget w in _widgetExtensionList(item, OptionExtensionContentPosition.left)) w,
      ],
    );

    // 选项右边组件
    final Widget rightWidgetRow = Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        for (Widget w in _widgetExtensionList(item, OptionExtensionContentPosition.right)) w,
        if (item.rightIcon != null)
          Icon(
            item.rightIcon,
            size: rightIconSize,
            color: item.rightIconColor,
          ),
      ],
    );

    return InkWell(
      onTap: () async {
        // 选项点击回调
        item.onTap?.call();
        // 若选项点击需要跳转页面，此处等待页面返回值
        if (item.targetPageBuilder != null) {
          dynamic result = await item.targetPageBuilder!.call();
          // 处理页面返回值
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

  // 自定义扩展组件
  List<Widget> _widgetExtensionList(OptionBarItem item, OptionExtensionContentPosition p) {
    List<Widget> extension = [];

    if (item.position == p) {
      if (item.extensionWidget != null) {
        extension.add(item.extensionWidget!);
      } else if (item.extensionText != null) {
        extension.add(
          Text(
            item.extensionText!,
            style: item.textStyle,
          ),
        );
      }
    }

    return extension;
  }
}
