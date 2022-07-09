// dialog标题模块
import 'package:flutter/material.dart';

class DialogTitle {
  // 标题
  String? title;

  // 标题对齐方式
  TextAlign titleAlign;

  // 标题颜色
  Color? titleColor;

  int maxLines = 2;

  DialogTitle.title({
    this.title,
    this.titleAlign = TextAlign.center,
    this.titleColor,
  });

  DialogTitle.noTitle({this.titleAlign = TextAlign.center});
}
