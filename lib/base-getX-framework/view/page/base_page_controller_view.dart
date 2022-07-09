import 'package:flutter/material.dart';
import 'package:i_chaos/base-getX-framework/mixin/nav_bar_mixin.dart';
import 'package:i_chaos/base-getX-framework/view-model/base_view_state_ctrl.dart';
import 'package:i_chaos/base-getX-framework/view/base_controller_view.dart';

abstract class BasePageControllerView<T extends BaseViewStateCtrl> extends BaseControllerView<T> with NavBarMixin {
  BasePageControllerView({Key? key}) : super(key: key);

  // 页面刷新
  void updatePage({List<Object>? ids}) {
    controller.update(ids);
  }
}
