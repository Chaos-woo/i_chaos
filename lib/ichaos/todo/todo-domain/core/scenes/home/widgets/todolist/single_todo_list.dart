import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:getwidget/components/toast/gf_toast.dart';
import 'package:getwidget/position/gf_toast_position.dart';
import 'package:i_chaos/base_framework/widget_state/widget_state.dart';
import 'package:i_chaos/ichaos/public/units/snack_bar_util.dart';
import 'package:i_chaos/ichaos/todo/todo-common/enums/todo_state.dart';
import 'package:i_chaos/ichaos/todo/todo-common/models/todo_vo.dart';
import 'package:i_chaos/ichaos/todo/todo-domain/core/scenes/details/single_todo_page.dart';
import 'package:i_chaos/ichaos/todo/todo-domain/core/scenes/home/widgets/card/todo_card.dart';
import 'package:i_chaos/ichaos/todo/todo-domain/core/scenes/home/widgets/todolist/single_todo_list_vm.dart';
import 'package:oktoast/oktoast.dart';
import 'package:provider/provider.dart';

typedef OnTodoListScrollUpdate = void Function();
typedef OnTodoListScrollEnd = void Function();
typedef OnTodoListOverScroll = void Function();

class TodoListScrollCallback {
  OnTodoListScrollUpdate? onTodoListScrollUpdate;
  OnTodoListScrollEnd? onTodoListScrollEnd;
  OnTodoListOverScroll? onTodoListOverScroll;

  TodoListScrollCallback(
      {OnTodoListScrollUpdate? onTodoListScrollUpdate, OnTodoListScrollEnd? onTodoListScrollEnd, OnTodoListOverScroll? onTodoListOverScroll}) {
    // ignore: prefer_initializing_formals
    this.onTodoListScrollUpdate = onTodoListScrollUpdate;
    // ignore: prefer_initializing_formals
    this.onTodoListScrollEnd = onTodoListScrollEnd;
    // ignore: prefer_initializing_formals
    this.onTodoListOverScroll = onTodoListOverScroll;
  }
}

class SingleTodoList extends WidgetState with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;

  late bool _isActive;
  late TodoState _todoState;

  // 监听事件列表回调
  TodoListScrollCallback? _todoListScrollCallback;

  SingleTodoList({required bool isActive, TodoListScrollCallback? todoListScrollCallback}) {
    _isActive = isActive;
    _todoState = _isActive ? TodoState.active : TodoState.completed;
    _todoListScrollCallback = todoListScrollCallback;
  }

  @override
  Widget build(BuildContext context) {
    SingleTodoListVM singleTodoListVM = Provider.of<SingleTodoListVM>(context, listen: false);
    List<TodoVO> currTodoList = singleTodoListVM.getTodoListByState(_todoState);

    return Container(
      color: Colors.white54,
      child: NotificationListener<ScrollNotification>(
        onNotification: (notification) {
          if (notification.depth == 0) {
            switch (notification.runtimeType) {
              case ScrollUpdateNotification:
                _todoListScrollCallback?.onTodoListScrollUpdate?.call();
                break;
              case ScrollEndNotification:
                _todoListScrollCallback?.onTodoListScrollEnd?.call();
                break;
              case OverscrollNotification:
                _todoListScrollCallback?.onTodoListOverScroll?.call();
                break;
              default:
                break;
            }
          }
          return false;
        },
        child: ListView.builder(
          itemBuilder: (ctx, index) {
            if (index == currTodoList.length) {
              return const Padding(
                padding: EdgeInsets.symmetric(vertical: 20),
                child: Center(
                  child: Text(
                    '-- 没有更多记录啦 --',
                    style: TextStyle(color: Color(0xFF757575), fontFamily: 'Lexend Deca', fontWeight: FontWeight.w500, fontSize: 12),
                  ),
                ),
              );
            }
            return TodoCard(currTodoList[index], operateCallback: TodoOperateCallback(
              onDelete: (ctx, vo) {
                singleTodoListVM.deleteMainTodo(vo.id!);
                SnackBarUtil.topBar('删除完成: ${vo.content}');
              },
              onModify: (ctx, vo) {
                push(SingleTodoPage(vo));
              },
              onDetailQuery: (ctx, vo) {
//                push();
              }
            )).transformToPageWidget();
          },
          itemCount: currTodoList.length + 1,
          addAutomaticKeepAlives: false,
          addRepaintBoundaries: false,
        ),
      ),
    );
  }
}
