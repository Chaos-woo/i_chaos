import 'package:flutter/material.dart';
import 'package:i_chaos/ichaos/common-module/resources/app_style.dart';
import 'package:i_chaos/ichaos/common-module/resources/app_layout.dart';

enum LeadingType { text, icon, none }

class NavBarLeading {
  String? text;
  IconData? icon;
  VoidCallback? onTap;

  NavBarLeading({this.text, this.icon, this.onTap});

  NavBarLeading.text(this.text);

  NavBarLeading.icon(this.icon);

  void setOnTap(VoidCallback onTap) {
    this.onTap = onTap;
  }

  LeadingType _judgeLeading() {
    if (null != text) {
      return LeadingType.text;
    } else if (null != icon) {
      return LeadingType.icon;
    } else {
      return LeadingType.none;
    }
  }

  Widget leadingWidget({Color? color}) {
    LeadingType type = _judgeLeading();

    Widget leading;

    if (LeadingType.text == type) {
      TextStyle style = color != null
          ? AppStyle.textStyles.f14CustomColor(color)
          : AppStyle.textStyles.f14MediumNoColor;
      leading = Text(
        text!,
        style: style,
      );
    } else if (LeadingType.icon == type) {
      leading = Icon(
        icon,
        color: color,
        size: AppStyle.fontSize.large_22,
      );
    } else {
      return AppLayout.box.none;
    }

    return InkWell(
      child: leading,
      onTap: onTap,
    );
  }
}
