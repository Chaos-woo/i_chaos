import 'package:flustars/flustars.dart';
import 'package:flutter/material.dart';
import 'package:i_chaos/base_framework/ui/widget/provider_widget.dart';
import 'package:i_chaos/base_framework/widget_state/page_state.dart';
import 'package:i_chaos/ichaos/public/ali_icons.dart';
import 'package:i_chaos/ichaos/todo/todo-domain/core/scenes/home/widgets/calendar/calendar_bar.dart';
import 'package:i_chaos/ichaos/todo/todo-domain/core/scenes/home/widgets/calendar/calendar_bar_vm.dart';
import 'drawer_page.dart';
import 'package:i_chaos/ichaos/todo/todo-domain/core/scenes/home/widgets/fba/home_fab.dart';
import 'package:i_chaos/ichaos/todo/todo-domain/core/scenes/home/widgets/fba/home_fab_vm.dart';
import 'package:i_chaos/ichaos/todo/todo-domain/core/scenes/home/widgets/filtered/filtered_tab_bar.dart';
import 'package:i_chaos/ichaos/todo/todo-domain/core/scenes/home/widgets/filtered/filtered_tab_bar_vm.dart';
import 'package:provider/provider.dart';

import 'package:i_chaos/ichaos/todo/todo-domain/core/scenes/home/widgets/calendar_image.dart';
import 'package:i_chaos/ichaos/todo/todo-domain/core/scenes/home/widgets/todolist/single_todo_list_vm.dart';

class PageTodoHome extends PageState with AutomaticKeepAliveClientMixin {
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
    final calendarBarVM = Provider.of<CalendarBarVM>(ctx);

    List<Widget> calendarBarWidgets = _getCalendarImage(calendarBarVM);
    calendarBarWidgets.add(WidgetCalendarBar().transformToPageWidget());

    return Scaffold(
      appBar: _getTodoAppBar(filteredTabBarVM),
      body: Stack(
        children: <Widget>[
          Positioned(
            child: Container(
              color: const Color(0xFFF5F5F5)
            ),
          ),
          Positioned(
            child: Column(children: <Widget>[
              Container(
                width: ScreenUtil.getInstance().screenWidth,
                child: Row(
                  children: calendarBarWidgets,
                ),
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(bottomLeft: Radius.circular(15)),
                  boxShadow: [
                    BoxShadow(
                        color: Colors.grey,
                        offset: Offset(0.0, 2.0), //阴影y轴偏移量
                        blurRadius: 1, //阴影模糊程度
                        spreadRadius: 0 //阴影扩散程度
                    )
                  ],
                ),
              ),
              Container(
                margin: const EdgeInsets.only(top: 10),
                width: ScreenUtil.getInstance().screenWidth,
                child: generateWidget(() => WidgetFilteredTabBar()),
              ),
            ]),
          ),
        ],
      ),
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
          push(PageTodoDrawer());
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
      elevation: 0,
      actions: <Widget>[
        IconButton(
          icon: const Icon(AliIcons.ALI_ICON_TASKLIST_FILL),
          onPressed: () {
            // handle the press
          },
        ),
        IconButton(
          icon: const Icon(AliIcons.ALI_ICON_MORE),
          onPressed: () {
            // handle the press
          },
        ),
      ],
    );
  }

  // 获取年月图
  List<Widget> _getCalendarImage(CalendarBarVM calendarBarVM) {
    return <Widget>[
      CalendarImage(calendarBarVM).transformToPageWidget(),
      Container(
        width: 1,
        height: 68,
        color: Colors.teal,
        child: const VerticalDivider(
          width: 1,
          thickness: 68 * 0.85,
          indent: 10,
          endIndent: 10,
          color: Color(0xFFBDBDBD),
        ),
      ),
    ];
  }
}
