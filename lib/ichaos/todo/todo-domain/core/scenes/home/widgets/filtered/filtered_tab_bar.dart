import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:i_chaos/base_framework/ui/widget/provider_widget.dart';
import 'package:i_chaos/ichaos/public/units/uuid.dart';
import 'package:i_chaos/ichaos/todo/todo-common/enums/todo_state.dart';
import 'package:i_chaos/ichaos/todo/todo-domain/core/scenes/home/widgets/todolist/single_todo_list.dart';
import 'package:i_chaos/ichaos/todo/todo-domain/core/scenes/home/widgets/todolist/single_todo_list_vm.dart';
import 'package:provider/provider.dart';
import 'package:tab_indicator_styler/tab_indicator_styler.dart';
import 'package:i_chaos/ichaos/public/extension/date_time_extension.dart';

import 'filtered_tab_bar_vm.dart';

class FilteredTabBar extends StatelessWidget {
  late SingleTodoListVM _singleTodoListVM;
  late FilteredTabBarVM _filteredTabBarVM;

  FilteredTabBar({Key? key, required SingleTodoListVM singleTodoListVM, DateTime? selectDate}) : super(key: key) {
    _singleTodoListVM = singleTodoListVM;
    _filteredTabBarVM = FilteredTabBarVM(selectDate: selectDate, singleTodoListVM: _singleTodoListVM);
  }

  @override
  Widget build(BuildContext context) {
    return ProviderWidget<FilteredTabBarVM>(
      model: _filteredTabBarVM,
      builder: (ctx, vm, child) {
        return Scaffold(
          body: DefaultTabController(
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
                      borderRadius: BorderRadius.only(topLeft: Radius.circular(20), topRight: Radius.circular(20)),
                    ),
                    child: TabBar(
                        indicatorColor: Colors.teal,
                        isScrollable: false,
                        tabs: [
                          Tab(
                            child: Selector<FilteredTabBarVM, int>(
                              selector: (ctx, FilteredTabBarVM) => _filteredTabBarVM.activeTodoCnt,
                              shouldRebuild: (pre, next) => pre != next,
                              builder: (ctx, activeTodoCnt, child) {
                                return Badge(
                                  toAnimate: false,
                                  badgeContent: activeTodoCnt > 0 ? Text('$activeTodoCnt') : null,
                                  position: BadgePosition(top: activeTodoCnt > 10 ? -1 : -4, end: -30),
                                  padding: EdgeInsets.all(activeTodoCnt > 10 ? 3 : 6),
                                  badgeColor: Colors.red,
                                  child: Text(_filteredTabBarVM.tabWord(TodoState.active)),
                                );
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
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height - 242,
                      decoration: const BoxDecoration(
                        color: Colors.white,
                      ),
                      child: Selector<FilteredTabBarVM, DateTime>(
                        selector: (ctx, FilteredTabBarVM) => _filteredTabBarVM.currentDate,
                        shouldRebuild: (pre, next) => pre.yyyyMMdd != next.yyyyMMdd,
                        builder: (ctx, currentDate, child) {
                          return TabBarView(
                            children: <Widget>[
                              SingleTodoList(isActive: true, singleTodoListVM: _singleTodoListVM).transformToPageWidget(key: UniqueKey()),
                              SingleTodoList(isActive: false, singleTodoListVM: _singleTodoListVM).transformToPageWidget(key: UniqueKey()),
                            ],
                          );
                        },
                      )),
                ],
              )),
        );
      },
    );
  }
}