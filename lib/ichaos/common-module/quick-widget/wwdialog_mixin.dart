// ignore_for_file: prefer_initializing_formals

import 'package:flutter/material.dart';
import 'package:i_chaos/ichaos/public/widgets/ww-dialog/ww_dialog.dart';

class QuickDialogConfig {
  late String? title;
  late TextAlign titleAlign;
  late Color titleColor;
  late String content;
  late TextAlign contentAlign;
  late Color contentColor;
  late double contentFontSize;
  late double dismissibleButtonTextFontSize;
  late double buttonHeight;
  late Color dismissibleButtonColor;
  late Color cancelButtonColor;
  late String dismissibleContent;
  late String cancelContent;
  late VoidCallback? onDismissible;
  late VoidCallback? onCancel;
  late DiaLogLocation location;
  late bool needDismissibleButton;
  late bool needCancelButton;

  QuickDialogConfig({
    String? title,
    TextAlign titleAlign = TextAlign.center,
    Color titleColor = Colors.red,
    String content = '',
    TextAlign contentAlign = TextAlign.start,
    Color contentColor = Colors.black,
    double contentFontSize = 15.0,
    double dismissibleButtonTextFontSize = 15.0,
    double buttonHeight = 35.0,
    Color dismissibleButtonColor = Colors.red,
    Color cancelButtonColor = Colors.grey,
    String dismissibleContent = 'Ok',
    String cancelContent = 'Cancel',
    VoidCallback? onDismissible,
    VoidCallback? onCancel,
    DiaLogLocation location = DiaLogLocation.middle,
    bool needDismissibleButton = true,
    bool needCancelButton = true,
  }) {
    this.title = title;
    this.titleAlign = titleAlign;
    this.titleColor = titleColor;
    this.content = content;
    this.contentAlign = contentAlign;
    this.contentColor = contentColor;
    this.contentFontSize = contentFontSize;
    this.dismissibleButtonTextFontSize = dismissibleButtonTextFontSize;
    this.buttonHeight = buttonHeight;
    this.cancelButtonColor = cancelButtonColor;
    this.dismissibleContent = dismissibleContent;
    this.cancelContent = cancelContent;
    this.cancelContent = cancelContent;
    this.onDismissible = onDismissible;
    this.onCancel = onCancel;
    this.location = location;
    this.needDismissibleButton = needDismissibleButton;
    this.needCancelButton = needCancelButton;
  }
}

class MoreOptionButton {
  final String text;
  final VoidCallback? onTap;
  late Color textColor;
  late FontWeight fontWeight;

  MoreOptionButton(this.text, this.onTap, {Color textColor = Colors.blue, FontWeight fontWeight = FontWeight.w500}) {
    this.textColor = textColor;
    this.fontWeight = fontWeight;
  }
}

mixin WWDialogMixin {
  void showDismissibleDialog(
    BuildContext context, {
    required QuickDialogConfig config,
  }) {
    WWDialog.showMiddleDialog(
      context,
      title: config.title,
      titleAlign: config.titleAlign,
      titleColor: config.titleColor,
      content: config.content,
      contentAlign: config.contentAlign,
      contentColor: config.contentColor,
      contentFontSize: config.contentFontSize,
      arrangeType: buttonArrangeType.row,
      customWidgetButtons: [
        defaultCustomButton(
          context,
          text: config.dismissibleContent,
          textFontSize: config.dismissibleButtonTextFontSize,
          buttonHeight: config.buttonHeight,
          textColor: config.dismissibleButtonColor,
          onTap: () {
            config.onDismissible?.call();
          },
        ),
        defaultCustomButton(
          context,
          text: config.cancelContent,
          textFontSize: config.dismissibleButtonTextFontSize,
          buttonHeight: config.buttonHeight,
          textColor: config.cancelButtonColor,
          onTap: () => config.onCancel?.call(),
        ),
      ],
    );
  }

  void showSimpleInfoDialog(
    BuildContext context, {
    required QuickDialogConfig config,
  }) {
    WWDialog.showMiddleDialog(
      context,
      title: config.title,
      titleAlign: config.titleAlign,
      titleColor: config.titleColor,
      content: config.content,
      location: config.location,
      contentAlign: config.contentAlign,
      contentColor: config.contentColor,
      contentFontSize: config.contentFontSize,
      arrangeType: buttonArrangeType.row,
      customWidgetButtons: [
        if (config.needDismissibleButton)
          defaultCustomButton(
            context,
            text: config.dismissibleContent,
            textFontSize: config.dismissibleButtonTextFontSize,
            buttonHeight: config.buttonHeight,
            textColor: config.dismissibleButtonColor,
            onTap: () => config.onDismissible?.call(),
          ),
      ],
    );
  }

  void showCustomInfoDialog(
    BuildContext context, {
    required QuickDialogConfig config,
    required Widget infoWidget,
  }) {
    WWDialog.showMiddleDialog(
      context,
      title: config.title,
      titleAlign: config.titleAlign,
      titleColor: config.titleColor,
      customContentWidget: infoWidget,
      location: config.location,
      arrangeType: buttonArrangeType.row,
      customWidgetButtons: [
        if (config.needDismissibleButton)
          defaultCustomButton(
            context,
            text: config.dismissibleContent,
            textFontSize: config.dismissibleButtonTextFontSize,
            buttonHeight: config.buttonHeight,
            textColor: config.dismissibleButtonColor,
            onTap: () => config.onDismissible?.call(),
          ),
      ],
    );
  }

  void showMoreOptionDialog(
    BuildContext context, {
    required QuickDialogConfig config,
    required List<MoreOptionButton> buttons,
  }) {
    WWDialog.showBottomDialog(
      context,
      isSystemBottomDialog: false,
      location: config.location,
      customTitleWidget: Container(
        padding: const EdgeInsets.symmetric(vertical: 15),
        child: Text(
          config.title ?? 'More Options',
          style: TextStyle(
            fontSize: 17.0,
            fontWeight: FontWeight.w500,
            color: config.titleColor,
          ),
        ),
      ),
      customWidgetButtons: [
        for (MoreOptionButton button in buttons)
          defaultCustomButton(
            context,
            text: button.text,
            textColor: button.textColor,
            fontWeight: button.fontWeight,
            onTap: () => button.onTap?.call(),
          ),
      ],
      arrangeType: buttonArrangeType.column,
    );
  }
}
