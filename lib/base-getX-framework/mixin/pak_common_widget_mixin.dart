
import 'package:flutter/material.dart';
import 'package:i_chaos/base-getX-framework/common/common_google_fonts.dart';
import 'package:i_chaos/base-getX-framework/mixin/get_x_navigation_mixin.dart';
import 'package:i_chaos/base-getX-framework/mixin/screen_adapter_mixin.dart';
import 'package:i_chaos/icons/ali_icons.dart';

mixin PakCommonWidget on ScreenAdapterMixin, GetXNavigationMixin {
  Widget autoBottomBarPaddingFrame({required Widget child, EdgeInsets? edgeInsets}) {
    return Material(
      child: Padding(
        padding: edgeInsets ?? EdgeInsets.only(bottom: bottomBarHeight),
        child: child,
      ),
    );
  }

  static double commonAppBarHeight = 40.0;
  double get leftAppBarHeight => screenHeight - commonAppBarHeight;

  AppBar commonAppBar({
    required String title,
    Color titleColor = Colors.white,
    List<Widget>? actions,
    Color backgroundColor = Colors.black,
    bool centerTitle = false,
    double? elevation = 0.0,
    Color leadingButtonColor = Colors.white,
    bool needAutoBack = true,
    IconData leadingButtonIcon = AliIcons.IconReturn,
    VoidCallback? leadingButtonOnTap,
  }) {
    return AppBar(
      titleSpacing: -5,
      toolbarHeight: commonAppBarHeight,
      elevation: elevation,
      centerTitle: centerTitle,
      actions: actions,
      title: Text(
        title,
        style: CommonGoogleFont.fredoka(color: titleColor),
      ),
      backgroundColor: backgroundColor,
      leading: InkWell(
        child: Icon(
          leadingButtonIcon,
          color: leadingButtonColor,
        ),
        onTap: () {
          needAutoBack ? pop() : leadingButtonOnTap?.call();
        },
      ),
    );
  }
}