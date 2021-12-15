import 'package:flustars/flustars.dart';
import 'package:flutter/material.dart';
import 'package:i_chaos/base_framework/ui/widget/provider_widget.dart';
import 'package:i_chaos/base_framework/widget_state/page_state.dart';
import 'package:i_chaos/ichaos/todo/todo-domain/core/scenes/home/widgets/calendar/calendar_bar.dart';
import 'package:i_chaos/ichaos/todo/todo-domain/core/scenes/home/widgets/calendar/calendar_bar_vm.dart';
import 'package:i_chaos/ichaos/todo/todo-domain/core/scenes/home/widgets/fba/home_fab.dart';
import 'package:i_chaos/ichaos/todo/todo-domain/core/scenes/home/widgets/fba/home_fab_vm.dart';
import 'package:i_chaos/ichaos/todo/todo-domain/core/scenes/home/widgets/filtered/filtered_tab_bar.dart';
import 'package:i_chaos/ichaos/todo/todo-domain/core/scenes/home/widgets/filtered/filtered_tab_bar_vm.dart';
import 'package:provider/provider.dart';

import 'widgets/todolist/single_todo_list_vm.dart';

class TodoHomePage extends PageState with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;

  late SingleTodoListVM _singleTodoListVM;

  @override
  void initState() {
    super.initState();
    _singleTodoListVM = SingleTodoListVM();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return switchStatusBar2Dark(
        child: ProviderWidget<SingleTodoListVM>(
      model: _singleTodoListVM,
      onModelReady: (model) {
        model.initData();
      },
      builder: (ctx, singleTodoListVM, child) {
        return ProviderWidget<FilteredTabBarVM>(
            model: FilteredTabBarVM(singleTodoListVM: singleTodoListVM),
            builder: (ctx, filteredTabBarVM, child) {
              return ProviderWidget<CalendarBarVM>(
                model: CalendarBarVM(filteredTabBarVM: filteredTabBarVM),
                builder: (ctx, calendarBarVM, _) {
                  return ProviderWidget<TodoHomeFloatingActionBtnVM>(
                    model: TodoHomeFloatingActionBtnVM(filteredTabBarVM: filteredTabBarVM, calendarBarVM: calendarBarVM),
                    builder: (ctx, actionBtnVM, _) {
                      return _getMainScaffold(ctx);
                    },
                  );
                },
              );
            });
      },
    ));
  }

  // 获取主首页结构组件
  Widget _getMainScaffold(BuildContext ctx) {
    final filteredTabBarVM = Provider.of<FilteredTabBarVM>(ctx);
    final actionBtnVM = Provider.of<TodoHomeFloatingActionBtnVM>(ctx);

    List<Widget> calendarBarWidgets = _getCalendarImage();
    calendarBarWidgets.add(CalendarBar().transformToPageWidget());

    return Scaffold(
      appBar: _getTodoAppBar(filteredTabBarVM),
      body: Column(children: <Widget>[
        SizedBox(
          width: ScreenUtil.getInstance().screenWidth,
          child: Row(
            children: calendarBarWidgets,
          ),
        ),
        FilteredTabBar(),
      ]),
      floatingActionButton: TodoHomeFloatingActionBtn(actionBtnVM: actionBtnVM).transformToPageWidget(),
    );
  }

  // 获取appBar
  PreferredSizeWidget _getTodoAppBar(FilteredTabBarVM filteredTabBarVM) {
    DateTime currDate = filteredTabBarVM.currentDate;
    DateTime now = DateTime.now();
    return AppBar(
      leading: InkWell(
        onTap: () {
//          push(AbstractTransparentPage());
        },
        child: const Icon(Icons.widgets),
      ),
      title: Row(
        children: <Widget>[
          const Text(
            'ToDO',
            style: TextStyle(
              fontSize: 18,
            ),
          ),
        ],
      ),
      titleSpacing: -5,
      toolbarHeight: 40,
      actions: <Widget>[
        IconButton(
          icon: const Icon(Icons.shopping_cart),
          tooltip: 'Open shopping cart',
          onPressed: () {
            // handle the press
          },
        ),
        IconButton(
          icon: const Icon(Icons.shopping_cart),
          tooltip: 'Open shopping cart',
          onPressed: () {
            // handle the press
          },
        ),
        IconButton(
          icon: const Icon(Icons.shopping_cart),
          tooltip: 'Open shopping cart',
          onPressed: () {
            // handle the press
          },
        ),
      ],
    );
  }

  // 获取年月图
  List<Widget> _getCalendarImage() {
    double calendarImageChunkWidth = ScreenUtil.getInstance().screenWidth / 10 * 1.5 - 1;
    double calendarImageWidth = calendarImageChunkWidth - 12;
    double calendarLTRBRadius = 3;

    return <Widget>[
      InkWell(
        onTap: () {},
        child: Container(
          width: calendarImageChunkWidth,
          padding: const EdgeInsets.fromLTRB(6, 10, 6, 10),
          height: 68,
          color: Colors.teal,
          child: Container(
            width: calendarImageWidth,
            height: calendarImageWidth,
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(6)),
              boxShadow: [
                BoxShadow(
                    color: Colors.black12,
                    offset: Offset(2, 2),
                    blurRadius: 1,
                    spreadRadius: 0
                )
              ],
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(
                  width: calendarImageWidth,
                  height: calendarImageWidth / 3,
                  decoration: BoxDecoration(
                    color: const Color(0xFFFF5650),
                    borderRadius: BorderRadius.only(topLeft: Radius.circular(calendarLTRBRadius), topRight: Radius.circular(calendarLTRBRadius)),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Selector<FilteredTabBarVM, int>(
                        selector: (ctx, vm) => vm.currentDate.year,
                        shouldRebuild: (pre, next) => pre != next,
                        builder: (ctx, currentYear, child) {
                          return Text('$currentYear',
                            style: const TextStyle(
                                color: Colors.white,
                                fontFamily: 'Lexend Deca',
                                fontWeight: FontWeight.w500,
                                fontSize: 12
                            ),);
                        },
                      )
                    ],
                  ),
                ),
                Container(
                  width: calendarImageWidth,
                  height: calendarImageWidth / 3 * 2,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(bottomLeft: Radius.circular(calendarLTRBRadius), bottomRight: Radius.circular(calendarLTRBRadius)),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Selector<FilteredTabBarVM, int>(
                        selector: (ctx, vm) => vm.currentDate.month,
                        shouldRebuild: (pre, next) => pre != next,
                        builder: (ctx, currentMonth, child) {
                          return Text('$currentMonth',
                            style: const TextStyle(
                                color: Colors.black87,
                                fontFamily: 'Lexend Deca',
                                fontWeight: FontWeight.w900,
                                fontSize: 24
                            ),);
                        },
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
      Container(
        width: 1,
        height: 68,
        color: Colors.teal,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              width: 1,
              height: 68 * 0.85,
              decoration: const BoxDecoration(
                color: Color(0xFFBDBDBD),
              ),
            )
          ],
        ),
      ),
    ];
  }
}
