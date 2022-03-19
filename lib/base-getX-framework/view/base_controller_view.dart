
// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:i_chaos/base-getX-framework/mixin/get_x_dependency_mixin.dart';
import 'package:i_chaos/base-getX-framework/mixin/get_x_navigation_mixin.dart';
import 'package:i_chaos/base-getX-framework/mixin/screen_adapter_mixin.dart';
import 'package:i_chaos/base-getX-framework/mixin/toast_mixin.dart';
import 'package:i_chaos/base-getX-framework/view-model/base_view_state_controller.dart';
import 'package:i_chaos/base-getX-framework/view/binding/manipulate_widget_binding_mixin.dart';

abstract class BaseControllerView<T extends BaseViewStateController> extends GetView<T>
    with GetXDependencyMixin, GetXNavigationMixin, ToastMixin, ScreenAdapterMixin, ManipulateWidgetBinding {

  late BuildContext crrContext;

  BaseControllerView({Key? key}) : super(key: key) {
    initViewRes();
  }

  // 视图资源初始化，避免view创建时controller还未注入的场景
  void initViewRes(){}

  @override
  Widget build(BuildContext context) {
    crrContext = crrContext;

    return GetBuilder(builder: (T controller) => viewBuilder(context, controller));
  }

  // 构建页面/组件
  Widget viewBuilder(BuildContext context, T controller);
}