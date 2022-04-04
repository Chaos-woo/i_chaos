// 一个轻松在锚定位置生成小弹窗、注释、菜单的mixin
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:i_chaos/base-getX-framework/ui/widget/icon_text.dart';
import 'package:i_chaos/base-getX-framework/ui/widget/smart_pop_up.dart';
import 'package:i_chaos/base-getX-framework/utils/my_units.dart';

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
    return _simplePopup(
      anchor: anchor,
      child: IconText(
          text: text,
          icon: icon,
          iconPadding: icon == null ? null : const EdgeInsets.only(right: 5),
          style: TextStyle(color: textColor ?? (Get.isDarkMode ? Colors.white70 : Colors.white)),
          direction: Axis.horizontal,
          maxLines: maxLines ?? 1,
          overflow: TextOverflow.ellipsis),
      backgroundColor: backgroundColor,
    );
  }

  // 操作菜单
  Widget smartFloatMenus({required Widget anchor, required FloatMenuBuilder menuBuilder}) {
    return _simplePopup(anchor: anchor, child: menuBuilder.call());
  }

  Widget simpleMenuBuilder({
    required List<FloatMenuItem> menus,
    required FloatMenuItemBuilder itemBuilder,
    double fontSizeBaseline = 16,
    double itemHeightBaseline = 35,
  }) {
    List<String> strings = menus.map((e) => e.text).toList();
    int menusCnt = strings.length;
    double maxWidth = computeMaxWidthOfStrings(strings, fontSizeBaseline);
    return Container(
      width: maxWidth,
      height: menusCnt * itemHeightBaseline + menusCnt - 1,
      color: const Color(0xFF4C4C4C),
      child: ListView.builder(
        itemBuilder: (ctx, index) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              itemBuilder.call(menus[index]),
              if (index != menusCnt - 1) Divider(height: 1, color: Get.isDarkMode ? Colors.white70 : Colors.white)
            ],
          );
        },
        padding: const EdgeInsets.all(0),
        physics: const NeverScrollableScrollPhysics(),
        itemCount: menusCnt,
      ),
    );
  }

  Widget simpleMenuItemBuilder(FloatMenuItem item, double fontSize) {
    return InkWell(
      child: IconText(
        text: item.text,
        icon: item.icon,
        iconPadding: item.icon == null ? null : const EdgeInsets.only(right: 5),
        style: TextStyle(fontSize: fontSize, color: item.color ?? (Get.isDarkMode ? Colors.white70 : Colors.white)),
        direction: Axis.horizontal,
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
      ),
      onTap: () => item.onTap?.call(),
    );
  }

  Widget _simplePopup({
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
    return SmartPopup(
      key: UniqueKey(),
      anchor: anchor,
      controller: controller,
      popupBuilder: () {
        return ClipRRect(
          borderRadius: BorderRadius.circular(6),
          child: Container(
            padding: padding ?? const EdgeInsets.all(5),
            color: backgroundColor ?? const Color(0xff5D5D5E),
            child: child,
          ),
        );
      },
      barrierColor: Colors.transparent,
      pressType: pressType,
      verticalMargin: verticalMargin,
      horizontalMargin: horizontalMargin,
      enablePassEvent: false,
    );
  }

  // 自定义widget
  Widget smartFloatYoursWidget({
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
  Icon? icon;
  String text;
  Color? color;
  VoidCallback? onTap;

  FloatMenuItem({this.icon, required this.text, this.color, this.onTap});
}
