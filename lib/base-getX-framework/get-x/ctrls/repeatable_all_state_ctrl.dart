import 'package:flutter/material.dart';
import 'package:i_chaos/base-getX-framework/flutter3-pak-process/pull-to-refresh/src/smart_refresher.dart';
import 'package:i_chaos/base-getX-framework/get-x/ctrls/base-ctrls/base-ctrl/base_view_ctrl.dart';
import 'package:i_chaos/base-getX-framework/get-x/views/ctrl_mixin_export.dart';
import 'package:i_chaos/ichaos/todos-module/todos-domain/todos-common/events/todos_cud_event.dart';

abstract class RepeatableAllStateCtrl<T> extends BaseViewCtrl with DelayedMixin, ScreenMixin, GetXReferenceMixin {
  List<T> originalDataList = [];

  // 刷新控制
  late RefreshController refreshController;

  // 实现refreshController与SmartRefresher的唯一绑定
  late UniqueKey refreshSmarterKey;

  @override
  void initStateRes() {
    refreshCtrlAndSmarterKey();
  }

  void refreshCtrlAndSmarterKey() {
    refreshController = RefreshController(initialRefresh: false);
    refreshSmarterKey = UniqueKey();
  }

  @override
  @mustCallSuper
  void releaseStateRes() {
    refreshController.dispose();
  }

  @override
  Future<void> initBizData() async {
    await refreshData();
  }

  Future<void> refreshData() async {
    try {
      if (await checkNetError()) {
        errorState();
      } else {
        // 刷新数据预处理
        loadingState();
        List<T> fetchData = await onLoadData();
        // 刷新数据后置处理
        _fetchPostProcess(fetchData);
      }
    } catch (e, s) {
      errorState();
      refreshController.refreshFailed();
      onError(e, s);
    }
    updateBuilder();
  }

  void _fetchPostProcess(fetchData) {
    if (isEmptyData(fetchData)) {
      emptyState();
      originalDataList = [];
    } else {
      originalDataList = fetchData;
      onRefreshLoadCompleted(originalDataList);
      successState();
      refreshController.refreshCompleted();
    }
  }

  // 判断数据是否空数据
  bool isEmptyData(List<T> fetchData) {
    return fetchData.isEmpty;
  }

  // 请求数据刷新，有列表刷新移动动画
  void onProcessRequestRefreshData({Duration? duration}) {
    refreshController.requestRefresh(
      duration: duration ?? const Duration(milliseconds: 300),
    )?.then((_) => refreshData);
  }

  // 数据加载
  Future<List<T>> onLoadData({
    int? page,
    int? pageSize,
  });

  // 数据二次处理
  void onRefreshLoadCompleted(List<T> data);

  // 刷新异常处理
  void onError(e, s) => () {};
}
