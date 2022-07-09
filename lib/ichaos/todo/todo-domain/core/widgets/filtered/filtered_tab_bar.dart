import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:i_chaos/base-getX-framework/flutter3-pak-process/widget-chain/widget_chain.dart';
import 'package:i_chaos/base_framework/utils/image_helper.dart';
import 'package:i_chaos/base_framework/widget_state/widget_state.dart';
import 'package:i_chaos/generated/l10n.dart';
import 'package:i_chaos/ichaos/public/widgets/dot_loading.dart';
import 'package:i_chaos/ichaos/todo/todo-domain/common/enums/todo_state.dart';
import 'package:i_chaos/ichaos/todo/todo-domain/core/widgets/fba/home_fab_vm.dart';
import 'package:i_chaos/ichaos/todo/todo-domain/core/widgets/todolist/single_todo_list.dart';
import 'package:provider/provider.dart';
import 'package:tab_indicator_styler/tab_indicator_styler.dart';

import 'filtered_tab_bar_vm.dart';

class WidgetFilteredTabBar extends WidgetState {
  late FilteredTabBarVM _filteredTabBarVM;

  WidgetFilteredTabBar();

  @override
  Widget build(BuildContext context) {
    _filteredTabBarVM = Provider.of<FilteredTabBarVM>(context, listen: false);

    final Map<TodoState, String> _tabWords = {
      TodoState.active: S.of(context).todo_filtered_tab_bar_state_active,
      TodoState.completed: S.of(context).todo_filtered_tab_bar_state_completed,
      TodoState.all: S.of(context).todo_filtered_tab_bar_state_all
    };

    final List<Widget> tabs = [
      Tab(
        child: Selector<FilteredTabBarVM, DateTime>(
            selector: (ctx, vm) => vm.currentDate,
            shouldRebuild: (pre, next) => true,
            builder: (ctx, vm, child) {
              if (_filteredTabBarVM.activeTodoCnt > 0) {
                return _activeTodoBadgeBuilder(_tabWords);
              } else {
                return Text(_tabWords[TodoState.active]!);
              }
            }),
      ),
      Tab(
        text: _tabWords[TodoState.completed]!,
      ),
    ];

    return DefaultTabController(
        length: 2,
        initialIndex: _filteredTabBarVM.currentTabBarIndex,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            TabBar(
              indicatorColor: Colors.teal,
              isScrollable: false,
              tabs: tabs,
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
              },
            ).intoContainer(
              height: 45,
              width: screenWidth,
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(topLeft: Radius.circular(20), topRight: Radius.circular(15)),
              ),
            ),
            Selector<FilteredTabBarVM, bool>(
              selector: (ctx, vm) => vm.busy,
              shouldRebuild: (pre, next) => pre != next,
              builder: (ctx, currentDate, child) {
                return TabBarView(
                  children: getTodoListOrPlaceholder(context, _filteredTabBarVM.busy),
                );
              },
            ).intoContainer(
              width: screenWidth,
              // 减去appBar+日历条+过滤栏(含margin)+bottomBar(含margin)
              height: screenHeight - (40 + 68 + 10 + 130),
              color: Colors.white,
            ),
          ],
        ));
  }

  Badge _activeTodoBadgeBuilder(Map<TodoState, String> _tabWords) {
    return Badge(
      toAnimate: false,
      badgeContent: Text('${_filteredTabBarVM.activeTodoCnt}'),
      position: BadgePosition(top: _filteredTabBarVM.activeTodoCnt >= 10 ? -1 : -4, end: -30),
      padding: EdgeInsets.all(_filteredTabBarVM.activeTodoCnt >= 10 ? 3 : 6),
      badgeColor: Colors.red,
      child: Text(_tabWords[TodoState.active]!),
    );
  }

  List<Widget> getTodoListOrPlaceholder(BuildContext ctx, bool isBusy) {
    if (isBusy) {
      Widget loadingImageWidget = ImageHelper.placeHolderLocalSVGImg(imageName: 'image_loading', width: 100, height: 100)
          .addNeighbor(DotLoading(text: S.of(context).todo_filtered_tab_bar_loading_label))
          .intoColumn(mainAxisAlignment: MainAxisAlignment.start)
          .intoPadding(padding: const EdgeInsets.symmetric(vertical: 40));

      return [
        loadingImageWidget,
        loadingImageWidget,
      ];
    } else {
      final btnVM = Provider.of<TodoHomeFloatingActionBtnVM>(ctx, listen: false);

      return [
        generateWidget(() => WidgetSingleTodoList(
              isActive: true,
              todoListScrollCallback: _filteredTabBarVM.getTodoListNotifyCallback(btnVM, true),
            )),
        generateWidget(() => WidgetSingleTodoList(
              isActive: false,
              todoListScrollCallback: _filteredTabBarVM.getTodoListNotifyCallback(btnVM, false),
            ))
      ];
    }
  }
}
