
import 'package:flutter/material.dart';
import 'package:i_chaos/base_framework/ui/widget/provider_widget.dart';
import 'package:i_chaos/base_framework/widget_state/page_state.dart';
import 'package:i_chaos/ichaos/todo/todo-domain/core/scenes/home/widgets/filtered/filtered_tab_bar.dart';
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
            return FilteredTabBar(singleTodoListVM: vm, selectDate: DateTime.now(),);
          },
        )
    );
  }


}