import 'package:badges/badges.dart';
import 'package:flustars/flustars.dart';
import 'package:flutter/material.dart';
import 'package:i_chaos/base_framework/ui/widget/provider_widget.dart';
import 'package:i_chaos/ichaos/todo/todo-common/enums/todo_state.dart';
import 'package:i_chaos/ichaos/todo/todo-domain/core/scenes/home/widgets/todolist/single_todo_list.dart';
import 'package:provider/provider.dart';
import 'package:tab_indicator_styler/tab_indicator_styler.dart';
import 'package:i_chaos/ichaos/public/extension/date_time_extension.dart';

import 'filtered_tab_bar_vm.dart';

class FilteredTabBar extends StatelessWidget {
  late FilteredTabBarVM _filteredTabBarVM;

  FilteredTabBar({Key? key, required FilteredTabBarVM filteredTabBarVM}) : super(key: key) {
//    _singleTodoListVM = singleTodoListVM;
//    _filteredTabBarVM = FilteredTabBarVM(selectDate: selectDate, singleTodoListVM: _singleTodoListVM);
    _filteredTabBarVM = filteredTabBarVM;
  }

  @override
  Widget build(BuildContext context) {
    return ProviderWidget<FilteredTabBarVM>(
      model: _filteredTabBarVM,
      builder: (ctx, vm, child) {
        return DefaultTabController(
            length: 2,
            initialIndex: _filteredTabBarVM.currentTabBarIndex,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Container(
                  height: 45,
                  width: MediaQuery.of(context).size.width,
                  decoration: const BoxDecoration(
                    color: Colors.white,
                  ),
                  child: TabBar(
                      indicatorColor: Colors.teal,
                      isScrollable: false,
                      tabs: [
                        Tab(
                          child: Selector<FilteredTabBarVM, DateTime>(
                            selector: (ctx, vm) => vm.currentDate,
                            shouldRebuild: (pre, next) => pre.isSameDay(next),
                            builder: (ctx, _, child) {
                              return vm.activeTodoCnt > 0 ? Badge(
                                toAnimate: false,
                                badgeContent: Text('${vm.activeTodoCnt}'),
                                position: BadgePosition(top: vm.activeTodoCnt >= 10 ? -1 : -4, end: -30),
                                padding: EdgeInsets.all(vm.activeTodoCnt >= 10 ? 3 : 6),
                                badgeColor: Colors.red,
                                child: Text(_filteredTabBarVM.tabWord(TodoState.active)),
                              ) : Text(_filteredTabBarVM.tabWord(TodoState.active));
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
                    height: MediaQuery.of(context).size.height - 242,
                    decoration: const BoxDecoration(
                      color: Colors.white,
                    ),
                    child: Selector<FilteredTabBarVM, DateTime>(
                      selector: (ctx, vm) => vm.currentDate,
                      shouldRebuild: (pre, next) => pre.yyyyMMdd != next.yyyyMMdd,
                      builder: (ctx, currentDate, child) {
                        return TabBarView(
                          children: getTodoListOrPlaceholder(vm.busy),
                        );
                      },
                    )),
              ],
            ));
      },
    );
  }

  List<Widget> getTodoListOrPlaceholder(bool isBusy) {
    if (isBusy) {
      return [const Text('no records'),const Text('no records'),];
    } else {
      return [
        SingleTodoList(isActive: true).transformToPageWidget(key: UniqueKey()),
        SingleTodoList(isActive: false).transformToPageWidget(key: UniqueKey()),
      ];
    }
  }
}