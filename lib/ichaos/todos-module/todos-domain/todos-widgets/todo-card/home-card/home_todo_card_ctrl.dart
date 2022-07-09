import 'package:flutter/cupertino.dart';
import 'package:i_chaos/base-getX-framework/get-x/ctrls/running_state_ctrl.dart';
import 'package:i_chaos/ichaos/common-module/get-controllers/font-family/font_family_ctrl.dart';
import 'package:i_chaos/ichaos/todos-module/todos-domain/todos-common/models/subtask.dart';
import 'package:i_chaos/ichaos/todos-module/todos-domain/todos-common/models/todo_vo.dart';

// 首页todo事件控制器
class HomeTodoCardCtrl extends RunningStateCtrl {
  final TodoVO todo;

  HomeTodoCardCtrl(this.todo);

  TextStyle get baseTodoCardTextStyle => TextStyle(
        fontFamily: findReference<FontFamilyCtrl>().fontFamily,
        fontSize: 14,
        fontWeight: FontWeight.w500,
      );

  void onTodoToggleSubTask(SubTaskVO task) {
    // onTodoOperate?.onTodoToggleSubTask?.call(todo, task);
    // updateListeners([todoBuilderTag]);
  }
}
