import 'package:flutter/material.dart';

///
/// 按钮数量类型:
/// single: 单按钮
/// confirm: 确认/取消按钮
/// multi: 多按钮
/// ext: 额外扩展按钮(该类型至少需要前面的n个按钮作为支撑)
///
enum ActionType { none, single, confirm, multi, ext }

// 动作最小单位
class BaseDialogAction {
  late String text;
  late VoidCallback? onTap;
  ActionType type = ActionType.none;

  late Color textColor;
  late FontWeight fontWeight;

  // 通用属性
  late double height;
  late double fontSize;

  BaseDialogAction(this.text, this.onTap);

  void style({
    required Color textColor,
    required FontWeight fontWeight,
    required double height,
    required double fontSize,
  }) {
    this.textColor = textColor;
    this.fontWeight = fontWeight;
    this.height = height;
    this.fontSize = fontSize;
  }

  BaseDialogAction.all({
    required this.text,
    required this.onTap,
    required this.textColor,
    required this.fontWeight,
    required this.height,
    required this.fontSize,
  });
}

// 单按钮，对应ActionNumType#single类型
class SingleAction extends BaseDialogAction {
  SingleAction(String text, VoidCallback? onTap) : super(text, onTap) {
    type = ActionType.single;
  }
}

// 确认/取消按钮，对应ActionNumType#confirm类型
class ConfirmAction extends BaseDialogAction {
  // 覆盖主题色，仅对确认按钮有效
  Color? overrideMainColor;
  bool isConfirmAction;

  ConfirmAction(
    String text,
    VoidCallback? onTap, {
    this.overrideMainColor,
    this.isConfirmAction = true,
  }) : super(text, onTap) {
    type = ActionType.confirm;
  }
}

// 多按钮，对应ActionNumType#multi类型
class MultiAction extends BaseDialogAction {
  // 指定颜色
  Color? specificColor;

  // 按钮是否需要关闭dialog，默认为true
  bool clickDismiss;

  MultiAction(
    String text,
    VoidCallback? onTap, {
    this.specificColor,
    this.clickDismiss = true,
  }) : super(text, onTap) {
    type = ActionType.multi;
  }
}

// 额外扩展按钮，对应ActionNumType#ext类型
class ExtAction extends BaseDialogAction {
  // 指定颜色
  Color? specificColor;

  ExtAction(
    String text,
    VoidCallback? onTap, {
    this.specificColor,
  }) : super(text, onTap) {
    type = ActionType.ext;
  }
}
