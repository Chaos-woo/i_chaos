// ignore_for_file: implementation_imports

import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:i_chaos/base-getX-framework/view-model/widget_view_ctrl.dart';
import 'package:i_chaos/base-getX-framework/view/base_controller_view.dart';

abstract class WidgetControllerView<T extends WidgetViewCtrl> extends BaseControllerView<T> {
  WidgetControllerView({Key? key}) : super(key: key);

  // 组件刷新
  void updateWidget({List<Object>? ids}) {
    controller.update(ids);
  }
}
