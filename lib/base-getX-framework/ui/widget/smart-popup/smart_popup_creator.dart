import 'package:flutter/material.dart';
import 'package:i_chaos/base-getX-framework/ui/widget/icon_text.dart';
import 'package:i_chaos/base-getX-framework/ui/widget/smart_pop_up.dart';
import 'package:i_chaos/base-getX-framework/utils/text_utils.dart';

class SimplePopup {
  String? text;
  Color? textColor;
  int? maxLines;
  Icon? icon;

  SimplePopup({this.text, this.textColor, this.maxLines, this.icon});
}

class SmartPopupCreator {
  static Widget smartIconTextPopup({
    String? text,
    Color? textColor,
    int? maxLines,
    Icon? icon,
  }) =>
      _getIconText(text, textColor, maxLines, icon);

  static _getIconText(String? text, Color? textColor, int? maxLines, Icon? icon) {
    return IconText(
        text: text,
        icon: icon,
        iconPadding: icon == null ? null : const EdgeInsets.only(right: 5),
        style: TextStyle(color: textColor),
        direction: Axis.horizontal,
        maxLines: maxLines ?? 1,
        overflow: TextOverflow.ellipsis);
  }

  // 弹框信息展示
  static Widget smartPopup({
    required Widget anchor,
    String? text,
    Color? textColor,
    int? maxLines,
    Icon? icon,
    Color? backgroundColor,
  }) {
    textColor = textColor ?? Colors.white;

    return _simplePopup(
      anchor: anchor,
      child: _getIconText(text, textColor, maxLines, icon),
      backgroundColor: backgroundColor,
    );
  }

  // 操作菜单
  static Widget smartFloatMenus({
    required Widget anchor,
    required FloatMenuBuilder menuBuilder,
  }) {
    return _simplePopup(
      anchor: anchor,
      child: menuBuilder.call(),
      controller: SmartPopupController(),
    );
  }

  static Widget simpleMenuBuilder({
    required List<FloatMenuItem> menus,
    required FloatMenuItemBuilder itemBuilder,
  }) {
    List<String> strings = menus.map((e) => e.text).toList();
    bool hasIcon = false;
    for (FloatMenuItem item in menus) {
      if (item.icon != null) {
        hasIcon = true;
        break;
      }
    }
    int menusCnt = strings.length;
    StringWidth maxString = TextUtils.computeMaxWidthStringOfItems(strings);
    double itemHeight = TextUtils.getTextSize(maxString.text, maxWidth: maxString.width).height;
    const noneBox = SizedBox(height: 5);
    int noneBoxCnt = menusCnt > 2 ? ((menusCnt - 2) * 2 + 2) : menusCnt;
    final Widget itemList = ListView.builder(
      itemBuilder: (ctx, index) {
        List<Widget> menuItem = [];
        if (menusCnt > 1 && index == menusCnt - 1) {
          menuItem.add(noneBox);
          menuItem.add(itemBuilder.call(menus[index]));
        }

        if (menusCnt > 1 && index == 0) {
          menuItem.add(itemBuilder.call(menus[index]));
          menuItem.add(noneBox);
          menuItem.add(const Divider(height: 1, color: Colors.white));
        }

        if (index != 0 && index != menusCnt - 1) {
          menuItem.add(noneBox);
          menuItem.add(itemBuilder.call(menus[index]));
          menuItem.add(noneBox);
          menuItem.add(const Divider(height: 1, color: Colors.white));
        }

        return Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: menuItem,
        );
      },
      padding: const EdgeInsets.all(0),
      physics: const NeverScrollableScrollPhysics(),
      itemCount: menusCnt,
    );

    return Container(
      width: maxString.width + (hasIcon ? 22 : 0.0),
      height: menusCnt * itemHeight + menusCnt - 1 + noneBoxCnt * noneBox.height!,
      color: const Color(0xFF4C4C4C),
      child: itemList,
    );
  }

  static Widget simpleMenuItemBuilder(FloatMenuItem item, {SmartPopupController? controller}) {
    return InkWell(
      child: IconText(
        text: item.text,
        icon: Icon(item.icon),
        iconPadding: item.icon == null ? null : const EdgeInsets.only(right: 5),
        style: TextStyle(color: item.color),
        direction: Axis.horizontal,
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
      ),
      onTap: () {
        controller?.hide();
        item.onTap?.call();
      },
    );
  }

  // 仅供smart_popup_min使用
  static Widget specialSimPopupWidget({required Widget anchor, required Widget child}) {
    return _simplePopup(anchor: anchor, child: child);
  }

  static Widget _simplePopup({
    required Widget anchor,
    required Widget child,
    Color? backgroundColor,
    PressType pressType = PressType.singleClick,
    EdgeInsetsGeometry? padding,
    double verticalMargin = 3.0,
    double horizontalMargin = 3.0,
    SmartPopupController? controller,
    void Function(bool)? popupOnChange,
  }) {
    return SmartPopup(
      key: UniqueKey(),
      anchor: anchor,
      controller: controller,
      popupBuilder: () {
        return ClipRRect(
          borderRadius: BorderRadius.circular(6),
          child: Container(
            padding: padding ?? const EdgeInsets.all(5),
            color: backgroundColor ?? const Color(0xFF4C4C4C),
            child: child,
          ),
        );
      },
      barrierColor: backgroundColor ?? Colors.black45,
      pressType: pressType,
      verticalMargin: verticalMargin,
      horizontalMargin: horizontalMargin,
      enablePassEvent: false,
    );
  }

  // 自定义widget
  static Widget smartFloatWidget({
    required Widget anchor,
    required Widget child,
    Color? backgroundColor,
    PressType pressType = PressType.singleClick,
    EdgeInsetsGeometry? padding,
    double verticalMargin = 3.0,
    double horizontalMargin = 3.0,
    SmartPopupController? controller,
    void Function(bool)? popupOnChange,
  }) {
    return _simplePopup(
        anchor: anchor,
        child: child,
        pressType: pressType,
        padding: padding,
        backgroundColor: backgroundColor,
        horizontalMargin: horizontalMargin,
        verticalMargin: verticalMargin,
        popupOnChange: popupOnChange,
        controller: controller);
  }
}

typedef FloatMenuBuilder = Widget Function();
typedef FloatMenuItemBuilder = Widget Function(FloatMenuItem item);

class FloatMenuItem {
  IconData? icon;
  String text;
  Color? color;
  VoidCallback? onTap;

  FloatMenuItem({this.icon, required this.text, this.color, this.onTap});
}
