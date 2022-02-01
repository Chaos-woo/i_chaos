
// ignore_for_file: prefer_initializing_formals

import 'package:flutter/material.dart';
import 'package:i_chaos/ichaos/todo/todo-domain/common/models/subtask.dart';
import 'package:i_chaos/ichaos/todo/todo-domain/common/models/todo_vo.dart';
import 'package:i_chaos/ichaos/todo/todo-domain/core/widgets/card/todo_card.dart';

typedef OnTodoDeleteCallback = void Function(BuildContext ctx, TodoVO vo);
typedef OnTodoDetailQueryCallback = void Function(BuildContext ctx, TodoVO vo);
typedef OnTodoModifyCallback = void Function(BuildContext ctx, TodoVO vo);
typedef OnTodoCompletedCallback = void Function(BuildContext ctx, TodoVO vo);
typedef OnTodoCancelCompletedCallback = void Function(BuildContext ctx, TodoVO vo);
typedef OnTodoToggleSubTaskCallback = void Function(TodoVO vo, SubTaskVO taskVO, WidgetTodoCard thisTodoWidget);

// 事件卡片操作回调
class TodoOperateCallback {
  OnTodoDeleteCallback? onDelete;
  OnTodoDetailQueryCallback? onDetailQuery;
  OnTodoModifyCallback? onModify;
  OnTodoModifyCallback? onCompleted;
  OnTodoCancelCompletedCallback? onCancelCompleted;
  OnTodoToggleSubTaskCallback? onTodoToggleSubTaskCallback;

  TodoOperateCallback(
      {OnTodoDeleteCallback? onDelete,
        OnTodoDetailQueryCallback? onDetailQuery,
        OnTodoModifyCallback? onModify,
        OnTodoModifyCallback? onCompleted,
        OnTodoCancelCompletedCallback? onCancelCompleted,
        OnTodoToggleSubTaskCallback? onTodoToggleSubTaskCallback}) {
    this.onDelete = onDelete;
    this.onDetailQuery = onDetailQuery;
    this.onModify = onModify;
    this.onCompleted = onCompleted;
    this.onCancelCompleted = onCancelCompleted;
    this.onTodoToggleSubTaskCallback = onTodoToggleSubTaskCallback;
  }
}