
import 'package:i_chaos/base-getX-framework/utils/exception/exception_listener.dart';
import 'package:i_chaos/base-getX-framework/utils/exception/exception_pitcher.dart';
import 'package:i_chaos/base-getX-framework/view-model/base_view_state_ctrl.dart';

/// 虽然 * ViewModel 已经对 [loadData()]的业务异常进行捕捉，但由于其位置的特殊性，
/// 使页面内其他的接口异常无法捕捉到，为此提供下面的功能。
/// 页面或者widget需要对api所触发的业务异常进行监听时
/// 可以为ViewModel混入此类
mixin ExceptionBinding on BaseViewStateCtrl implements ExceptionListener {
  ExceptionListener? _listener;

  ///混入此类后，实现[ExceptionListener]并调用此方法进行注册
  bindToExceptionHandler(ExceptionListener? listener) {
    if (listener == null) return;
    _listener = listener;
    addExceptionListener();
  }

  ///增加(业务)异常监听
  addExceptionListener() {
    ExceptionPitcher().addListener(_listener);
  }

  ///移除(业务)异常监听
  /// * 默认会在dispose中自动移除
  removeExceptionListener() {
    if (_listener != null) ExceptionPitcher().removeListener(_listener);
  }

  ///理论上，不需要你手动移除[ExceptionListener]，此处会自动处理
  @override
  void dispose() {
    removeExceptionListener();
    super.dispose();
  }
}
