import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:i_chaos/base-getX-framework/view-model/list_view_state_controller.dart';
import 'package:i_chaos/base-getX-framework/view-model/refresh_list_view_state_controller.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

import 'base_page_controller_view.dart';

abstract class RefreshPageControllerView<T extends ListViewStateController> extends BasePageControllerView<T> {
  RefreshPageControllerView({Key? key}) : super(key: key);

  // 配合仅可以刷新的controller使用
  Widget pullDownControllerView({
    required RefreshListItemBuilder listBuilder,
    Color? backgroundColor,
    Widget? header,
  }) {
    return Material(
      color: backgroundColor ?? Colors.transparent,
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
    );
  }

  // 配合可以刷新和加载的controller使用
  Widget pullUpDownControllerView({required RefreshListItemBuilder listBuilder, Color? backgroundColor, Widget? header, Widget? footer}) {
    return Material(
      color: backgroundColor ?? Colors.transparent,
      child: SmartRefresher(
        key: controller.refreshSmarterKey,
        enablePullDown: true,
        enablePullUp: true,
        controller: controller.refreshController,
        onLoading: () {
          (controller as RefreshListViewStateController).loadingData();
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
    );
  }
}

typedef ItemBuilder = Widget Function(BuildContext context, int index);

class RefreshListItemBuilder {
  final ItemBuilder builder;
  final int itemCount;

  RefreshListItemBuilder({required this.builder, required this.itemCount});
}
