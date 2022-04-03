import 'package:flutter/material.dart';
import 'package:i_chaos/base-getX-framework/view-model/base_view_state_ctrl.dart';
import 'package:i_chaos/base-getX-framework/view-model/handle/exception_handler.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

abstract class ListViewStateCtrl<T> extends BaseViewStateCtrl {
  // 页面数据
  List<T> dataList = [];

  // 刷新控制
  late RefreshController refreshController;
  // 实现refreshController与SmartRefresher的唯一绑定
  late GlobalKey refreshSmarterKey;

  @override
  void onBizDataHandle() {
    initData();
  }

  @override
  void onStateCtrlDispose() {
    releaseRes();
    refreshController.dispose();
  }

  @override
  void onStateCtrlInit() {
    refreshController = RefreshController(initialRefresh: false);
    refreshSmarterKey = GlobalKey();
    initRes();
  }

  // 首次数据初始化
  void initData() {
    refreshData();
  }

  void refreshData() async {
    try {
      setLoading();
      List<T> fetchData = await loadData();
      if (isEmptyData(fetchData)) {
        setEmpty();
      } else {
        dataList = fetchData;
        onRefreshLoadCompleted(dataList);
      }
      setLoading(loading: false);
      refreshController.refreshCompleted();

      List<String>? refreshBuilderIds = builderIds();
      zeroDelay(() {
        if (refreshBuilderIds != null) {
          updateListeners(refreshBuilderIds);
        } else {
          updateListener();
        }
      });
    } catch (e, s) {
      refreshController.refreshFailed();
      ExceptionHandler.getInstance()!.handleException(this, e, s);
    }
  }

  // 判断数据是否为null，子类可以覆盖实现
  bool isEmptyData(List<T> fetchData) {
    return fetchData.isEmpty;
  }

  @override
  bool stateUpdateViewPredicate(ViewState pre, ViewState next) {
    return false;
  }

  // 资源初始化
  void initRes() {}

  // 数据加载
  Future<List<T>> loadData({
    int? page,
    int? pageSize,
  });

  // 数据二次处理
  void onRefreshLoadCompleted(List<T> data);

  // 资源释放
  void releaseRes() {}

  // GetBuilder局部刷新使用的id，为null或空列表时全部刷新
  List<String>? builderIds() => null;
}
