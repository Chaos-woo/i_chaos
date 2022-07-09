// ignore_for_file: prefer_initializing_formals, unnecessary_null_comparison

import 'package:flutter/material.dart';

enum OptionExtPosition { left, right }

class OptionBarItem {
  static TextStyle itemFontSize = const TextStyle(fontSize: 18);

  // 文本
  final String title;

  TextStyle? titleStyle;

  late TextStyle _titleTextStyle;

  // 子文本
  String? subTitle;

  // 子文本颜色，默认Color(0xFF222222)
  Color? subTitleColor;

  // 扩展显示
  String? extText;

  // 自定义选项扩展组件，优先extText
  Widget? extWidget;

  // 选项扩展文本位置
  late OptionExtPosition extPosition;

  // 图标
  IconData? leadingIcon;

  // 图标大小
  double? leadingIconSize;

  // 图标颜色
  Color? leadingIconColor;

  // 单击回调
  VoidCallback? onTap;

  // 双击回调
  VoidCallback? onDoubleTap;

  // 右侧图标
  IconData? rightIcon;

  // 右侧图标大小
  double? rightIconSize;

  // 右侧图标颜色
  Color? rightIconColor;

  OptionBarItem(
    this.title, {
    this.titleStyle,
    this.subTitle,
    this.subTitleColor,
    this.extText,
    this.extWidget,
    this.extPosition = OptionExtPosition.right,
    this.leadingIcon,
    this.leadingIconSize,
    this.leadingIconColor,
    this.onTap,
    this.onDoubleTap,
    this.rightIcon,
    this.rightIconSize,
    this.rightIconColor,
  }) {
    _titleTextStyle = itemFontSize.merge(titleStyle);
  }

  @override
  String toString() {
    return 'OptionBarItem{title: $title, titleStyle: $titleStyle, _titleTextStyle: $_titleTextStyle, subTitle: $subTitle, subTitleColor: $subTitleColor, extText: $extText, extWidget: $extWidget, extPosition: $extPosition, leadingIcon: $leadingIcon, leadingIconSize: $leadingIconSize, leadingIconColor: $leadingIconColor, onTap: $onTap, onDoubleTap: $onDoubleTap, rightIcon: $rightIcon, rightIconSize: $rightIconSize, rightIconColor: $rightIconColor}';
  }

  TextStyle get titleTextStyle => _titleTextStyle;
}
