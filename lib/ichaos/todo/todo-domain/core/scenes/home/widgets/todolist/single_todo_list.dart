
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:i_chaos/ichaos/todo/todo-common/enums/todo_state.dart';
import 'package:i_chaos/ichaos/todo/todo-common/models/todo_vo.dart';
import 'package:i_chaos/ichaos/todo/todo-domain/core/scenes/home/widgets/card/todo_card.dart';
import 'package:i_chaos/ichaos/todo/todo-domain/core/scenes/home/widgets/todolist/single_todo_list_vm.dart';

class SingleTodoList extends StatelessWidget {
  late bool _isActive;
  late SingleTodoListVM _singleTodoListVM;
  late List<TodoVO> _currTodoList;

  SingleTodoList({Key? key, required bool isActive, required SingleTodoListVM singleTodoListVM}) : super(key: key) {
    _isActive = isActive;
    _singleTodoListVM = singleTodoListVM;
    TodoState state = _isActive ? TodoState.active : TodoState.completed;
    _currTodoList = _singleTodoListVM.getTodoListByState(state);
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (ctx, index) {
        return TodoCard(_currTodoList[index]).transformToPageWidget();
      },
      itemCount: _currTodoList.length,
    );
  }
}

