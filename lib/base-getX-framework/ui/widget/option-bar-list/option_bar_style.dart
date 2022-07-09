import 'package:flutter/material.dart';

class OptionBarConst {
  static TextStyle itemTitleStyle = const TextStyle(fontSize: 18);
  static const double optionItemHeight = 45.0;
  static SizedBox tipGroupDivider = const SizedBox(height: 3);
  static Divider itemDivider = const Divider(height: 1);
  static Color? itemSubTitleColor = Colors.grey[400];
  static Color? groupTipTextColor = Colors.grey[800];
}

class OptionBarStyle {
  // 分组提示样式
  TextStyle? groupTipTextStyle;

  // 选项条高度
  double? optionItemHeight;

  // 选项条背景色
  Color? optionBarItemColor;

  OptionBarStyle.style({
    this.groupTipTextStyle,
    this.optionBarItemColor,
    this.optionItemHeight = OptionBarConst.optionItemHeight,
  }) {
    groupTipTextStyle = groupTipTextStyle ??
        TextStyle(
          fontSize: OptionBarConst.itemTitleStyle.fontSize! - 6,
          color: OptionBarConst.groupTipTextColor,
        );
  }
}
