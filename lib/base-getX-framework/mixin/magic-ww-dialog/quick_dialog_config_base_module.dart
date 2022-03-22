// ignore_for_file: prefer_initializing_formals

import 'package:flutter/material.dart';
import 'package:i_chaos/base-getX-framework/ui/widget/ww-dialog/ww_dialog.dart';

/// 快速dialog基础公共配置
/// 拆分为更小的模块，供场景模块组合使用

// dialog外部框架模块
class QuickDialogFrameModule {
  // dialog弹出位置，默认中间
  final DiaLogLocation location;

  QuickDialogFrameModule({
    this.location = DiaLogLocation.middle,
  });
}

// dialog标题模块
class QuickDialogTitleModule {
  // 标题
  final String? title;

  // 标题对齐方式
  final TextAlign titleAlign;

  // 标题颜色
  final Color? titleColor;

  QuickDialogTitleModule({
    this.title,
    this.titleAlign = TextAlign.center,
    this.titleColor
  });
}

// dialog内容模块
class QuickDialogContentModule {
  // 内容
  final String content;

  // 内容对齐方式
  final TextAlign contentAlign;

  // 内容颜色
  final Color? contentColor;

  // 内容字体大小
  final double contentFontSize;

  QuickDialogContentModule({
    this.content = '',
    this.contentAlign = TextAlign.start,
    this.contentColor,
    this.contentFontSize = 15.0,
  });
}

// dialog按钮基础设置模块
class QuickDialogBaseButtonModule {
  // 按钮排列方式
  final ButtonArrangeType arrangeType;

  QuickDialogBaseButtonModule(this.arrangeType);
}

// dialog基本按钮模块
class QuickDialogCommonButtonModule extends QuickDialogBaseButtonModule {
  // 【确认意义】按钮字体大小
  final double buttonTextFontSize;

  // 按钮高度
  final double buttonHeight;

  // 【确认意义】按钮字体颜色
  final Color mainButtonColor;

  // 【取消意义】按钮字体颜色
  final Color otherButtonColor;

  // 【确认意义】按钮内容
  final String mainButtonContent;

  // 【取消意义】按钮内容
  final String otherButtonContent;

  // 【确认意义】按钮操作
  final VoidCallback? onMainBtnTap;

  // 【取消意义】按钮操作
  final VoidCallback? onOtherBtnTap;

  // 需要【确认意义】按钮
  final bool needMainButton;

  // 需要【取消意义】按钮
  final bool needOtherButton;

  QuickDialogCommonButtonModule({
    this.buttonTextFontSize = 15.0,
    this.buttonHeight = 45.0,
    this.mainButtonColor = Colors.red,
    this.otherButtonColor = Colors.grey,
    this.mainButtonContent = 'Ok',
    this.otherButtonContent = 'Cancel',
    this.onMainBtnTap,
    this.onOtherBtnTap,
    this.needMainButton = true,
    this.needOtherButton = false,
    ButtonArrangeType? arrangeType,
  }) : super(arrangeType ?? ButtonArrangeType.row);
}

// dialog额外按钮模块，与基本按钮可同时设置，模块选择其一即可
class QuickDialogExtensionButtonModule extends QuickDialogCommonButtonModule {
  // 额外按钮
  final List<Widget>? extensionButtons;

  // 额外按钮位置
  final ExtensionButtonLocation extensionButtonLocation;

  QuickDialogExtensionButtonModule({
    double buttonTextFontSize = 15.0,
    double buttonHeight = 45.0,
    Color mainButtonColor = Colors.red,
    Color otherButtonColor = Colors.grey,
    String mainButtonContent = 'Ok',
    String otherButtonContent = 'Cancel',
    VoidCallback? onMainBtnTap,
    VoidCallback? onOtherBtnTap,
    bool needMainButton = true,
    bool needOtherButton = false,
    this.extensionButtons,
    this.extensionButtonLocation = ExtensionButtonLocation.middle,
    ButtonArrangeType? arrangeType,
  }) : super(
          buttonTextFontSize: buttonTextFontSize,
          buttonHeight: buttonHeight,
          mainButtonColor: mainButtonColor,
          otherButtonColor: otherButtonColor,
          mainButtonContent: mainButtonContent,
          otherButtonContent: otherButtonContent,
          onMainBtnTap: onMainBtnTap,
          onOtherBtnTap: onOtherBtnTap,
          needMainButton: needMainButton,
          needOtherButton: needOtherButton,
          arrangeType: arrangeType ?? ButtonArrangeType.row,
        );
}

class OptionButton {
  final String text;
  final VoidCallback? onTap;
  late Color textColor;
  late FontWeight fontWeight;

  OptionButton(
    this.text,
    this.onTap, {
    Color textColor = Colors.blue,
    FontWeight fontWeight = FontWeight.w500,
  }) {
    this.textColor = textColor;
    this.fontWeight = fontWeight;
  }
}

// 额外按钮相对于其他两个按钮的位置
enum ExtensionButtonLocation { before, middle, after }
