// ignore_for_file: must_be_immutable, prefer_function_declarations_over_variables

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:i_chaos/base-getX-framework/mixin/delayed_mixin.dart';
import 'package:i_chaos/base-getX-framework/get-x/mixin/get_reference_mixin.dart';
import 'package:i_chaos/base-getX-framework/get-x/mixin/get_navigation_mixin.dart';
import 'package:i_chaos/base-getX-framework/mixin/nav_bar_mixin.dart';
import 'package:i_chaos/base-getX-framework/mixin/samrt_dialog_mixin.dart';
import 'package:i_chaos/base-getX-framework/mixin/screen_mixin.dart';
import 'package:i_chaos/base-getX-framework/mixin/smart_popup_mixin.dart';
import 'package:i_chaos/base-getX-framework/mixin/toast_mixin.dart';
import 'package:i_chaos/base-getX-framework/view-model/base_view_state_ctrl.dart';
import 'package:i_chaos/base-getX-framework/view/binding/manipulate_widget_binding_mixin.dart';

abstract class BaseControllerView<T extends BaseViewStateCtrl> extends GetView<T>
    with
        GetXReferenceMixin,
        GetXNavigationMixin,
        SmartPopupMixin,
        ToastMixin,
        SmartDialogMixin,
        ScreenMixin,
        ManipulateWidgetBinding,
        DelayedMixin,
        NavBarMixin {
  late BuildContext crrContext;

  BaseControllerView({Key? key}) : super(key: key) {
    initViewRes();
  }

  // 视图资源集中初始化，避免view创建时controller还未注入的场景
  void initViewRes() {}

  @override
  Widget build(BuildContext context) {
    crrContext = context;
    ViewWidgetBuilder builder = viewWidgetBuilder(context, controller);
    return GetBuilder<T>(
      builder: (T controller) {
        return builder.viewBuilder.call<T>(controller);
      },
      id: builder.builderId, // update['id']时指定GetBuilder刷新
      tag: builder.ctrlTag, // controller控制器注入时使用的tag
    );
  }

  // 构建页面/组件
  ViewWidgetBuilder viewWidgetBuilder(BuildContext context, T controller);
}

typedef ViewBuilder = Widget Function<T>(T ctrl);

class ViewWidgetBuilder {
  String? builderId;
  String? ctrlTag;
  ViewBuilder viewBuilder;

  ViewWidgetBuilder({required this.viewBuilder, this.builderId, this.ctrlTag});
}
