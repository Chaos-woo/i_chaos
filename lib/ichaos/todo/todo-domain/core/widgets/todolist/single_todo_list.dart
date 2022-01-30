// ignore_for_file: prefer_initializing_formals

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:i_chaos/base_framework/utils/image_helper.dart';
import 'package:i_chaos/base_framework/widget_state/widget_state.dart';
import 'package:i_chaos/ichaos/public/units/snack_bar_util.dart';
import 'package:i_chaos/ichaos/todo/todo-domain/common/enums/todo_state.dart';
import 'package:i_chaos/ichaos/todo/todo-domain/common/models/todo_vo.dart';
import 'package:i_chaos/ichaos/todo/todo-domain/core/scenes/details/single_todo_page.dart';
import 'package:i_chaos/ichaos/todo/todo-domain/core/widgets/card/todo_card.dart';
import 'package:i_chaos/ichaos/todo/todo-domain/core/widgets/filtered/filtered_tab_bar_vm.dart';
import 'package:i_chaos/ichaos/todo/todo-domain/core/widgets/todolist/single_todo_list_vm.dart';
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
    this.onTodoListScrollUpdate = onTodoListScrollUpdate;
    this.onTodoListScrollEnd = onTodoListScrollEnd;
    this.onTodoListOverScroll = onTodoListOverScroll;
  }
}

class WidgetSingleTodoList extends WidgetState {
  late bool _isActive;
  late TodoState _todoState;

  // 监听事件列表回调
  TodoListScrollCallback? _todoListScrollCallback;

  WidgetSingleTodoList({required bool isActive, TodoListScrollCallback? todoListScrollCallback}) {
    _isActive = isActive;
    _todoState = _isActive ? TodoState.active : TodoState.completed;
    _todoListScrollCallback = todoListScrollCallback;
  }

  @override
  Widget build(BuildContext context) {
    SingleTodoListVM singleTodoListVM = Provider.of<SingleTodoListVM>(context, listen: false);
    FilteredTabBarVM filteredTabBarVM = Provider.of<FilteredTabBarVM>(context, listen: false);
    List<TodoVO> currTodoList = singleTodoListVM.getTodoListByState(_todoState);

    return NotificationListener<ScrollNotification>(
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
            return _getMoreTipPlaceholder(currTodoList.length, singleTodoListVM);
          }
          return generateWidget(() => WidgetTodoCard(currTodoList[index],
              expandBtnDisplayLimits: 4,
              operateCallback: TodoOperateCallback(onDelete: (ctx, vo) {
                SnackBarUtil.topBar(textSpans: [
                  const TextSpan(text: '已删除 ε==3', style: SnackBarUtil.defaultStyle),
                  const TextSpan(text: '任务[ ', style: SnackBarUtil.defaultStyle),
                  TextSpan(text: vo.content, style: SnackBarUtil.snackBarTextStyleWithColor(Colors.orange)),
                  const TextSpan(text: ' ]', style: SnackBarUtil.defaultStyle),
                ], textSpanLineFeedCnt: 1);
                singleTodoListVM.deleteMainTodo(vo.id!);
                filteredTabBarVM.selectedDateChange(singleTodoListVM.currentDate);
              }, onModify: (ctx, vo) {
                push(SingleTodoPage(vo, onSave: () {
                  filteredTabBarVM.selectedDateChange(singleTodoListVM.currentDate);
                }));
              }, onCompleted: (ctx, vo) {
                SnackBarUtil.topBar(textSpans: [
                  const TextSpan(text: '恭喜~(o≖◡≖)', style: SnackBarUtil.defaultStyle),
                  const TextSpan(text: '任务[ ', style: SnackBarUtil.defaultStyle),
                  TextSpan(text: vo.content, style: SnackBarUtil.snackBarTextStyleWithColor(Colors.orange)),
                  const TextSpan(text: ' ]完成了', style: SnackBarUtil.defaultStyle),
                ], textSpanLineFeedCnt: 1);
                singleTodoListVM.toggleMainTodoState(vo.id!);
                filteredTabBarVM.selectedDateChange(singleTodoListVM.currentDate);
              }, onCancelCompleted: (ctx, vo) {
                SnackBarUtil.topBar(textSpans: [
                  const TextSpan(text: '点错了吧? 明明完成了(O_O)?', style: SnackBarUtil.defaultStyle),
                  const TextSpan(text: '任务[ ', style: SnackBarUtil.defaultStyle),
                  TextSpan(text: vo.content, style: SnackBarUtil.snackBarTextStyleWithColor(Colors.orange)),
                  const TextSpan(text: ' ]', style: SnackBarUtil.defaultStyle),
                ], textSpanLineFeedCnt: 1);
                singleTodoListVM.toggleMainTodoState(vo.id!);
                filteredTabBarVM.selectedDateChange(singleTodoListVM.currentDate);
              }, onTodoToggleSubTaskCallback: (vo, taskVO, thisTodoWidget) {
                // 是否需要刷新列表：子任务全部完成时刷新列表
                singleTodoListVM.toggleSubTaskState(vo, taskVO.uuid).then((refreshList) {
                  if (refreshList) {
                    SnackBarUtil.topBar(textSpans: [
                      const TextSpan(text: '恭喜~(o≖◡≖)', style: SnackBarUtil.defaultStyle),
                      const TextSpan(text: '任务[ ', style: SnackBarUtil.defaultStyle),
                      TextSpan(text: vo.content, style: SnackBarUtil.snackBarTextStyleWithColor(Colors.orange)),
                      const TextSpan(text: ' ]完成了', style: SnackBarUtil.defaultStyle),
                    ], textSpanLineFeedCnt: 1);
                    filteredTabBarVM.selectedDateChange(singleTodoListVM.currentDate);
                  } else {
                    if (taskVO.completed) {
                      SnackBarUtil.topBar(textSpans: [
                        const TextSpan(text: '恭喜! 又迈向成功一小步~(o≖◡≖)', style: SnackBarUtil.defaultStyle),
                        TextSpan(text: vo.content, style: SnackBarUtil.snackBarTextStyleWithColor(Colors.orange)),
                        const TextSpan(text: '子任务[ ', style: SnackBarUtil.defaultStyle),
                        TextSpan(text: taskVO.content, style: SnackBarUtil.snackBarTextStyleWithColor(Colors.orange)),
                        const TextSpan(text: ' ]完成了', style: SnackBarUtil.defaultStyle),
                      ], textSpanLineFeedCnt: 2);
                    }
                    thisTodoWidget.refreshState();
                  }
                });
              })));
        },
        itemCount: currTodoList.length + 1,
      ),
    );
  }

  // 仅有当前ListView下标和事件列表长度相同时获取占位
  Widget _getMoreTipPlaceholder(int currentTodListLength, SingleTodoListVM singleTodoListVM) {
    if (currentTodListLength > 0) {
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

    int completedTodoCnt = singleTodoListVM.completedTodoCnt;
    int activeTodoCnt = singleTodoListVM.activeTodoCnt;

    if (completedTodoCnt == 0 && activeTodoCnt == 0) {
      return Padding(
        padding: const EdgeInsets.symmetric(vertical: 40),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ImageHelper.placeHolderLocalSVGImg(imageName: 'image_search_empty', width: 100, height: 100),
              const Text('什么都没有找到呢~',
                  style: TextStyle(color: Color(0xFF757575), fontFamily: 'Lexend Deca', fontWeight: FontWeight.w500, fontSize: 12))
            ],
          ),
        ),
      );
    }

    if (_isActive) {
      return Padding(
        padding: const EdgeInsets.symmetric(vertical: 40),
        child: Center(
          child: completedTodoCnt > 0
              ? Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ImageHelper.placeHolderLocalSVGImg(imageName: 'image_complete', width: 100, height: 100),
                    const Text('ToDO都完成啦~',
                        style: TextStyle(color: Color(0xFF757575), fontFamily: 'Lexend Deca', fontWeight: FontWeight.w500, fontSize: 12))
                  ],
                )
              : const Text(
                  '-- 没有更多记录啦 --',
                  style: TextStyle(color: Color(0xFF757575), fontFamily: 'Lexend Deca', fontWeight: FontWeight.w500, fontSize: 12),
                ),
        ),
      );
    } else {
      return Padding(
        padding: const EdgeInsets.symmetric(vertical: 40),
        child: Center(
          child: activeTodoCnt > 0
              ? Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ImageHelper.placeHolderLocalSVGImg(imageName: 'image_task', width: 100, height: 100),
                    const Text('还有待完成的事项喔~',
                        style: TextStyle(color: Color(0xFF757575), fontFamily: 'Lexend Deca', fontWeight: FontWeight.w500, fontSize: 12))
                  ],
                )
              : const Text(
                  '-- 没有更多记录啦 --',
                  style: TextStyle(color: Color(0xFF757575), fontFamily: 'Lexend Deca', fontWeight: FontWeight.w500, fontSize: 12),
                ),
        ),
      );
    }
  }
}