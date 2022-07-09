import 'package:flutter/material.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:i_chaos/base-getX-framework/commons_exports.dart';

/// 默认自定义按钮（中间、底部弹窗自定义按钮）
class DialogButtonCreator {
  static Widget create({
    required String text,
    required Color textColor,
    required double textFontSize,
    required FontWeight fontWeight,
    required double buttonHeight,
    VoidCallback? onTap,
    VoidCallback? dismiss,
  }) =>
      TextButton(
        onPressed: () {
          dismiss?.call();
          Future.delayed(Duration.zero, () => onTap?.call());
        },
        child: Text(text,
            overflow: TextOverflow.ellipsis,
            maxLines: 2,
            style: TextStyle(
              fontSize: textFontSize,
              color: textColor,
              fontWeight: fontWeight,
            )),
      ).intoSizedBox(height: buttonHeight);

  static Widget originalCreate({
    required String text,
    Color? textColor,
    required double textFontSize,
    required FontWeight fontWeight,
    required double height,
    VoidCallback? onTap,
    bool needCloseDialog = true,
  }) =>
      TextButton(
        onPressed: () {
          if (needCloseDialog) {
            SmartDialog.dismiss(status: SmartStatus.dialog);
          }
          onTap?.call();
        },
        child: Text(text,
            overflow: TextOverflow.ellipsis,
            maxLines: 2,
            style: TextStyle(
              fontSize: textFontSize,
              color: textColor,
              fontWeight: fontWeight,
            )),
      ).intoSizedBox(height: height);
}
