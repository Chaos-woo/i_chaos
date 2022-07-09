import 'package:flutter/material.dart';
import 'package:i_chaos/base-getX-framework/flutter3-pak-process/pull-to-refresh/src/smart_refresher.dart';
import 'package:i_chaos/base-getX-framework/get-x/ctrls/base-ctrls/abstract-ctrl/abstract_view_ctrl.dart';
import 'package:i_chaos/base-getX-framework/get-x/ctrls/base-ctrls/base-ctrl/base_view_ctrl.dart';
import 'package:i_chaos/base-getX-framework/get-x/ctrls/repeatable_all_state_ctrl.dart';
import 'package:i_chaos/base-getX-framework/get-x/ctrls/repeatable_page_state_ctrl.dart';
import 'package:i_chaos/base-getX-framework/get-x/views/additional/refresh_item_builder.dart';

mixin RxCtrlViews {
  // 单次获取使用
  Widget rxCtrlViewBuilder<T extends BaseViewCtrl>(
    T ctrl, {
    required Widget builder,
    Widget? onLoading,
    Widget? onEmpty,
    Widget? onError,
  }) {
    if (ctrl.state == CtrlState.empty) {
      return onEmpty ?? Container();
    } else if (ctrl.state == CtrlState.loading) {
      return onLoading ?? Container();
    } else if (ctrl.state == CtrlState.error) {
      return onError ?? Container();
    } else {
      return builder;
    }
  }

  // 可下拉刷新ctrl使用
  Widget pullDownCtrlViewBuilder<T extends RepeatableAllStateCtrl>(
    T ctrl, {
    required RefreshListItemBuilder listBuilder,
    Widget? header,
    ListScrollListener? scrollListener,
  }) {
    ctrl.refreshCtrlAndSmarterKey();
    return NotificationListener<ScrollNotification>(
      onNotification: (notification) {
        if (notification.depth == 0) {
          switch (notification.runtimeType) {
            case ScrollUpdateNotification:
              scrollListener?.onListScrollUpdate?.call();
              break;
            case ScrollEndNotification:
              scrollListener?.onListScrollEnd?.call();
              break;
            case OverscrollNotification:
              scrollListener?.onListOverScroll?.call();
              break;
            default:
              break;
          }
        }
        return false;
      },
      child: SmartRefresher(
        key: ctrl.refreshSmarterKey,
        enablePullDown: true,
        enablePullUp: false,
        controller: ctrl.refreshController,
        onRefresh: ctrl.refreshData,
        header: header,
        child: ListView.builder(
          physics: const AlwaysScrollableScrollPhysics(),
          shrinkWrap: true,
          itemBuilder: (context, index) => listBuilder.builder(context, index),
          itemCount: listBuilder.itemCount,
        ),
      ),
    );
  }

  // 可下拉刷新和上拉加载ctrl使用
  Widget pullUpDownCtrlViewBuilder<T extends RepeatablePageStateCtrl>(
    T ctrl, {
    required RefreshListItemBuilder listBuilder,
    Widget? header,
    Widget? footer,
    ListScrollListener? scrollListener,
  }) {
    ctrl.refreshCtrlAndSmarterKey();
    return NotificationListener<ScrollNotification>(
      onNotification: (notification) {
        if (notification.depth == 0) {
          switch (notification.runtimeType) {
            case ScrollUpdateNotification:
              scrollListener?.onListScrollUpdate?.call();
              break;
            case ScrollEndNotification:
              scrollListener?.onListScrollEnd?.call();
              break;
            case OverscrollNotification:
              scrollListener?.onListOverScroll?.call();
              break;
            default:
              break;
          }
        }
        return false;
      },
      child: SmartRefresher(
        key: ctrl.refreshSmarterKey,
        enablePullDown: true,
        enablePullUp: true,
        controller: ctrl.refreshController,
        onLoading: ctrl.pagingLoadingData,
        onRefresh: ctrl.refreshData,
        header: header,
        footer: footer,
        child: ListView.builder(
          physics: const AlwaysScrollableScrollPhysics(),
          shrinkWrap: true,
          itemBuilder: (context, index) => listBuilder.builder(context, index),
          itemCount: listBuilder.itemCount,
        ),
      ),
    );
  }
}
