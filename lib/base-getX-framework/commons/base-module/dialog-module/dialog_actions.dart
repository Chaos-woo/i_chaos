import 'package:flutter/material.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:get/get.dart';
import 'package:i_chaos/base-getX-framework/commons/base-module/dialog-module/dialog_action.dart';
import 'package:i_chaos/base-getX-framework/ui/widget/ww-dialog/dialog_button_creator.dart';
import 'package:i_chaos/ichaos/common-module/get-controllers/color-theme/flex_color_theme_ctrl.dart';
import 'package:i_chaos/ichaos/common-module/resources/app_style.dart';

// dialog按钮基础配置

// 按钮展示: 水平、垂直
enum DialogActionArrangeType { row, column }

enum ConfirmActionLocation { left, right }

class DialogActionConstHolder {
  static final holder = DialogActionConst();
}

final defaultCloseDialog = () => SmartDialog.dismiss(status: SmartStatus.dialog);

// 扩展动作按钮相对于基础动作按钮的位置
enum ExtActionLocation { before, after }

class DialogActionConst {
  static Color normalColor = AppStyle.colors.blueAccent;
  static Color warnColor = AppStyle.colors.warn;
  static Color attentionColor = AppStyle.colors.red;
  static Color secondaryColor = AppStyle.colors.neutralGray;

  Color Function() get mainColor =>
      () => Get.find<FlexColorThemeCtrl>().getPrimaryColor();

  static FontWeight normalWeight = AppStyle.fontWidget.normalMore;
  static FontWeight boldWeight = AppStyle.fontWidget.bold;

  static double commonFontSize = AppStyle.fontSize.medium_16;
  static double commonButtonHeight = 45.0;
}

mixin DialogActionMixin {
  List<Widget> widgets();
}

abstract class AbstractDialogActions implements DialogActionMixin {
  // 按钮排列方式
  DialogActionArrangeType arrangeType;

  // 按钮整体高度
  double buttonHeight;

  // 按钮通用字体大小
  double buttonTextFontSize;

  AbstractDialogActions({
    required this.arrangeType,
    required this.buttonHeight,
    required this.buttonTextFontSize,
  });
}

// dialog基本按钮模块
abstract class BaseDialogActions extends AbstractDialogActions {
  late List<BaseDialogAction> actions;

  // 点击遮罩是否可关闭
  late bool barrierDismissible;

  BaseDialogActions.actions({
    DialogActionArrangeType? arrangeType,
    double? buttonHeight,
    double? buttonTextFontSize,
    this.barrierDismissible = true,
  }) : super(
          arrangeType: arrangeType ?? DialogActionArrangeType.row,
          buttonHeight: buttonHeight ?? DialogActionConst.commonButtonHeight,
          buttonTextFontSize: buttonTextFontSize ?? DialogActionConst.commonFontSize,
        ) {
    actions = [];
  }
}

class SingleDialogAction extends BaseDialogActions {
  static int maxAction = 1;

  SingleDialogAction.actions(SingleAction action) : super.actions() {
    action.style(
      textColor: DialogActionConst.normalColor,
      fontWeight: DialogActionConst.normalWeight,
      height: buttonHeight,
      fontSize: buttonTextFontSize,
    );
    actions.add(action);
  }

  @override
  List<Widget> widgets() {
    return actions.map((e) {
      return DialogButtonCreator.create(
        text: e.text,
        textFontSize: e.fontSize,
        buttonHeight: e.height,
        textColor: e.textColor,
        fontWeight: e.fontWeight,
        onTap: e.onTap,
        dismiss: defaultCloseDialog,
      );
    }).toList();
  }
}

class ConfirmDialogAction extends BaseDialogActions {
  static int maxAction = 2;
  ConfirmActionLocation confirmActionLocation = ConfirmActionLocation.right;
  double confirmActionRatio = 0.5;

  ConfirmDialogAction.actions(List<ConfirmAction> actions) : super.actions() {
    for (ConfirmAction action in actions) {
      action.style(
        textColor: DialogActionConst.normalColor,
        fontWeight: DialogActionConst.normalWeight,
        height: buttonHeight,
        fontSize: buttonTextFontSize,
      );
    }
    super.actions.addAll(actions);
  }

  void confirmActionStyle({
    ConfirmActionLocation? confirmActionLocation,
    double? confirmActionRatio,
  }) {
    this.confirmActionLocation = confirmActionLocation ?? this.confirmActionLocation;
    this.confirmActionRatio = confirmActionRatio ?? this.confirmActionRatio;
  }

  @override
  List<Widget> widgets() {
    List<Widget> buttons = actions.map((e) {
      e = e as ConfirmAction;
      Color color = e.isConfirmAction!
          ? (e.overrideMainColor ?? DialogActionConstHolder.holder.mainColor.call())
          : DialogActionConst.secondaryColor;

      return DialogButtonCreator.create(
        text: e.text,
        textFontSize: e.fontSize,
        buttonHeight: e.height,
        textColor: color,
        fontWeight: e.fontWeight,
        onTap: e.onTap,
        dismiss: defaultCloseDialog,
      );
    }).toList();

    if (ConfirmActionLocation.right == confirmActionLocation) {
      buttons = buttons.reversed.toList();
    }

    return buttons;
  }
}

class MultiDialogAction extends BaseDialogActions {
  MultiDialogAction.actions(
    List<MultiAction> actions, {
    DialogActionArrangeType? arrangeType,
  }) : super.actions(arrangeType: arrangeType ?? DialogActionArrangeType.column) {
    for (MultiAction action in actions) {
      action.style(
        textColor: action.specificColor ?? DialogActionConst.normalColor,
        fontWeight: DialogActionConst.normalWeight,
        height: buttonHeight,
        fontSize: buttonTextFontSize,
      );
    }
    super.actions.addAll(actions);
  }

  @override
  List<Widget> widgets() {
    return actions.map((e) {
      return DialogButtonCreator.create(
        text: e.text,
        textFontSize: e.fontSize,
        buttonHeight: e.height,
        textColor: e.textColor,
        fontWeight: e.fontWeight,
        onTap: e.onTap,
        dismiss: (e as MultiAction).clickDismiss ? defaultCloseDialog : () {},
      );
    }).toList();
  }
}
