import 'dart:async';

import 'package:get/get.dart';
import 'package:i_chaos/base-getX-framework/events/event_bus_helper.dart';
import 'package:i_chaos/base-getX-framework/get-x/ctrls/running_state_ctrl.dart';
import 'package:i_chaos/base-getX-framework/get-x/mixin/get_reference_mixin.dart';
import 'package:i_chaos/ichaos/todos-module/todos-domain/todos-common/enums/todo_state.dart';
import 'package:i_chaos/ichaos/todos-module/todos-domain/todos-common/events/todos_active_cnt_event.dart';
import 'package:i_chaos/ichaos/todos-module/todos-domain/todos-common/models/todo_vo.dart';
import 'package:i_chaos/ichaos/todos-module/todos-domain/todos-widgets/calendar-bar/calendar_bar_ctrl.dart';
import 'package:i_chaos/ichaos/todos-module/todos-domain/todos-widgets/home-tab-view/home_todo_tab_view_widget.dart';
import 'package:i_chaos/ichaos/todos-module/todos-domain/todos-widgets/todo-list/home-todo-list/home_todos_ctrl.dart';

class HomeTodoTabViewCtrl extends RunningStateCtrl implements GetxService {

  final int totalTabCnt = 2; // tabBar的总个数
  final HomeTodosCtrl _todosCtrl = GetXReferenceMixin.findRef();
  late StreamSubscription _todsActiveCntCert;

  bool get isLoading => _todosCtrl.isLoadingState;

  // 获取未完成事件数量
  int get activeTodoCnt => _todosCtrl.activeTodoCnt;

  // 获取已完成事件数量
  int get completedTodoCnt => _todosCtrl.completedTodoCnt;

  // 获取当前选择日期
  DateTime get currentDate => findReference<CalendarBarCtrl>().currentDate;

  // 获取对应状态的事件列表
  List<TodoVO> get activeTodoList => _todosCtrl.listTodosByState(TodoState.active);

  List<TodoVO> get completedTodoList =>
      _todosCtrl.listTodosByState(TodoState.completed);

  @override
  void initStateRes() {
    _todsActiveCntCert = EventBusHelper().subscribe<TodosActiveCntEvent>(
      (event) => updateBuilders([HomeTodoTabViewWidget.activeTabNumBuilderId]),
    );
  }

  @override
  void releaseStateRes() {
    _todsActiveCntCert.cancel();
  }
}
