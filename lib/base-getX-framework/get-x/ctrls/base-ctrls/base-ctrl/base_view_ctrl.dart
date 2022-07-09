import 'package:connectivity/connectivity.dart';
import 'package:i_chaos/base-getX-framework/get-x/ctrls/base-ctrls/abstract-ctrl/abstract_view_ctrl.dart';
import 'package:i_chaos/base-getX-framework/get-x/ctrls/base-ctrls/base-ctrl/view_ctrl_life_cycle.dart';

abstract class BaseViewCtrl extends AbstractViewCtrl implements ViewCtrlLifeCycle {
  CtrlState state = CtrlState.success;

  void loadingState() => state = CtrlState.loading;

  void successState() => state = CtrlState.success;

  void errorState() => state = CtrlState.error;

  void emptyState() => state = CtrlState.empty;

  bool get isLoadingState => state == CtrlState.loading;

  bool get isSuccessState => state == CtrlState.success;

  bool get isErrorState => state == CtrlState.error;

  bool get isEmptyState => state == CtrlState.empty;

  Future<bool> checkNetError() async {
    return (await returnNetState()) == ConnectivityResult.none;
  }

  Future<ConnectivityResult> returnNetState() async {
    return await (Connectivity().checkConnectivity());
  }

  // 更新指定buildId的GetBuilder
  void updateBuilders(List<String> builderIds) {
    update(builderIds);
  }

  // 更新GetBuilder
  void updateBuilder() {
    update();
  }

  // 刷新数据时是否清除原有数据
  bool clearData() => false;

  @override
  void onStateCtrlInit() {
    initStateRes();
  }

  @override
  void onStateCtrlPreDispose() {
    releaseStateRes();
  }

  @override
  void onBizDataHandle() async {
    await initBizData();
  }

  // 资源初始化
  void initStateRes();

  // 资源释放
  void releaseStateRes();

  // 初始化业务数据
  Future<void> initBizData();
}
