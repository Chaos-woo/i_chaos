// 一个轻松在锚定位置生成小弹窗、注释、菜单的mixin
import 'package:flutter/material.dart';
import 'package:i_chaos/base-getX-framework/ui/widget/smart-popup/smart_popup_creator.dart';
import 'package:i_chaos/base-getX-framework/ui/widget/smart_pop_up.dart';

mixin SmartPopupMixin {
  // 弹框信息展示
  Widget smartPopup({
    required Widget anchor,
    String? text,
    Color? textColor,
    int? maxLines,
    Icon? icon,
    Color? backgroundColor,
  }) {
    return SmartPopupCreator.smartPopup(
      anchor: anchor,
      text: text,
      textColor: textColor,
      maxLines: maxLines,
      icon: icon,
      backgroundColor: backgroundColor,
    );
  }

  // 操作菜单
  Widget smartFloatMenus({
    required Widget anchor,
    required FloatMenuBuilder menuBuilder,
  }) {
    return SmartPopupCreator.specialSimPopupWidget(anchor: anchor, child: menuBuilder.call());
  }

  Widget simpleMenuBuilder({
    required List<FloatMenuItem> menus,
    required FloatMenuItemBuilder itemBuilder,
  }) {
    return SmartPopupCreator.simpleMenuBuilder(menus: menus, itemBuilder: itemBuilder);
  }

  Widget simpleMenuItemBuilder(FloatMenuItem item) {
    return SmartPopupCreator.simpleMenuItemBuilder(item);
  }

  // 自定义widget
  Widget smartFloatWidget({
    required Widget anchor,
    required Widget child,
    Color? backgroundColor,
    PressType pressType = PressType.singleClick,
    EdgeInsetsGeometry? padding,
    double verticalMargin = 0.0,
    double horizontalMargin = 0.0,
    SmartPopupController? controller,
    void Function(bool)? popupOnChange,
  }) {
    return SmartPopupCreator.smartFloatWidget(anchor: anchor, child: child);
  }
}
