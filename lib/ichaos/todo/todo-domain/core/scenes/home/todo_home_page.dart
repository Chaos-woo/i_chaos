
import 'package:flutter/material.dart';
import 'package:i_chaos/base_framework/ui/widget/provider_widget.dart';
import 'package:i_chaos/base_framework/widget_state/page_state.dart';
import 'package:i_chaos/ichaos/todo/todo-common/enums/todo_state.dart';
import 'package:i_chaos/ichaos/todo/todo-common/models/todo_vo.dart';
import 'widgets/todolist/single_todo_list_vm.dart';

class TodoHomePage extends PageState with AutomaticKeepAliveClientMixin{
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
            List<TodoVO> activeTodoList = vm.getTodoListByState(TodoState.active);
            return ListView.builder(
                itemBuilder: (ctx, index) {
                  return _todoItem(activeTodoList[index]);
                },
                itemCount: activeTodoList.length,
            );
          },
        )
    );
  }

  Widget _todoItem(TodoVO vo){
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(vo.content,style: TextStyle(
            fontSize: 30.sp,fontWeight: FontWeight.w400),//maxLines: 1,
        ),
        RaisedButton(onPressed: () {
          _singleTodoListVM.deleteMainTodo(vo.id!);
        },

        )
      ],
    );
  }




}