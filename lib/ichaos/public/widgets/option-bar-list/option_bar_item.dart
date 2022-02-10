

// ignore_for_file: prefer_initializing_formals

import 'package:flutter/material.dart';

enum OptionExtensionContentPosition {
  left,
  right
}

typedef OptionItemPushPageBuilder = dynamic Function();
typedef OptionItemPopCallback = void Function(dynamic value);

class OptionBarItem {
  // 选项文本
  final String text;
  // 文本样式
  TextStyle? textStyle;
  // 选项扩展文本
  String? extensionText;
  // 自定义选项扩展组件，与extensionText互斥
  Widget? extensionWidget;
  // 选项扩展文本位置
  late OptionExtensionContentPosition position;
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

  OptionBarItem(this.text, {TextStyle? textStyle = const TextStyle(fontSize: 18, fontWeight: FontWeight.w300, color: Colors.black), String? extensionText,Widget? extensionWidget, OptionExtensionContentPosition position = OptionExtensionContentPosition.left, IconData? icon, double? iconSize, Color? iconColor = Colors.black54, OptionItemPushPageBuilder? targetPageBuilder, OptionItemPopCallback? pagePopCallback, VoidCallback? onTap, IconData? rightIcon, double? rightIconSize, Color? rightIconColor = Colors.black54, }) {
    this.textStyle = textStyle;
    this.extensionText = extensionText;
    this.extensionWidget = extensionWidget;
    this.position = position;
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
    return 'OptionBarItem{text: $text, textStyle: $textStyle, extensionText: $extensionText, extensionWidget: $extensionWidget, position: $position, icon: $icon, iconSize: $iconSize, iconColor: $iconColor, targetPageBuilder: $targetPageBuilder, pagePopCallback: $pagePopCallback, onTap: $onTap, rightIcon: $rightIcon, rightIconSize: $rightIconSize, rightIconColor: $rightIconColor}';
  }
}