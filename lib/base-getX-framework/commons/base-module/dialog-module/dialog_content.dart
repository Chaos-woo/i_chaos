import 'package:flutter/material.dart';
import 'package:i_chaos/ichaos/common-module/resources/app_style.dart';

// dialog内容模块
class DialogContent {
  // 内容
  String content;

  // 内容对齐方式
  TextAlign contentAlign;

  // 内容颜色
  Color? contentColor;

  // 内容字体大小
  late double contentFontSize;

  // 自定义内容
  Widget? widget;

  DialogContent.content({
    this.content = '',
    this.contentAlign = TextAlign.start,
    this.contentColor,
    double? contentFontSize,
    this.widget,
  }) {
    this.contentFontSize = contentFontSize ?? AppStyle.fontSize.medium_16;
  }
}
