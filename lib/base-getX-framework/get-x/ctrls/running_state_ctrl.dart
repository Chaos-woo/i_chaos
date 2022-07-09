import 'package:i_chaos/base-getX-framework/get-x/ctrls/base-ctrls/base-ctrl/base_view_ctrl.dart';
import 'package:i_chaos/base-getX-framework/get-x/views/ctrl_mixin_export.dart';

abstract class RunningStateCtrl extends BaseViewCtrl with DelayedMixin, ScreenMixin, GetXReferenceMixin {
  @override
  void initStateRes() => () {};

  @override
  Future<void> initBizData() => Future.value();

  @override
  void releaseStateRes() => () {};
}
