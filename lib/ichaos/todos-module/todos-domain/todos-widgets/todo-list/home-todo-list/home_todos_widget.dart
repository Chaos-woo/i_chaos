import 'package:flutter/material.dart';
import 'package:i_chaos/base-getX-framework/flutter3-pak-process/widget-chain/widget_chain.dart';
import 'package:i_chaos/base-getX-framework/get-x/views/additional/refresh_item_builder.dart';
import 'package:i_chaos/base-getX-framework/get-x/views/widgets/stateful_ctrl_widget.dart';
import 'package:i_chaos/base-getX-framework/utils/image_helper.dart';
import 'package:i_chaos/generated/l10n.dart';
import 'package:i_chaos/ichaos/common-module/common-widgets/loading-widget/divider_text.dart';
import 'package:i_chaos/ichaos/common-module/resources/app_layout.dart';
import 'package:i_chaos/ichaos/todos-module/todos-domain/todos-common/enums/todo_state.dart';
import 'package:i_chaos/ichaos/todos-module/todos-domain/todos-common/models/todo_vo.dart';
import 'package:i_chaos/ichaos/todos-module/todos-domain/todos-common/resources/todos_res.dart';
import 'package:i_chaos/ichaos/todos-module/todos-domain/todos-widgets/todo-card/home-card/home_todo_card_widget.dart';
import 'package:i_chaos/ichaos/todos-module/todos-domain/todos-widgets/todo-card/todo_do_callback.dart';
import 'package:i_chaos/ichaos/todos-module/todos-domain/todos-widgets/todo-list/home-todo-list/home_todos_ctrl.dart';

class HomeTodosWidget extends StatefulCtrlWidget<HomeTodosCtrl> {
  static String activeTodosBuilderId = 'active_todos';
  static String completedTodosBuilderId = 'completed_todos';

  bool isActiveTodos;
  late TodoState todosState;
  ListScrollListener? todosScrollListener; // 事件列表监听

  HomeTodosWidget({
    Key? key,
    required this.isActiveTodos,
    this.todosScrollListener,
  }) : super(key: key) {
    todosState = isActiveTodos ? TodoState.active : TodoState.completed;
  }

  @override
  Widget ctrlWidgetBuilder() {
    List<TodoVO> currentTodos = metaCtrl.listTodosByState(todosState);

    return pullDownCtrlViewBuilder<HomeTodosCtrl>(metaCtrl,
        listBuilder: RefreshListItemBuilder(
          builder: (ctx, index) {
            if (index == currentTodos.length) {
              // 获取列表末尾动态信息
              return _dynamicTrailing(currentTodos.length);
            }
            OnTodoDo doCallbacks = todoOperateCallbacks();
            return HomeTodoCardWidget(todo: currentTodos[index], todoCb: doCallbacks);
          },
          itemCount: currentTodos.length + 1,
        ),
        scrollListener: ListScrollListener(
          onListOverScroll: todosScrollListener?.onListOverScroll,
          onListScrollEnd: todosScrollListener?.onListScrollEnd,
          onListScrollUpdate: todosScrollListener?.onListScrollUpdate,
        ));
  }

  Widget _dynamicTrailing(int currentTodoListLength) {
    if (currentTodoListLength > 0) {
      // 当前列表数据大于0时，最后展示数据加载完的提示
      return _noMoreDataTrailing();
    }

    int completedTodoCnt = metaCtrl.completedTodoCnt;
    int activeTodoCnt = metaCtrl.activeTodoCnt;

    if (completedTodoCnt == 0 && activeTodoCnt == 0) {
      // 未完成/已完成均无数据时展示查找为空提示
      return _imgTextDividerTrailing(
          TodosRes.images.searchEmpty, S.current.todos_main_page_todo_list_tip_not_found);
    }

    if (isActiveTodos) {
      // 当前为未完成列表&已完成列表有数据则展示所有事件完成的提示
      if (completedTodoCnt > 0 && activeTodoCnt == 0) {
        return _imgTextDividerTrailing(TodosRes.images.todosComplete,
            S.current.todos_main_page_todo_list_tip_completed);
      } else {
        return _noMoreDataTrailing();
      }
    } else {
      // 当前为已完成列表&未完成列表有数据则展示还有未完成事件的提示
      if (activeTodoCnt > 0) {
        return _imgTextDividerTrailing(
          TodosRes.images.remainTodos,
          S.current.todos_main_page_todo_list_tip_has_more_todos,
        );
      } else {
        return _noMoreDataTrailing();
      }
    }
  }

  Widget _imgTextDividerTrailing(Widget image, String text) {
    return ImageHelper.imgWidget.vPromptImgWidget(
      image: image,
      textWidget: _textDividerTrailing(text),
    );
  }

  Widget _textDividerTrailing(String text, {EdgeInsetsGeometry? textPadding}) {
    final imgTextPadding = textPadding ?? AppLayout.padding.v20;

    return DividerTextWidget(text: text)
        .intoSizedBox(width: screenWidth / 3 * 2)
        .intoPadding(padding: imgTextPadding)
        .intoCenter();
  }

  Widget _noMoreDataTrailing() {
    return _textDividerTrailing(
      S.current.todos_main_page_todo_list_tip_no_data,
      textPadding: AppLayout.padding.v40,
    );
  }

  OnTodoDo todoOperateCallbacks() {
    return OnTodoDo(
      // 事件删除回调
      onDelete: (ctx, vo) {
        showToast(S.current.todos_todo_card_widget_toast_text_deleted);
        metaCtrl.deleteMainTodo(vo.id!);
//        filteredTabBarVM.selectedDateChange(singleTodoListVM.currentDate);
      },
      // 事件修改回调
      onModify: (ctx, vo) {
//        push(SingleTodoPage(vo, onSave: () {
//          Provider.of<DraftListVM>(context, listen: false).refresh();
////          filteredTabBarVM.selectedDateChange(singleTodoListVM.currentDate);
//        }));
      },
      // 事件完成回调
      onCompleted: (ctx, vo) {
        showToast(S.current.todos_todo_card_widget_toast_text_completed);
        metaCtrl.toggleMainTodoState(vo.id!);
//        filteredTabBarVM.selectedDateChange(singleTodoListVM.currentDate);
      },
      // 事件取消完成回调
      onCancelCompleted: (ctx, vo) {
        showToast(S.current.todos_todo_card_widget_toast_text_unaccomplished);
        metaCtrl.toggleMainTodoState(vo.id!);
//        filteredTabBarVM.selectedDateChange(singleTodoListVM.currentDate);
      },
      // 事件触发子任务状态回调
      onTodoToggleSubTask: (vo, taskVO) {
        // 是否需要刷新列表：子任务全部完成时刷新列表
        metaCtrl.toggleSubTaskState(vo, taskVO.uuid).then((refreshList) {
          if (refreshList) {
            showToast(S.current.todos_todo_card_widget_toast_text_all_subtask_completed);
//            filteredTabBarVM.selectedDateChange(singleTodoListVM.currentDate);
          } else {
            if (taskVO.completed) {
              showToast(S.current.todos_todo_card_widget_toast_text_subtask_completed);
            }
          }
        });
      },
      // 事件查看回调
      onDetailQuery: (ctx, vo, clickSubTask) {
        // 是否需要刷新列表：子任务全部完成时刷新列表
        metaCtrl.toggleSubTaskState(vo, clickSubTask.uuid).then((refreshList) {
//          filteredTabBarVM.selectedDateChange(singleTodoListVM.currentDate);
//          thisTodoCardWidget.refreshState();
        });
      },
    );
  }
}
