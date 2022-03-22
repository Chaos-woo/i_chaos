import 'package:flutter/material.dart';
import 'package:i_chaos/base-getX-framework/mixin/magic-ww-dialog/quick_dialog_config_base_module.dart';

/// 快速dialog场景配置
/// 以title、content、button三个主要维度进行模块拆分，不同的场景自行进行组合

// 二次确认dialog配置
class DismissibleDialogConfig {
  final QuickDialogTitleModule dialogTitleModule;
  final QuickDialogContentModule dialogContentModule;
  final QuickDialogCommonButtonModule dialogButtonModule;
  QuickDialogFrameModule? dialogFrameModule;

  DismissibleDialogConfig({
    required this.dialogTitleModule,
    required this.dialogContentModule,
    required this.dialogButtonModule,
    this.dialogFrameModule,
  });
}

// 信息展示类dialog配置
class InformationDialogConfig {
  QuickDialogTitleModule? dialogTitleModule;
  final QuickDialogContentModule dialogContentModule;
  QuickDialogExtensionButtonModule? dialogButtonModule;
  QuickDialogFrameModule? dialogFrameModule;

  InformationDialogConfig({
    this.dialogTitleModule,
    required this.dialogContentModule,
    this.dialogButtonModule,
    this.dialogFrameModule,
  });
}

// 选项按钮类dialog配置
class OptionButtonDialogConfig {
  final List<OptionButton> buttons;
  QuickDialogTitleModule? dialogTitleModule;
  QuickDialogFrameModule? dialogFrameModule;

  OptionButtonDialogConfig({
    required this.buttons,
    this.dialogTitleModule,
    this.dialogFrameModule,
  });
}

// 自定义内容dialog配置
class CustomDialogConfig {
  final Widget contentWidget;
  QuickDialogTitleModule? dialogTitleModule;
  QuickDialogExtensionButtonModule? dialogButtonModule;
  QuickDialogFrameModule? dialogFrameModule;

  CustomDialogConfig({
    required this.contentWidget,
    this.dialogTitleModule,
    this.dialogButtonModule,
    this.dialogFrameModule,
  });
}
