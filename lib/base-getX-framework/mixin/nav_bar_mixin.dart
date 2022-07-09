import 'package:bruno/bruno.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:i_chaos/base-getX-framework/commons/base-module/navbar-module/navbar_actions.dart';
import 'package:i_chaos/base-getX-framework/commons/base-module/navbar-module/navbar_leading.dart';
import 'package:i_chaos/base-getX-framework/commons/base-module/navbar-module/navbar_title.dart';
import 'package:i_chaos/base-getX-framework/extension/size_adapter_extension.dart';
import 'package:i_chaos/base-getX-framework/flutter3-pak-process/widget-chain/widget_chain.dart';
import 'package:i_chaos/base-getX-framework/get-x/mixin/get_navigation_mixin.dart';
import 'package:i_chaos/base-getX-framework/mixin/screen_mixin.dart';
import 'package:i_chaos/ichaos/common-module/get-controllers/color-theme/flex_color_theme_ctrl.dart';
import 'package:i_chaos/icons/ali_icons.dart';

mixin NavBarMixin on ScreenMixin, GetXNavigationMixin {
  Widget keepOutBottomPadding({
    required Widget child,
    EdgeInsets? edgeInsets,
  }) {
    return Material(
      child: Padding(
        padding: edgeInsets ?? EdgeInsets.only(bottom: bottomBarHeight),
        child: child,
      ),
    );
  }

  Widget mainSpace({required Widget child}) {
    return SizedBox(
      width: screenWidth,
      height: screenHeight - statusBarHeight - commonAppBarHeight - bottomBarHeight,
      child: child,
    );
  }

  static double commonAppBarHeight = 40.0;
  static double commonAppBarLeftSpace = 3.0;

  double get remainHeightWithoutAppBar => screenHeight - commonAppBarHeight;

  // 通用型appBar
  BrnAppBar commonsAppBar({
    required NavBarTitle title,
    required NavBarLeading leading,
    required NavBarActions actions,
    Color? backgroundColor,
  }) {
    FlexColorThemeCtrl themeCtrl = Get.find<FlexColorThemeCtrl>();

    return BrnAppBar(
      automaticallyImplyLeading: false,
      leading: leading.leadingWidget(),
      title: title.alignment == TitleAlignment.left
          ? commonAppBarLeftSpace.hGap
              .addNeighbor(Text(title.singleTitle()))
              .intoRow(mainAxisSize: MainAxisSize.max)
          : title.singleTitle(),
      themeData: BrnAppBarConfig(
        backgroundColor:
            themeCtrl.isDarkMode ? themeCtrl.darkModeColor : themeCtrl.getPrimaryColor(),
        appBarHeight: commonAppBarHeight,
      ),
      actions: actions.actionWidgets(),
    );
  }

  BrnAppBar backNavBar({
    required String title,
    List<NavBarAction>? actions,
    Color? backgroundColor,
    bool centerTitle = false,
    VoidCallback? backOnTap,
  }) {
    NavBarTitle navTitle = NavBarTitle.title(title, isCenter: centerTitle);
    NavBarLeading navLeading = NavBarLeading.icon(AliIcons.IconReturn);
    navLeading.setOnTap(() {
      if (backOnTap != null) {
        backOnTap.call();
      } else {
        pop();
      }
    });
    NavBarActions navActions = NavBarActions.action(actions);
    return commonsAppBar(
      title: navTitle,
      leading: navLeading,
      actions: navActions,
    );
  }

  BrnAppBar noTapNavBar({
    required String title,
    List<NavBarAction>? actions,
    Color? backgroundColor,
    bool centerTitle = false,
    IconData? leadingIcon,
  }) {
    NavBarTitle navTitle = NavBarTitle.title(title, isCenter: centerTitle);
    NavBarLeading navLeading = NavBarLeading.icon(leadingIcon);
    NavBarActions navActions = NavBarActions.action(actions);
    return commonsAppBar(
      title: navTitle,
      leading: navLeading,
      actions: navActions,
    );
  }

  BrnAppBar tapNavBar({
    required String title,
    List<NavBarAction>? actions,
    Color? backgroundColor,
    bool centerTitle = false,
    IconData? leadingIcon,
    VoidCallback? leadingOnTap,
  }) {
    NavBarTitle navTitle = NavBarTitle.title(title, isCenter: centerTitle);
    NavBarLeading navLeading = NavBarLeading.icon(leadingIcon);
    navLeading.setOnTap(() => leadingOnTap?.call());
    NavBarActions navActions = NavBarActions.action(actions);
    return commonsAppBar(
      title: navTitle,
      leading: navLeading,
      actions: navActions,
    );
  }
}
