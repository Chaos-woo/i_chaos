// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:i_chaos/base-getX-framework/flutter3-pak-process/pull-to-refresh/pull_to_refresh.dart';
import 'package:i_chaos/base-getX-framework/view-model/list_view_state_ctrl.dart';
import 'package:i_chaos/base-getX-framework/view-model/refresh_list_view_state_ctrl.dart';

import 'base_page_controller_view.dart';

abstract class RefreshPageControllerView<T extends ListViewStateCtrl> extends BasePageControllerView<T> {
  RefreshPageControllerView({Key? key}) : super(key: key);

  // 配合仅可以刷新的controller使用
  Widget pullDownControllerView({
    required RefreshListItemBuilder listBuilder,
    Color? backgroundColor,
    Widget? header,
    ListScrollListener? scrollListener,
  }) {
    controller.refreshCtrlAndSmarterKey();
    return Material(
        color: backgroundColor,
        child: NotificationListener<ScrollNotification>(
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
            key: controller.refreshSmarterKey,
            enablePullDown: true,
            enablePullUp: false,
            controller: controller.refreshController,
            onRefresh: controller.refreshData,
            header: header ?? const ClassicHeader(),
            child: ListView.builder(
              physics: const AlwaysScrollableScrollPhysics(),
              shrinkWrap: true,
              itemBuilder: (context, index) => listBuilder.builder(context, index),
              itemCount: listBuilder.itemCount,
            ),
          ),
        ));
  }

  // 配合可以刷新和加载的controller使用
  Widget pullUpDownControllerView({
    required RefreshListItemBuilder listBuilder,
    Color? backgroundColor,
    Widget? header,
    Widget? footer,
    ListScrollListener? scrollListener,
  }) {
    controller.refreshCtrlAndSmarterKey();
    return Material(
      color: backgroundColor,
      child: NotificationListener<ScrollNotification>(
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
          key: controller.refreshSmarterKey,
          enablePullDown: true,
          enablePullUp: true,
          controller: controller.refreshController,
          onLoading: () {
            (controller as RefreshListViewStateCtrl).loadingData();
          },
          onRefresh: controller.refreshData,
          header: header ?? const ClassicHeader(),
          footer: footer ?? const ClassicFooter(loadStyle: LoadStyle.ShowAlways),
          child: ListView.builder(
            physics: const AlwaysScrollableScrollPhysics(),
            shrinkWrap: true,
            itemBuilder: (context, index) => listBuilder.builder(context, index),
            itemCount: listBuilder.itemCount,
          ),
        ),
      ),
    );
  }
}

typedef ItemBuilder = Widget Function(BuildContext context, int index);

class RefreshListItemBuilder {
  final ItemBuilder builder;
  final int itemCount;

  RefreshListItemBuilder({required this.builder, required this.itemCount});
}

typedef OnListScrollUpdate = void Function();
typedef OnListScrollEnd = void Function();
typedef OnListOverScroll = void Function();

class ListScrollListener {
  OnListScrollUpdate? onListScrollUpdate;
  OnListScrollEnd? onListScrollEnd;
  OnListOverScroll? onListOverScroll;

  ListScrollListener({this.onListScrollUpdate, this.onListScrollEnd, this.onListOverScroll});
}
