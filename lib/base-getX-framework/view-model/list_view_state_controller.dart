import 'package:flutter/material.dart';
import 'package:i_chaos/base-getX-framework/view-model/base_view_state_controller.dart';
import 'package:i_chaos/base-getX-framework/view-model/handle/exception_handler.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

abstract class ListViewStateController<T> extends BaseViewStateController {
  // 页面数据
  List<T> dataList = [];

  // 刷新控制
  late RefreshController refreshController;
  // 实现refreshController与SmartRefresher的唯一绑定
  late GlobalKey refreshSmarterKey;

  @override
  void onStateBizHandle() {
    initData();
  }

  @override
  void onStateDispose() {
    releaseRes();
    refreshController.dispose();
  }

  @override
  void onStateInit() {
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
      List<T> fetchData = await Future.value(loadData());
      if (isEmptyData(fetchData)) {
        setEmpty();
      } else {
        dataList = fetchData;
        onRefreshLoadCompleted(dataList);
        setLoading(loading: false);
      }
      refreshController.refreshCompleted();
      updateListener();
    } catch (e, s) {
      refreshController.refreshFailed();
      ExceptionHandler.getInstance()!.handleException(this, e, s);
    }
  }

  // 判断数据是否为null
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
  List<T> loadData({
    int? page,
    int? pageSize,
  });

  // 数据二次处理
  void onRefreshLoadCompleted(List<T> data);

  // 资源释放
  void releaseRes() {}
}
