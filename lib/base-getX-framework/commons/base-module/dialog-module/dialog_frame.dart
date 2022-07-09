
// dialog位置
import 'package:flutter/material.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';

enum DiaLogLocation { middle, bottom }

/// 快速dialog基础公共配置
/// 拆分为更小的模块，供场景模块组合使用

// dialog属性
class DialogFrame {
  DiaLogLocation location; // dialog弹出位置，默认中间
  bool clickMaskDismiss; // true（点击遮罩后，将关闭dialog），false（不关闭）
  bool useAnimation; // true（使用动画），false（不使用）
  SmartAnimationType? animationType; // 具体可参照[SmartAnimationType]注释
  Duration? animationTime; // 动画持续时间
  bool needTitleSizeBox; // 是否需要title下方的间隔
  bool needContentSizeBox; // 是否需要content下方的间隔
  double dialogMaxWidth; // dialog最大宽度

  DialogFrame({
    this.location = DiaLogLocation.middle,
    this.needTitleSizeBox = true,
    this.needContentSizeBox = true,
    this.clickMaskDismiss = true,
    this.useAnimation = true,
    this.dialogMaxWidth = 340.0,
    this.animationType,
    this.animationTime,
  });

  Alignment dialogAlignment() {
    return location == DiaLogLocation.middle ? Alignment.center : Alignment.bottomCenter;
  }

  DialogFrame merge(DialogFrame? frame) {
    if (null != frame) {
      location = frame.location;
      clickMaskDismiss = frame.clickMaskDismiss;
      useAnimation = frame.useAnimation;
      animationType = frame.animationType;
      animationTime = frame.animationTime;
      needTitleSizeBox = frame.needTitleSizeBox;
      needContentSizeBox = frame.needContentSizeBox;
      dialogMaxWidth = frame.dialogMaxWidth;
    }
    return this;
  }
}
