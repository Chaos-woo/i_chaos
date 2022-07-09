// ignore_for_file: use_key_in_widget_constructors, non_constant_identifier_names, prefer_initializing_formals, must_be_immutable

import 'package:dartx/dartx.dart';
import 'package:flutter/material.dart';
import 'package:i_chaos/base-getX-framework/commons_exports.dart';
import 'package:i_chaos/base-getX-framework/ui/widget/option-bar-list/option_bar_item.dart';
import 'package:i_chaos/base-getX-framework/ui/widget/option-bar-list/option_bar_style.dart';

import 'option_group_tip.dart';

class OptionBarGroup extends StatelessWidget {
  // 分组数据
  List<List<OptionBarItem>> optionBarItemGroups;

  // 分组提示
  Map<int, OptionGroupTitle> optionGroupTips;
  OptionBarStyle? style;
  late ThemeData _themeData;

  OptionBarGroup({
    required this.optionBarItemGroups,
    this.optionGroupTips = const {},
    this.style,
  });

  void _initProp(BuildContext context) {
    style = style ?? OptionBarStyle.style();
    _themeData = Theme.of(context);
  }

  @override
  Widget build(BuildContext context) {
    _initProp(context);

    int optionItemCnt = optionBarItemGroups.map((g) => g.toList()).toList().length;

    if (optionItemCnt <= 0) {
      return Container();
    }

    return ListView.builder(
      padding: const EdgeInsets.all(0),
      itemCount: optionBarItemGroups.length,
      itemBuilder: (ctx, index) {
        List<OptionBarItem> optionItemGroup = optionBarItemGroups[index];
        int currentItemGroupLength = optionItemGroup.length;

        // 添加分组提示文案和可选的自定义组件
        List<Widget> items = [];
        if (optionGroupTips[index] != null) {
          items.add(_optionGroupTitleBuilder(optionGroupTips[index]!));
        }
        items.add(OptionBarConst.tipGroupDivider);

        // 添加当前分组的选项
        for (int i = 0; i < currentItemGroupLength; i++) {
          if (i != 0) {
            items.add(OptionBarConst.itemDivider);
          }
          items.add(_optionItemBuilder(optionItemGroup[i]));
        }

        return items
            .intoColumn(
              mainAxisAlignment: MainAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
            )
            .intoPadding(padding: const EdgeInsets.symmetric(vertical: 5));
      },
    );
  }

  // 选项组自定义文案和组件
  Widget _optionGroupTitleBuilder(OptionGroupTitle groupTipTool) {
    List<Widget> rowLeftWidgets = [];
    List<Widget> rowRightWidgets = [];

    if (groupTipTool.title != null && groupTipTool.tool != null) {
      // 处理分组提示文案和组件的位置
      if (groupTipTool.titlePosition == OptionGroupTipPosition.left &&
          groupTipTool.toolPosition == OptionGroupTipPosition.left) {
        if (groupTipTool.tipFirst) {
          rowLeftWidgets.add(Text(groupTipTool.title!, style: style?.groupTipTextStyle));
          rowLeftWidgets.add(groupTipTool.tool!);
        } else {
          rowLeftWidgets.add(groupTipTool.tool!);
          rowLeftWidgets.add(Text(groupTipTool.title!, style: style?.groupTipTextStyle));
        }
      } else if (groupTipTool.titlePosition == OptionGroupTipPosition.right &&
          groupTipTool.toolPosition == OptionGroupTipPosition.right) {
        if (groupTipTool.tipFirst) {
          rowLeftWidgets.add(groupTipTool.tool!);
          rowLeftWidgets.add(Text(groupTipTool.title!, style: style?.groupTipTextStyle));
        } else {
          rowLeftWidgets.add(Text(groupTipTool.title!, style: style?.groupTipTextStyle));
          rowLeftWidgets.add(groupTipTool.tool!);
        }
      } else {
        if (groupTipTool.titlePosition == OptionGroupTipPosition.left) {
          rowLeftWidgets.add(Text(groupTipTool.title!, style: style?.groupTipTextStyle));
        } else {
          rowRightWidgets.add(Text(groupTipTool.title!, style: style?.groupTipTextStyle));
        }

        if (groupTipTool.toolPosition == OptionGroupTipPosition.left) {
          rowLeftWidgets.add(groupTipTool.tool!);
        } else {
          rowRightWidgets.add(groupTipTool.tool!);
        }
      }
    } else if (groupTipTool.title != null) {
      // 处理仅有分组提示文案
      Text tipText = Text(groupTipTool.title!, style: style?.groupTipTextStyle);
      if (groupTipTool.titlePosition == OptionGroupTipPosition.left) {
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
          rowLeftWidgets.intoRow(mainAxisAlignment: MainAxisAlignment.start),
          rowRightWidgets.intoRow(mainAxisAlignment: MainAxisAlignment.end),
        ],
      ),
    );
  }

  // 选项组件
  Widget _optionItemBuilder(OptionBarItem item) {
    double iconSize = item.leadingIconSize ?? item.titleTextStyle.fontSize! + 2;
    double rightIconSize = item.rightIconSize ?? item.titleTextStyle.fontSize! + 2;

    List<Widget> leftWidgets = [];
    if (item.leadingIcon != null) {
      Widget leadingIcon = Padding(
        padding: const EdgeInsets.only(right: 10),
        child: Icon(item.leadingIcon, size: iconSize, color: item.leadingIconColor ?? _themeData.primaryColor),
      );
      leftWidgets.add(leadingIcon);
    }
    if (item.subTitle.isNullOrBlank) {
      leftWidgets.add(Text(item.title, style: item.titleTextStyle, maxLines: 1));
    } else {
      // 处理标题和选项详情
      Text title = Text(
        item.title,
        style: item.titleTextStyle.merge(TextStyle(fontSize: item.titleTextStyle.fontSize! - 2)),
        maxLines: 1,
      );
      Text subTitle = Text(item.subTitle!,
          style: TextStyle(
            fontSize: item.titleTextStyle.fontSize! - 8,
            color: item.subTitleColor ?? OptionBarConst.itemSubTitleColor,
          ),
          maxLines: 1);
      leftWidgets.add(title.addNeighbor(subTitle).intoColumn(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
          ));
    }
    // 处理扩展组件
    leftWidgets.addAll(_extComponentsBuilder(item, OptionExtPosition.left));

    // 选项左边组件
    Widget leftWidget = Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: leftWidgets,
    );

    // 选项右边组件
    final Widget rightWidgetRow = Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        for (Widget w in _extComponentsBuilder(item, OptionExtPosition.right)) w,
        if (item.rightIcon != null)
          Icon(
            item.rightIcon,
            size: rightIconSize,
            color: item.rightIconColor ?? _themeData.primaryColor,
          ),
      ],
    );

    return InkWell(
      onTap: () async => item.onTap?.call(),
      onDoubleTap: () async => item.onDoubleTap?.call(),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 2),
        color: style?.optionBarItemColor,
        height: style?.optionItemHeight,
        child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [leftWidget, rightWidgetRow],
          ),
        ),
      ),
    );
  }

  // 自定义扩展组件
  List<Widget> _extComponentsBuilder(OptionBarItem item, OptionExtPosition position) {
    List<Widget> exts = [];

    if (item.extPosition == position) {
      if (item.extWidget != null) {
        exts.add(item.extWidget!);
      } else if (item.extText != null) {
        exts.add(
          Text(
            item.extText!,
            style: item.titleTextStyle.merge(const TextStyle(fontSize: 13)),
          ),
        );
      }
    }

    return exts;
  }
}
