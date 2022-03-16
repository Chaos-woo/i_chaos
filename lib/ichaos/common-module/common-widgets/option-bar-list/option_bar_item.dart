// ignore_for_file: prefer_initializing_formals, unnecessary_null_comparison

import 'package:flutter/material.dart';

enum OptionExtensionContentPosition { left, right }

typedef OptionItemPushPageBuilder = dynamic Function();
typedef OptionItemPopCallback = void Function(dynamic value);

class OptionBarItem {
  static TextStyle itemFontSize = const TextStyle(fontSize: 18);

  // 选项文本
  final String text;

  // 文本样式
  TextStyle? textStyle;

  // 选项扩展文本
  String? extensionText;

  // 自定义选项扩展组件，与extensionText互斥
  Widget? extensionWidget;

  // 选项扩展文本位置
  late OptionExtensionContentPosition extPosition;

  // 选项图标
  IconData? icon;

  // 图标大小
  double? iconSize;

  // 图标颜色
  Color? iconColor;

  // 选项跳转页面Builder
  OptionItemPushPageBuilder? targetPageBuilder;

  // 页面退出数据回调
  OptionItemPopCallback? pagePopCallback;

  // 选项点击回调
  VoidCallback? onTap;

  // 选项右边的角标
  IconData? rightIcon;

  // 选项右边的角标大小
  double? rightIconSize;

  // 角标颜色
  Color? rightIconColor;

  OptionBarItem(
    this.text, {
    TextStyle? textStyle,
    String? extensionText,
    Widget? extensionWidget,
    OptionExtensionContentPosition extPosition = OptionExtensionContentPosition.left,
    IconData? icon,
    double? iconSize,
    Color? iconColor,
    OptionItemPushPageBuilder? targetPageBuilder,
    OptionItemPopCallback? pagePopCallback,
    VoidCallback? onTap,
    IconData? rightIcon,
    double? rightIconSize,
    Color? rightIconColor,
  }) {
    this.textStyle = textStyle == null ? itemFontSize : textStyle.merge(itemFontSize);
    this.extensionText = extensionText;
    this.extensionWidget = extensionWidget;
    this.extPosition = extPosition;
    this.icon = icon;
    this.iconSize = iconSize;
    this.iconColor = iconColor;
    this.targetPageBuilder = targetPageBuilder;
    this.pagePopCallback = pagePopCallback;
    this.onTap = onTap;
    this.rightIcon = rightIcon;
    this.rightIconSize = rightIconSize;
    this.rightIconColor = rightIconColor;
  }

  @override
  String toString() {
    return 'OptionBarItem{text: $text, textStyle: $textStyle, extensionText: $extensionText, extensionWidget: $extensionWidget, position: $extPosition, icon: $icon, iconSize: $iconSize, iconColor: $iconColor, targetPageBuilder: $targetPageBuilder, pagePopCallback: $pagePopCallback, onTap: $onTap, rightIcon: $rightIcon, rightIconSize: $rightIconSize, rightIconColor: $rightIconColor}';
  }
}
