import 'package:i_chaos/base-getX-framework/get-x/ctrls/base-ctrls/base-ctrl/base_view_ctrl.dart';
import 'package:i_chaos/base-getX-framework/get-x/views/ctrl_mixin_export.dart';

abstract class SingleAllStateCtrl<T> extends BaseViewCtrl with DelayedMixin, ScreenMixin, GetXReferenceMixin {
  T? originalData;

  @override
  Future<void> initBizData() async {
    await fetchData();
  }

  Future<void> fetchData() async {
    try {
      if (await checkNetError()) {
        errorState();
      } else {
        // 刷新数据预处理
        _fetchPreProcess();
        T? fetchData = await onLoadData();
        // 刷新数据后置处理
        _fetchPostProcess(fetchData);
      }
    } catch (e, s) {
      errorState();
      onError(e, s);
    }
    updateBuilder();
  }

  void _fetchPostProcess(fetchData) {
    if (isEmptyData(fetchData)) {
      emptyState();
    } else {
      originalData = fetchData;
      onLoadCompleted(originalData);
      successState();
    }
  }

  void _fetchPreProcess() {
    loadingState();
    if (clearData()) {
      originalData = null;
    }
    updateBuilder();
  }

  // 判断数据是否空数据
  bool isEmptyData(T? fetchData) {
    return fetchData == null;
  }

  // 数据加载
  Future<T?> onLoadData();

  // 数据二次处理
  void onLoadCompleted(T? originalData) => () {};

  // 刷新异常处理
  void onError(e, s) => () {};

  @override
  void releaseStateRes() => () {};
}
