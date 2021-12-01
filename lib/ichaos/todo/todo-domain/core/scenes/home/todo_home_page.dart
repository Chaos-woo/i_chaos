import 'package:flustars/flustars.dart';
import 'package:flutter/material.dart';
import 'package:i_chaos/base_framework/ui/widget/provider_widget.dart';
import 'package:i_chaos/base_framework/widget_state/page_state.dart';
import 'package:i_chaos/ichaos/todo/todo-domain/core/scenes/home/widgets/calendar/calendar_bar.dart';
import 'package:i_chaos/ichaos/todo/todo-domain/core/scenes/home/widgets/filtered/filtered_tab_bar.dart';
import 'package:i_chaos/ichaos/todo/todo-domain/core/scenes/home/widgets/filtered/filtered_tab_bar_vm.dart';
import 'package:i_chaos/ichaos/todo/todo-domain/core/scenes/home/widgets/todolist/single_todo_list.dart';
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
      builder: (ctx, vm, child) {
        return Scaffold(
          appBar: AppBar(
              leading: const Icon(Icons.widgets),
              title: const Text(
                'ToDO',
                style: TextStyle(
                  fontSize: 18,
                ),
              ),
              titleSpacing: -5,
              toolbarHeight: 40,
          ),
          body: ProviderWidget<FilteredTabBarVM>(
              model: FilteredTabBarVM(singleTodoListVM: vm),
              builder: (ctx, filteredTabBarVM, child) {
                return Column(children: <Widget>[
                  CalendarBar(filteredTabBarVM: filteredTabBarVM).transformToPageWidget(),
                  FilteredTabBar(
                    filteredTabBarVM: filteredTabBarVM,
                  )
                ]);
              }),
        );
      },
    ));
  }
}
