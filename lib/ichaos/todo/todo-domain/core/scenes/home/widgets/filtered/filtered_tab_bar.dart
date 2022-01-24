import 'dart:async';

import 'package:badges/badges.dart';
import 'package:flustars/flustars.dart';
import 'package:flutter/material.dart';
import 'package:i_chaos/base_framework/utils/image_helper.dart';
import 'package:i_chaos/base_framework/widget_state/page_state.dart';
import 'package:i_chaos/base_framework/widget_state/widget_state.dart';
import 'package:i_chaos/ichaos/public/extension/date_time_extension.dart';
import 'package:i_chaos/ichaos/public/widgets/dot_loading.dart';
import 'package:i_chaos/ichaos/todo/todo-common/enums/todo_state.dart';
import 'package:i_chaos/ichaos/todo/todo-domain/core/scenes/home/widgets/fba/home_fab_vm.dart';
import 'package:i_chaos/ichaos/todo/todo-domain/core/scenes/home/widgets/todolist/single_todo_list.dart';
import 'package:i_chaos/ichaos/todo/todo-domain/core/scenes/home/widgets/todolist/single_todo_list_vm.dart';
import 'package:provider/provider.dart';
import 'package:tab_indicator_styler/tab_indicator_styler.dart';

import 'filtered_tab_bar_vm.dart';

class WidgetFilteredTabBar extends WidgetState {
  late FilteredTabBarVM _filteredTabBarVM;

  WidgetFilteredTabBar();

  @override
  Widget build(BuildContext context) {
    _filteredTabBarVM = Provider.of<FilteredTabBarVM>(context, listen: false);

    return DefaultTabController(
        length: 2,
        initialIndex: _filteredTabBarVM.currentTabBarIndex,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Container(
              height: 45,
              width: ScreenUtil.getInstance().screenWidth,
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(topLeft: Radius.circular(20), topRight: Radius.circular(15)),
              ),
              child: TabBar(
                  indicatorColor: Colors.teal,
                  isScrollable: false,
                  tabs: [
                    Tab(
                      child: Selector<FilteredTabBarVM, DateTime>(
                        selector: (ctx, vm) => vm.currentDate,
                        shouldRebuild: (pre, next) => true,
                        builder: (ctx, vm, child) {
                          return _filteredTabBarVM.activeTodoCnt > 0
                              ? Badge(
                                  toAnimate: false,
                                  badgeContent: Text('${_filteredTabBarVM.activeTodoCnt}'),
                                  position: BadgePosition(top: _filteredTabBarVM.activeTodoCnt >= 10 ? -1 : -4, end: -30),
                                  padding: EdgeInsets.all(_filteredTabBarVM.activeTodoCnt >= 10 ? 3 : 6),
                                  badgeColor: Colors.red,
                                  child: Text(_filteredTabBarVM.tabWord(TodoState.active)),
                                )
                              : Text(_filteredTabBarVM.tabWord(TodoState.active));
                        },
                      ),
                    ),
                    Tab(
                      text: _filteredTabBarVM.tabWord(TodoState.completed),
                    ),
                  ],
                  labelColor: Colors.black,
                  indicator: MaterialIndicator(
                    height: 3,
                    topLeftRadius: 8,
                    topRightRadius: 8,
                    horizontalPadding: 80,
                    tabPosition: TabPosition.bottom,
                  ),
                  onTap: (index) async {
                    _filteredTabBarVM.tabIndexSwitch(index);
                  }),
            ),
            Container(
                width: ScreenUtil.getScreenW(context),
                // 减去appBar+日历条+过滤栏(含margin)+bottomBar(含margin)
                height: ScreenUtil.getInstance().screenHeight - (40 + 68 + 10 + 130),
                color: Colors.white,
                child: Selector<FilteredTabBarVM, DateTime>(
                  selector: (ctx, vm) => vm.currentDate,
                  shouldRebuild: (pre, next) => true,
                  builder: (ctx, currentDate, child) {
                    return TabBarView(
                      children: getTodoListOrPlaceholder(context, _filteredTabBarVM.busy),
                    );
                  },
                )),
          ],
        ));
  }

  List<Widget> getTodoListOrPlaceholder(BuildContext ctx, bool isBusy) {
    if (isBusy) {
      Widget loadingImageWidget = Padding(
        padding: const EdgeInsets.symmetric(vertical: 40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            ImageHelper.placeHolderLocalSVGImg(imageName: 'image_loading', width: 100, height: 100),
            DotLoading(text: '搜索中',)
          ],
        ),
      );

      return [
        loadingImageWidget,
        loadingImageWidget,
      ];
    } else {
      final btnVM = Provider.of<TodoHomeFloatingActionBtnVM>(ctx, listen: false);

      return [
        generateWidget(() => WidgetSingleTodoList(isActive: true, todoListScrollCallback: _filteredTabBarVM.getTodoListNotifyCallback(btnVM, true))),
        generateWidget(() => WidgetSingleTodoList(isActive: false, todoListScrollCallback: _filteredTabBarVM.getTodoListNotifyCallback(btnVM, false)))
      ];
    }
  }
}
