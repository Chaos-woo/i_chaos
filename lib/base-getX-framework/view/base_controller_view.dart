// ignore_for_file: must_be_immutable, prefer_function_declarations_over_variables

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:i_chaos/base-getX-framework/mixin/get_x_dependency_mixin.dart';
import 'package:i_chaos/base-getX-framework/mixin/get_x_navigation_mixin.dart';
import 'package:i_chaos/base-getX-framework/mixin/magic-ww-dialog/magic_ww_dialog_mixin.dart';
import 'package:i_chaos/base-getX-framework/mixin/screen_adapter_mixin.dart';
import 'package:i_chaos/base-getX-framework/mixin/toast_mixin.dart';
import 'package:i_chaos/base-getX-framework/view-model/base_view_state_ctrl.dart';
import 'package:i_chaos/base-getX-framework/view/binding/manipulate_widget_binding_mixin.dart';

abstract class BaseControllerView<T extends BaseViewStateCtrl> extends GetView<T>
    with GetXDependencyMixin, GetXNavigationMixin, ToastMixin, MagicWWDialogMixin, ScreenAdapterMixin, ManipulateWidgetBinding {
  late BuildContext crrContext;

  BaseControllerView({Key? key}) : super(key: key) {
    initViewRes();
  }

  // 视图资源初始化，避免view创建时controller还未注入的场景
  void initViewRes() {}

  @override
  Widget build(BuildContext context) {
    crrContext = crrContext;

    ViewWidgetBuilder builder = viewWidgetBuilder(context, controller);

    final widgetBuilderFunc = (T controller) {
      return builder.view;
    };

    return GetBuilder(
      builder: (T controller) => widgetBuilderFunc(controller),
      tag: builder.tag,
    );
  }

  // 构建页面/组件
  ViewWidgetBuilder viewWidgetBuilder(BuildContext context, T controller);
}

class ViewWidgetBuilder {
  final Widget view;
  String? tag;

  ViewWidgetBuilder({required this.view, this.tag});
}
