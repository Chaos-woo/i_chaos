
import 'package:i_chaos/base-getX-framework/view-model/base_view_state_ctrl.dart';
import 'package:i_chaos/base-getX-framework/view-model/handle/exception_handler.dart';

abstract class SingleViewStateCtrl<T> extends BaseViewStateCtrl {
  T? data;

  @override
  void onStateBizHandle() async {
    await initData();
  }

  @override
  void onStateDispose() {
    releaseRes();
  }

  @override
  void onStateInit() {
    initRes();
  }

  // 首次数据初始化
  Future<void> initData() async {
    await fetchData();
  }

  Future<void> fetchData() async {
    try {
      setLoading();
      T? fetchData = await loadData();
      if (isEmptyData(fetchData)) {
        setEmpty();
      } else {
        data = fetchData;
        onLoadCompleted(data);
        setLoading(loading: false);
      }
      updateListener();
    } catch (e, s) {
      ExceptionHandler.getInstance()!.handleException(this, e, s);
    }
  }

  // 判断数据是否为null
  bool isEmptyData(T? fetchData) {
    return fetchData == null;
  }

  @override
  bool stateUpdateViewPredicate(ViewState pre, ViewState next) {
    return _checkNeedUpdateView(next);
  }

  bool _checkNeedUpdateView(ViewState value) {
    return value == ViewState.idle ||
        value == ViewState.loading ||
        value == ViewState.empty ||
        value == ViewState.error ||
        value == ViewState.noNet ||
        value == ViewState.readyInit;
  }

  // 资源初始化
  void initRes() {}
  // 数据加载
  Future<T?> loadData();
  // 数据二次处理
  void onLoadCompleted(T? data);
  // 资源释放
  void releaseRes() {}
}