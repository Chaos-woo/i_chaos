// ignore_for_file: prefer_initializing_formals

import 'package:flutter/material.dart';
import 'package:i_chaos/ichaos/todos-module/todos-domain/todos-common/models/subtask.dart';
import 'package:i_chaos/ichaos/todos-module/todos-domain/todos-common/models/todo_vo.dart';

typedef OnTodoDeleteCallback = void Function(BuildContext ctx, TodoVO vo);
typedef OnTodoDetailQueryCallback = void Function(BuildContext ctx, TodoVO vo, SubTaskVO clickSubTask);
typedef OnTodoModifyCallback = void Function(BuildContext ctx, TodoVO vo);
typedef OnTodoCompletedCallback = void Function(BuildContext ctx, TodoVO vo);
typedef OnTodoCancelCompletedCallback = void Function(BuildContext ctx, TodoVO vo);
typedef OnTodoToggleSubTaskCallback = void Function(TodoVO vo, SubTaskVO taskVO);

// 事件卡片操作回调
class OnTodoDo {
  OnTodoDeleteCallback? onDelete;
  OnTodoDetailQueryCallback? onDetailQuery;
  OnTodoModifyCallback? onModify;
  OnTodoModifyCallback? onCompleted;
  OnTodoCancelCompletedCallback? onCancelCompleted;
  OnTodoToggleSubTaskCallback? onTodoToggleSubTask;

  OnTodoDo({
    this.onDelete,
    this.onDetailQuery,
    this.onModify,
    this.onCompleted,
    this.onCancelCompleted,
    this.onTodoToggleSubTask,
  });
}
