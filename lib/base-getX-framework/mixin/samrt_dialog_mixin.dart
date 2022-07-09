// ignore_for_file: prefer_initializing_formals

import 'package:flutter/material.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:i_chaos/base-getX-framework/commons/base-module/dialog-module/dialog_action.dart';
import 'package:i_chaos/base-getX-framework/commons/base-module/dialog-module/dialog_actions.dart';
import 'package:i_chaos/base-getX-framework/commons/base-module/dialog-module/dialog_content.dart';
import 'package:i_chaos/base-getX-framework/commons/base-module/dialog-module/dialog_frame.dart';
import 'package:i_chaos/base-getX-framework/commons/base-module/dialog-module/dialog_title.dart';
import 'package:i_chaos/base-getX-framework/ui/widget/ww-dialog/ww_dialog_container.dart';
import 'package:i_chaos/generated/l10n.dart';

/// 使用前需要在MaterialApp对flutter_smart_dialog进行初始化
/// 掘金：https://juejin.cn/post/7026150456673959943#heading-1
/// pubdev：https://pub.dev/packages/flutter_smart_dialog/install

// 常用场景的dialog
mixin SmartDialogMixin {
  Future<T?> showSingleDialog<T>({
    required DialogTitle title,
    required DialogContent content,
    DialogFrame? customFrame,
    String? actionText,
    VoidCallback? onTap,
  }) {
    DialogFrame frame = DialogFrame().merge(customFrame);
    SingleAction action =
        SingleAction(actionText ?? S.current.common_ok_button, onTap);
    SingleDialogAction actions = SingleDialogAction.actions(action);

    final Widget dialog = TTMagicBaseDialog(
      title: title.title,
      titleAlign: title.titleAlign,
      titleColor: title.titleColor,
      content: content.content,
      customContentWidget: content.widget,
      contentAlign: content.contentAlign,
      contentColor: content.contentColor,
      contentFontSize: content.contentFontSize,
      arrangeType: actions.arrangeType,
      location: frame.location,
      customWidgetButtons: actions.widgets(),
      needTitleSizeBox: frame.needTitleSizeBox,
      needContentSizeBox: frame.needContentSizeBox,
      dialogMaxWidth: frame.dialogMaxWidth,
    );

    return SmartDialog.show<T>(
      builder: (ctx) => dialog,
      alignment: frame.dialogAlignment(),
      clickMaskDismiss: frame.clickMaskDismiss,
      useAnimation: frame.useAnimation,
      animationType: frame.animationType,
      animationTime: frame.animationTime,
    );
  }

  Future<T?> showConfirmDialog<T>({
    required DialogTitle title,
    required DialogContent content,
    String? confirmText,
    String? cancelText,
    VoidCallback? confirmTap,
    VoidCallback? cancelTap,
    Color? overrideMainColor,
    ConfirmActionLocation? confirmActionLocation,
    double? confirmActionRatio,
    DialogFrame? customFrame,
  }) {
    DialogFrame frame = DialogFrame().merge(customFrame);
    ConfirmAction confirmAction = ConfirmAction(
      confirmText ?? S.current.common_confirm_button,
      confirmTap,
      overrideMainColor: overrideMainColor,
    );
    ConfirmAction cancelAction = ConfirmAction(
      confirmText ?? S.current.common_cancel_button,
      cancelTap,
      isConfirmAction: false,
    );
    ConfirmDialogAction actions =
        ConfirmDialogAction.actions([confirmAction, cancelAction]);
    // 主按钮样式设置
    actions.confirmActionStyle(
      confirmActionLocation: confirmActionLocation,
      confirmActionRatio: confirmActionRatio,
    );

    final Widget dialog = TTMagicBaseDialog(
      title: title.title,
      titleAlign: title.titleAlign,
      titleColor: title.titleColor,
      content: content.content,
      customContentWidget: content.widget,
      contentAlign: content.contentAlign,
      contentColor: content.contentColor,
      contentFontSize: content.contentFontSize,
      arrangeType: actions.arrangeType,
      location: frame.location,
      customWidgetButtons: actions.widgets(),
      needTitleSizeBox: frame.needTitleSizeBox,
      needContentSizeBox: frame.needContentSizeBox,
      dialogMaxWidth: frame.dialogMaxWidth,
    );

    return SmartDialog.show<T>(
      builder: (ctx) => dialog,
      alignment: frame.dialogAlignment(),
      clickMaskDismiss: frame.clickMaskDismiss,
      useAnimation: frame.useAnimation,
      animationType: frame.animationType,
      animationTime: frame.animationTime,
    );
  }

  Future<T?> showDeleteDialog<T>({
    DialogTitle? title,
    required DialogContent content,
    VoidCallback? deleteTap,
    VoidCallback? cancelTap,
    ConfirmActionLocation? deleteActionLocation,
    DialogFrame? customFrame,
  }) {
    DialogFrame frame = DialogFrame().merge(customFrame);
    DialogTitle deleteTitle =
        title ?? DialogTitle.title(title: S.current.common_delete_title);
    ConfirmAction deleteAction = ConfirmAction(
      S.current.common_delete_button,
      deleteTap,
      overrideMainColor: DialogActionConst.attentionColor,
    );
    ConfirmAction cancelAction = ConfirmAction(
      S.current.common_cancel_button,
      cancelTap,
      isConfirmAction: false,
    );
    ConfirmDialogAction actions =
        ConfirmDialogAction.actions([deleteAction, cancelAction]);

    final Widget dialog = TTMagicBaseDialog(
      title: deleteTitle.title,
      titleAlign: deleteTitle.titleAlign,
      titleColor: deleteTitle.titleColor,
      content: content.content,
      customContentWidget: content.widget,
      contentAlign: content.contentAlign,
      contentColor: content.contentColor,
      contentFontSize: content.contentFontSize,
      arrangeType: actions.arrangeType,
      location: frame.location,
      customWidgetButtons: actions.widgets(),
      needTitleSizeBox: frame.needTitleSizeBox,
      needContentSizeBox: frame.needContentSizeBox,
      dialogMaxWidth: frame.dialogMaxWidth,
    );

    return SmartDialog.show<T>(
      builder: (ctx) => dialog,
      alignment: frame.dialogAlignment(),
      clickMaskDismiss: frame.clickMaskDismiss,
      useAnimation: frame.useAnimation,
      animationType: frame.animationType,
      animationTime: frame.animationTime,
    );
  }

  Future<T?> showMultiActionDialog<T>({
    required DialogTitle title,
    required DialogContent content,
    required List<MultiAction> multiActions,
    DiaLogLocation? location,
    DialogFrame? customFrame,
    DialogActionArrangeType? arrangeType,
  }) {
    DialogFrame frame =
        DialogFrame(location: location ?? DiaLogLocation.middle).merge(customFrame);
    MultiDialogAction actions = MultiDialogAction.actions(multiActions, arrangeType: arrangeType);

    final Widget dialog = TTMagicBaseDialog(
      title: title.title,
      titleAlign: title.titleAlign,
      titleColor: title.titleColor,
      customContentWidget: content.widget,
      content: content.content,
      contentAlign: content.contentAlign,
      contentColor: content.contentColor,
      contentFontSize: content.contentFontSize,
      arrangeType: actions.arrangeType,
      location: frame.location,
      customWidgetButtons: actions.widgets(),
      needTitleSizeBox: frame.needTitleSizeBox,
      needContentSizeBox: frame.needContentSizeBox,
      dialogMaxWidth: frame.dialogMaxWidth,
    );

    return SmartDialog.show<T>(
      builder: (ctx) => dialog,
      alignment: frame.dialogAlignment(),
      clickMaskDismiss: frame.clickMaskDismiss,
      useAnimation: frame.useAnimation,
      animationType: frame.animationType,
      animationTime: frame.animationTime,
    );
  }
}
