// ignore_for_file: prefer_initializing_formals, import_of_legacy_library_into_null_safe, implementation_imports

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:i_chaos/base_framework/utils/image_helper.dart';
import 'package:i_chaos/base_framework/widget_state/widget_state.dart';
import 'package:i_chaos/generated/l10n.dart';
import 'package:i_chaos/ichaos/public/units/snack_bar_util.dart';
import 'package:i_chaos/ichaos/todo/todo-domain/common/enums/todo_state.dart';
import 'package:i_chaos/ichaos/todo/todo-domain/common/models/todo_vo.dart';
import 'package:i_chaos/ichaos/todo/todo-domain/core/scenes/details/single_todo_page.dart';
import 'package:i_chaos/ichaos/todo/todo-domain/core/scenes/draft-box/draft_list_vm.dart';
import 'package:i_chaos/ichaos/todo/todo-domain/core/widgets/card/todo_card.dart';
import 'package:i_chaos/ichaos/todo/todo-domain/core/widgets/card/todo_op_callback.dart';
import 'package:i_chaos/ichaos/todo/todo-domain/core/widgets/filtered/filtered_tab_bar_vm.dart';
import 'package:i_chaos/ichaos/todo/todo-domain/core/widgets/todolist/single_todo_list_vm.dart';
import 'package:provider/provider.dart';
import 'package:widget_chain/widget_chain.dart';

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

    final todoOperateCallback = TodoOperateCallback(
      // 事件删除回调
      onDelete: (ctx, vo) {
        showSimpleToast(S.of(context).todo_card_toast_delete_text1);
        singleTodoListVM.deleteMainTodo(vo.id!);
        filteredTabBarVM.selectedDateChange(singleTodoListVM.currentDate);
      },
      // 事件修改回调
      onModify: (ctx, vo) {
        push(SingleTodoPage(vo, onSave: () {
          Provider.of<DraftListVM>(context, listen: false).refresh();
          filteredTabBarVM.selectedDateChange(singleTodoListVM.currentDate);
        }));
      },
      // 事件完成回调
      onCompleted: (ctx, vo) {
        showSimpleToast(S.of(context).todo_card_toast_completed_text1);
        singleTodoListVM.toggleMainTodoState(vo.id!);
        filteredTabBarVM.selectedDateChange(singleTodoListVM.currentDate);
      },
      // 事件取消完成回调
      onCancelCompleted: (ctx, vo) {
        showSimpleToast(S.of(context).todo_card_toast_unaccomplished_text1);
        singleTodoListVM.toggleMainTodoState(vo.id!);
        filteredTabBarVM.selectedDateChange(singleTodoListVM.currentDate);
      },
      // 事件触发子任务状态回调
      onTodoToggleSubTaskCallback: (vo, taskVO, thisTodoWidget) {
        // 是否需要刷新列表：子任务全部完成时刷新列表
        singleTodoListVM.toggleSubTaskState(vo, taskVO.uuid).then((refreshList) {
          if (refreshList) {
            showSimpleToast(S.of(context).todo_card_toast_subtask_completed_text1);
            filteredTabBarVM.selectedDateChange(singleTodoListVM.currentDate);
          } else {
            if (taskVO.completed) {
              showSimpleToast(S.of(context).todo_card_toast_subtask_completed_text4);
            }
            thisTodoWidget.refreshState();
          }
        });
      },
      // 事件查看回调
      onDetailQuery: (ctx, vo, thisTodoCardWidget, clickSubTask) {
        // 是否需要刷新列表：子任务全部完成时刷新列表
        singleTodoListVM.toggleSubTaskState(vo, clickSubTask.uuid).then((refreshList) {
          filteredTabBarVM.selectedDateChange(singleTodoListVM.currentDate);
          thisTodoCardWidget.refreshState();
        });
      },
    );

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
          return generateWidget(() => WidgetTodoCard(
                currTodoList[index],
                expandBtnDisplayLimits: 4,
                operateCallback: todoOperateCallback,
              ));
        },
        itemCount: currTodoList.length + 1,
      ),
    );
  }

  // 仅有当前ListView下标和事件列表长度相同时获取占位
  Widget _getMoreTipPlaceholder(int currentTodoListLength, SingleTodoListVM singleTodoListVM) {
    if (currentTodoListLength > 0) {
      // 当前列表数据大于0时，最后展示数据加载完的提示
      return Padding(
        padding: const EdgeInsets.symmetric(vertical: 20),
        child: tipText(S.of(context).todo_list_placeholder_no_data).intoCenter(),
      );
    }

    int completedTodoCnt = singleTodoListVM.completedTodoCnt;
    int activeTodoCnt = singleTodoListVM.activeTodoCnt;

    if (completedTodoCnt == 0 && activeTodoCnt == 0) {
      // 未完成/已完成均无数据时展示查找为空提示
      final Widget tip = ImageHelper.placeHolderLocalSVGImg(imageName: 'image_search_empty', width: 100, height: 100)
          .addNeighbor(tipText(S.of(context).todo_list_placeholder_not_found))
          .intoColumn(mainAxisAlignment: MainAxisAlignment.center);

      return Padding(
        padding: const EdgeInsets.symmetric(vertical: 40),
        child: tip.intoCenter(),
      );
    }

    if (_isActive) {
      // 当前为未完成列表&已完成列表有数据则展示所有事件完成的提示
      final Widget tip = (completedTodoCnt > 0
          ? ImageHelper.placeHolderLocalSVGImg(imageName: 'image_complete', width: 100, height: 100)
              .addNeighbor(tipText(S.of(context).todo_list_placeholder_completed))
              .intoColumn(mainAxisAlignment: MainAxisAlignment.center)
          : tipText(S.of(context).todo_list_placeholder_no_data));

      return Padding(
        padding: const EdgeInsets.symmetric(vertical: 40),
        child: tip.intoCenter(),
      );
    } else {
      // 当前为已完成列表&未完成列表有数据则展示还有未完成事件的提示
      final Widget tip = (activeTodoCnt > 0
          ? ImageHelper.placeHolderLocalSVGImg(imageName: 'image_task', width: 100, height: 100)
              .addNeighbor(tipText(S.of(context).todo_list_placeholder_more_todo))
              .intoColumn(mainAxisAlignment: MainAxisAlignment.center)
          : tipText(S.of(context).todo_list_placeholder_no_data));

      return Padding(
        padding: const EdgeInsets.symmetric(vertical: 40),
        child: tip.intoCenter(),
      );
    }
  }

  Widget tipText(String text) {
    return Text('-- $text --',
        style: const TextStyle(
          color: Color(0xFF757575),
          fontFamily: 'Lexend Deca',
          fontWeight: FontWeight.w500,
          fontSize: 12,
        ));
  }
}
