// ignore_for_file: unnecessary_overrides

import 'package:i_chaos/base-getX-framework/view-model/base_view_state_ctrl.dart';

abstract class WidgetViewCtrl extends BaseViewStateCtrl {

  @override
  bool stateUpdateViewPredicate(ViewState pre, ViewState next) {
    // 默认组件更新状态时不刷新页面状态
    return false;
  }

  // widget组件默认不需要初始化业务数据
  @override
  void onBizDataHandle() {}
}
