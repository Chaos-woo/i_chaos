
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:i_chaos/base_framework/widget_state/widget_state.dart';
import 'package:i_chaos/ichaos/todo/todo-common/enums/todo_state.dart';
import 'package:i_chaos/ichaos/todo/todo-common/models/todo_vo.dart';
import 'package:i_chaos/ichaos/todo/todo-domain/core/scenes/home/widgets/card/todo_card.dart';
import 'package:i_chaos/ichaos/todo/todo-domain/core/scenes/home/widgets/todolist/single_todo_list_vm.dart';
import 'package:provider/provider.dart';

class SingleTodoList extends WidgetState with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;

  late bool _isActive;
  late TodoState _todoState;

  SingleTodoList({required bool isActive}) {
    _isActive = isActive;
    _todoState = _isActive ? TodoState.active : TodoState.completed;
  }

  @override
  Widget build(BuildContext context) {
    SingleTodoListVM vm = Provider.of<SingleTodoListVM>(context, listen: false);
    List<TodoVO> currTodoList = vm.getTodoListByState(_todoState);

    return Container(
      color: Colors.white70,
      child: ListView.builder(
        itemBuilder: (ctx, index) {
          if (index == currTodoList.length) {
            return Center(
              child: Text('no record'),
            );
          }
          return TodoCard(currTodoList[index]).transformToPageWidget();
        },
        itemCount: currTodoList.length + 1,
        addAutomaticKeepAlives: false,
        addRepaintBoundaries: false,
      ),
    );
  }
}

