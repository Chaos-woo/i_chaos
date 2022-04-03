import 'package:flutter/cupertino.dart';
import 'package:i_chaos/base-getX-framework/view-model/widget_view_ctrl.dart';
import 'package:i_chaos/ichaos/common-module/get-controllers/font-family/font_family_ctrl.dart';
import 'package:i_chaos/ichaos/todos-module/todos-domain/todos-common/models/subtask.dart';
import 'package:i_chaos/ichaos/todos-module/todos-domain/todos-common/models/todo_vo.dart';
import 'package:i_chaos/ichaos/todos-module/todos-domain/todos-widgets/todo-card/todo_operate_callback.dart';

// 首页todo事件控制器
class HomeTodoCardCtrl extends WidgetViewCtrl {
  final TodoVO _todo;
  TodoOperateCallbacks? callbacks;

  // 是否展开子任务列表
  late bool _canExpandSubList;

  // 子任务列表是否出现展开/收起按钮的任务数量上限
  late int _expandSubListTotal;

  HomeTodoCardCtrl(this._todo, {this.callbacks});

  TodoVO get todo => _todo;

  String get todoBuilderTag => _todo.id!.toString();

  bool get canExpandSubList => _canExpandSubList;

  int get expandSubListTotal => _expandSubListTotal;

  TextStyle get baseTodoCardTextStyle => TextStyle(
    fontFamily: findDependency<FontFamilyCtrl>().fontFamily,
    fontSize: 14,
    fontWeight: FontWeight.w500,
  );

  void switchSubListExpand() {
    _canExpandSubList = !_canExpandSubList;
    updateListeners([todoBuilderTag]);
  }

  void onTodoToggleSubTask(SubTaskVO task) {
    callbacks?.onTodoToggleSubTaskCallback?.call(_todo, task);
    updateListeners([todoBuilderTag]);
  }

  @override
  void onBizDataHandle() {}

  @override
  void onStateCtrlDispose() {}

  @override
  void onStateCtrlInit() {
    _canExpandSubList = false; // 默认不展开子任务列表
    _expandSubListTotal = 2;
  }
}
