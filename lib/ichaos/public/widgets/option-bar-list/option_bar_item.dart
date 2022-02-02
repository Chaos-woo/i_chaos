

// ignore_for_file: prefer_initializing_formals

import 'package:flutter/material.dart';

enum OptionItemPosition {
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
  // 选项扩展文本位置
  late OptionItemPosition position;
  // 选项图标
  IconData? icon;
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
  // 角标颜色
  Color? rightIconColor;

  OptionBarItem(this.text, {Key? key, TextStyle? textStyle = const TextStyle(fontSize: 18, fontWeight: FontWeight.w300, color: Colors.black), String? extensionText, OptionItemPosition position = OptionItemPosition.left, IconData? icon, Color? iconColor = Colors.black54, OptionItemPushPageBuilder? targetPageBuilder, OptionItemPopCallback? pagePopCallback, VoidCallback? onTap, IconData? rightIcon, Color? rightIconColor = Colors.black54, }) {
    this.textStyle = textStyle;
    this.extensionText = extensionText;
    this.position = position;
    this.icon = icon;
    this.iconColor = iconColor;
    this.targetPageBuilder = targetPageBuilder;
    this.pagePopCallback = pagePopCallback;
    this.onTap = onTap;
    this.rightIcon = rightIcon;
    this.rightIconColor = rightIconColor;
  }

  @override
  String toString() {
    return 'OptionBarItem{text: $text, textStyle: $textStyle, extensionText: $extensionText, position: $position, icon: $icon, iconColor: $iconColor, targetPageBuilder: $targetPageBuilder, pagePopCallback: $pagePopCallback, onTap: $onTap, rightIcon: $rightIcon, rightIconColor: $rightIconColor}';
  }
}