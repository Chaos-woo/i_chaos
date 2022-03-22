// ignore_for_file: prefer_initializing_formals

import 'package:flustars/flustars.dart';
import 'package:flutter/material.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:get/get.dart';
import 'package:i_chaos/base-getX-framework/mixin/magic-ww-dialog/quick_dialog_config.dart';
import 'package:i_chaos/base-getX-framework/mixin/magic-ww-dialog/quick_dialog_config_base_module.dart';
import 'package:i_chaos/base-getX-framework/ui/widget/ww-dialog/ww-dialog-magic/magic_ww_middle_bottom_dialog_widget.dart';
import 'package:i_chaos/base-getX-framework/ui/widget/ww-dialog/ww_dialog.dart';
import 'package:widget_chain/widget_chain.dart';

/// 使用前需要在MaterialApp对flutter_smart_dialog进行初始化
/// 掘金：https://juejin.cn/post/7026150456673959943#heading-1
/// pubdev：https://pub.dev/packages/flutter_smart_dialog/install

// 常用场景的dialog
mixin MagicWWDialogMixin {
  // 二次确认使用的dialog
  void showDismissibleDialog(DismissibleDialogConfig config) {
    QuickDialogFrameModule frameModule = config.dialogFrameModule ?? QuickDialogFrameModule();
    QuickDialogTitleModule titleModule = config.dialogTitleModule;
    QuickDialogContentModule contentModule = config.dialogContentModule;
    QuickDialogCommonButtonModule buttonModule = config.dialogButtonModule;
    bool isMiddleDialog = frameModule.location == DiaLogLocation.middle;

    final Widget dismissibleDialog = TTMagicBaseDialog(
      title: titleModule.title,
      titleAlign: titleModule.titleAlign,
      titleColor: titleModule.titleColor,
      content: contentModule.content,
      contentAlign: contentModule.contentAlign,
      contentColor: contentModule.contentColor,
      contentFontSize: contentModule.contentFontSize,
      arrangeType: buttonModule.arrangeType,
      location: frameModule.location,
      customWidgetButtons: [
        simpleCustomButton(
          text: buttonModule.otherButtonContent,
          textFontSize: buttonModule.buttonTextFontSize,
          buttonHeight: buttonModule.buttonHeight,
          textColor: buttonModule.otherButtonColor,
          onTap: () => buttonModule.onOtherBtnTap?.call(),
        ),
        simpleCustomButton(
          text: buttonModule.mainButtonContent,
          textFontSize: buttonModule.buttonTextFontSize,
          buttonHeight: buttonModule.buttonHeight,
          textColor: buttonModule.mainButtonColor,
          onTap: () => buttonModule.onMainBtnTap?.call(),
        ),
      ],
    );

    SmartDialog.show(
      widget: dismissibleDialog,
      alignmentTemp: isMiddleDialog ? Alignment.center : Alignment.bottomCenter,
    );
  }

  // 简单信息展示的dialog
  void showTextInformationDialog(InformationDialogConfig config) {
    QuickDialogFrameModule frameModule = config.dialogFrameModule ?? QuickDialogFrameModule();
    QuickDialogContentModule contentModule = config.dialogContentModule;
    bool isMiddleDialog = frameModule.location == DiaLogLocation.middle;

    QuickDialogExtensionButtonModule extBtnsModule = config.dialogButtonModule ?? QuickDialogExtensionButtonModule();
    QuickDialogTitleModule titleModule = config.dialogTitleModule ?? QuickDialogTitleModule();

    bool needMainBtn = extBtnsModule.needMainButton;
    bool needOtherBtn = extBtnsModule.needOtherButton;
    // 两个按钮都不需要时提供闭dialog的按钮
    bool clickOtherDismiss = !needMainBtn && !needOtherBtn;

    final Widget otherBtn = simpleCustomButton(
      text: extBtnsModule.otherButtonContent,
      textFontSize: extBtnsModule.buttonTextFontSize,
      buttonHeight: extBtnsModule.buttonHeight,
      textColor: extBtnsModule.otherButtonColor,
      onTap: () => extBtnsModule.onOtherBtnTap?.call(),
    );

    final Widget mainBtn = simpleCustomButton(
      text: extBtnsModule.mainButtonContent,
      textFontSize: extBtnsModule.buttonTextFontSize,
      buttonHeight: extBtnsModule.buttonHeight,
      textColor: extBtnsModule.mainButtonColor,
      onTap: () => extBtnsModule.onMainBtnTap?.call(),
    );

    List<Widget> extBtns = [];
    if (needOtherBtn) {
      extBtns.add(otherBtn);
    }
    if (needMainBtn) {
      extBtns.add(mainBtn);
    }

    if (extBtnsModule.extensionButtons != null && extBtnsModule.extensionButtons!.isNotEmpty) {
      if (extBtnsModule.extensionButtonLocation == ExtensionButtonLocation.before) {
        extBtns.insertAll(0, extBtnsModule.extensionButtons!);
      } else if (extBtnsModule.extensionButtonLocation == ExtensionButtonLocation.middle) {
        if (extBtns.length > 1) {
          extBtns.insertAll(1, extBtnsModule.extensionButtons!);
        } else {
          extBtns.insertAll(0, extBtnsModule.extensionButtons!);
        }
      } else {
        extBtns.insertAll(extBtns.length, extBtnsModule.extensionButtons!);
      }
    }

    final Widget infoDialog = TTMagicBaseDialog(
      title: titleModule.title,
      titleAlign: titleModule.titleAlign,
      titleColor: titleModule.titleColor,
      content: contentModule.content,
      contentAlign: contentModule.contentAlign,
      contentColor: contentModule.contentColor,
      contentFontSize: contentModule.contentFontSize,
      arrangeType: extBtnsModule.arrangeType,
      customWidgetButtons: extBtns,
      location: frameModule.location,
      isShowCloseButton: clickOtherDismiss,
    );

    SmartDialog.show(
      widget: infoDialog,
      alignmentTemp: isMiddleDialog ? Alignment.center : Alignment.bottomCenter,
    );
  }

  // 展示更多选项的dialog
  void showMoreOptionDialog(
    OptionButtonDialogConfig config, {
    ButtonArrangeType arrangeType = ButtonArrangeType.column,
    double buttonHeight = 55.0,
  }) {
    QuickDialogFrameModule frameModule = config.dialogFrameModule ?? QuickDialogFrameModule(location: DiaLogLocation.bottom);
    bool isMiddleDialog = frameModule.location == DiaLogLocation.middle;

    final optionBtns = config.buttons
        .map((option) => simpleCustomButton(
              text: option.text,
              buttonHeight: buttonHeight,
              fontWeight: option.fontWeight,
              textColor: option.textColor,
              onTap: () => option.onTap?.call(),
            ))
        .toList();

    QuickDialogTitleModule titleModule = config.dialogTitleModule ?? QuickDialogTitleModule();

    final Widget optionsDialog = !ObjectUtil.isEmpty(titleModule.title)
        ? TTMagicBaseDialog(
            title: titleModule.title,
            titleAlign: titleModule.titleAlign,
            titleColor: titleModule.titleColor,
            arrangeType: arrangeType,
            location: frameModule.location,
            needContentSizeBox: false,
            customWidgetButtons: optionBtns,
          )
        : TTMagicBaseDialog(
            customTitleWidget: InkWell(
              onTap: () => SmartDialog.dismiss(status: SmartStatus.dialog),
              child: Container(
                width: 50,
                decoration: BoxDecoration(
                  color: Get.isDarkMode ? Colors.white60 : Colors.grey[300],
                  borderRadius: const BorderRadius.all(Radius.circular(15)),
                ),
              ).intoCenter().intoSizedBox(height: 4).intoPadding(padding: EdgeInsets.symmetric(vertical: isMiddleDialog ? 5 : 10)),
            ),
            arrangeType: arrangeType,
            location: frameModule.location,
            // 取消中间弹窗时的标题内容间隔
            needTitleSizeBox: false,
            needContentSizeBox: false,
            customWidgetButtons: optionBtns,
          );

    SmartDialog.show(
      widget: optionsDialog,
      alignmentTemp: isMiddleDialog ? Alignment.center : Alignment.bottomCenter,
    );
  }

  // 填充自定义组件内容的dialog
  void showCustomInfoDialog(
      CustomDialogConfig config) {
    QuickDialogFrameModule frameModule = config.dialogFrameModule ?? QuickDialogFrameModule(location: DiaLogLocation.bottom);
    bool isMiddleDialog = frameModule.location == DiaLogLocation.middle;

    QuickDialogTitleModule titleModule = config.dialogTitleModule ?? QuickDialogTitleModule();
    QuickDialogExtensionButtonModule extBtnsModule = config.dialogButtonModule ?? QuickDialogExtensionButtonModule();

    final Widget otherBtn = simpleCustomButton(
      text: extBtnsModule.otherButtonContent,
      textFontSize: extBtnsModule.buttonTextFontSize,
      buttonHeight: extBtnsModule.buttonHeight,
      textColor: extBtnsModule.otherButtonColor,
      onTap: () => extBtnsModule.onOtherBtnTap?.call(),
    );

    final Widget mainBtn = simpleCustomButton(
      text: extBtnsModule.mainButtonContent,
      textFontSize: extBtnsModule.buttonTextFontSize,
      buttonHeight: extBtnsModule.buttonHeight,
      textColor: extBtnsModule.mainButtonColor,
      onTap: () => extBtnsModule.onMainBtnTap?.call(),
    );

    List<Widget> extBtns = [];
    if (extBtnsModule.needOtherButton) {
      extBtns.add(otherBtn);
    }
    if (extBtnsModule.needMainButton) {
      extBtns.add(mainBtn);
    }

    if (extBtnsModule.extensionButtons != null && extBtnsModule.extensionButtons!.isNotEmpty) {
      if (extBtnsModule.extensionButtonLocation == ExtensionButtonLocation.before) {
        extBtns.insertAll(0, extBtnsModule.extensionButtons!);
      } else if (extBtnsModule.extensionButtonLocation == ExtensionButtonLocation.middle) {
        if (extBtns.length > 1) {
          extBtns.insertAll(1, extBtnsModule.extensionButtons!);
        } else {
          extBtns.insertAll(0, extBtnsModule.extensionButtons!);
        }
      } else {
        extBtns.insertAll(extBtns.length, extBtnsModule.extensionButtons!);
      }
    }

    final Widget customContentDialog = TTMagicBaseDialog(
      title: titleModule.title,
      titleAlign: titleModule.titleAlign,
      titleColor: titleModule.titleColor,
      customContentWidget: config.contentWidget,
      arrangeType: extBtnsModule.arrangeType,
      customWidgetButtons: extBtns,
      location: frameModule.location,
    );

    SmartDialog.show(
      widget: customContentDialog,
      alignmentTemp: isMiddleDialog ? Alignment.center : Alignment.bottomCenter,
    );
  }
}
