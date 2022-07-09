// ignore_for_file: unnecessary_this, must_be_immutable

import 'package:flutter/material.dart';
import 'package:i_chaos/base-getX-framework/extension/size_adapter_extension.dart';
import 'package:i_chaos/base-getX-framework/get-x/views/widgets/stateful_ctrl_widget.dart';
import 'package:i_chaos/generated/l10n.dart';
import 'package:i_chaos/ichaos/common-module/configs/routes/app_routes.dart';
import 'package:i_chaos/ichaos/common-module/get-controllers/color-theme/flex_color_theme_ctrl.dart';
import 'package:i_chaos/ichaos/common-module/resources/app_style.dart';
import 'package:i_chaos/ichaos/todos-module/todos-domain/todos-common/models/todo_vo.dart';
import 'package:i_chaos/ichaos/todos-module/todos-domain/todos-widgets/floating-button/home-floating-button/home_todo_floating_btn_ctrl.dart';
import 'package:i_chaos/ichaos/todos-module/todos-domain/todos-widgets/floating-button/home-floating-button/home_todo_slide_btns.dart';

class HomeTodoFloatingBtnWidget extends StatefulCtrlWidget<HomeTodoFloatingBtnCtrl> {
  // 避免多个FloatingActionButton重复使用默认tag的异常
  static const String todayBtnTag = 'today_tag';
  static const String addBtnTag = 'add_tag';

  HomeTodoFloatingBtnWidget({Key? key}) : super(key: key);

  @override
  Widget ctrlWidgetBuilder() {
    List<Widget> floatingBtns = _floatingBtnsBuilder();
    return HomeTodoSlideBtnsWidget(floatingBtns);
  }

  List<Widget> _floatingBtnsBuilder() {
    List<Widget> floatingBtns = [];
    FlexColorThemeCtrl themeCtrl = findReference();
    Color primaryColor = themeCtrl.getPrimaryColor();

    if (!metaCtrl.isToday) {
      floatingBtns.add(
        _FloatingButtonEntry(
          backgroundColor: themeCtrl.getFitModeColor(
              lightModeColor: AppStyle.colors.gray50,
              darkModeColor: AppStyle.colors.lightGray),
          customChild: Text(
            S.current.todos_home_fba_widget_btn_today,
            style: AppStyle.textStyles.f18CustomColor.call(themeCtrl.getPrimaryColor()),
          ),
          heroTag: todayBtnTag,
          onTap: () => metaCtrl.back2Today(),
        ),
      );
      floatingBtns.add(20.hGap);
    }

    floatingBtns.add(
      _FloatingButtonEntry(
        icon: Icons.add,
        color: themeCtrl.getFitModeColor(
            lightModeColor: AppStyle.colors.white, usingPrimary: true),
        backgroundColor: themeCtrl.getFitModeColor(
            lightModeColor: primaryColor, darkModeColor: AppStyle.colors.gray50),
        heroTag: addBtnTag,
        onTap: () => push(AppRoutes.TODOS_EDITING, arguments: TodoVO.empty()),
      ),
    );

    return floatingBtns;
  }

  @override
  void preDispose() {
    super.preDispose();
  }
}

class _FloatingButtonEntry extends StatelessWidget {
  Color? backgroundColor;
  IconData? icon;
  Color? color;
  Widget? customChild;
  String? heroTag;
  VoidCallback? onTap;

  _FloatingButtonEntry({
    this.icon,
    this.color,
    this.customChild,
    this.backgroundColor,
    this.heroTag,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      child: customChild ?? Icon(icon, color: color),
      backgroundColor: backgroundColor,
      heroTag: heroTag,
      onPressed: onTap,
    );
  }
}
