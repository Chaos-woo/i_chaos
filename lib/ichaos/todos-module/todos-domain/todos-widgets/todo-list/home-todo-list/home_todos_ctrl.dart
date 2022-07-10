import 'dart:async';

import 'package:get/get.dart';
import 'package:i_chaos/base-getX-framework/events/event_bus_helper.dart';
import 'package:i_chaos/base-getX-framework/get-x/ctrls/repeatable_all_state_ctrl.dart';
import 'package:i_chaos/ichaos/common-module/extensions/date_time_extension.dart';
import 'package:i_chaos/ichaos/todos-module/todos-domain/todos-common/enums/todo_sort_rule.dart';
import 'package:i_chaos/ichaos/todos-module/todos-domain/todos-common/enums/todo_state.dart';
import 'package:i_chaos/ichaos/todos-module/todos-domain/todos-common/events/publishers/todos_event_publisher.dart';
import 'package:i_chaos/ichaos/todos-module/todos-domain/todos-common/events/todos_active_cnt_event.dart';
import 'package:i_chaos/ichaos/todos-module/todos-domain/todos-common/events/todos_cud_event.dart';
import 'package:i_chaos/ichaos/todos-module/todos-domain/todos-common/events/todos_date_change_event.dart';
import 'package:i_chaos/ichaos/todos-module/todos-domain/todos-common/models/subtask.dart';
import 'package:i_chaos/ichaos/todos-module/todos-domain/todos-common/models/todo_vo.dart';
import 'package:i_chaos/ichaos/todos-module/todos-domain/todos-common/repository/todo_repository.dart';
import 'package:i_chaos/ichaos/todos-module/todos-domain/todos-common/utils/sort_util.dart';

/// 事件列表视图模型
class HomeTodosCtrl extends RepeatableAllStateCtrl<TodoVO> implements GetxService {
  HomeTodosCtrl(this.currentDate);

  // 排序规则，支持自定义后将排序规则的获取放置到service中
  final List<int> _orders = TodoSortRule.defaultTodoSortRulesOrderIds;
  final List<int> _defaultOrders = TodoSortRule.defaultTodoSortRulesOrderIds;

  late DateTime currentDate; // 当前选择日期
  List<TodoVO> activeTodos = []; // X日已完成事件列表
  List<TodoVO> completedTodos = []; // X日未完成事件列表

  final TodoRepository _todoRepo = /*GetXReferenceMixin.findRef()*/ TodoRepository();
  late StreamSubscription _onDateChangeCert;
  late StreamSubscription _onTodosCreateOrDeleteCert;

  int get activeTodoCnt => activeTodos.length;

  int get completedTodoCnt => completedTodos.length;

  @override
  void initStateRes() {
    super.initStateRes();

    _onDateChangeCert = EventBusHelper().subscribe<TodosDateChangeEvent>((event) {
      if (!currentDate.isSameDay(event.selectedDate)) {
        currentDate = event.selectedDate;
        print('get msg: $event : current: $currentDate');
        onProcessRequestRefreshData();
      }
    });

    _onTodosCreateOrDeleteCert = EventBusHelper().subscribe<TodosCreateOrDeleteEvent>((event) {
      List<CudTodo> cudTodos = event.todos
          .where(
              (e) => e.todo.validTime != null && currentDate.isSameDay(e.todo.validTime!))
          .toList();

      if (cudTodos.isNotEmpty) {
        _onProcessTodosCudEvent(cudTodos);
        _fireActiveTodosCntEvent();
      }
    });
  }

  @override
  void releaseStateRes() {
    super.releaseStateRes();
    _onDateChangeCert.cancel();
    _onTodosCreateOrDeleteCert.cancel();
  }

  @override
  void onRefreshLoadCompleted(List<TodoVO> data) => _classifyTodos(data);

  // todos分类保存
  void _classifyTodos(List<TodoVO> data) {
    activeTodos = data.where((todo) => !todo.completed && isValidTodo(todo)).toList();
    completedTodos = data.where((todo) => todo.completed && isValidTodo(todo)).toList();
  }

  // 是否是有效的事件，事件无有效时间时标识为草稿
  bool isValidTodo(TodoVO vo) {
    return vo.validTime != null;
  }

  void _onProcessTodosCudEvent(List<CudTodo> cudTodos) {
    for (CudTodo todo in cudTodos) {
      if (TodoCudType.create == todo.type) {
        activeTodos.add(todo.todo);
      } else if (TodoCudType.update == todo.type) {
      } else if (TodoCudType.delete == todo.type) {}
    }

    updateBuilder();
  }

  // 从数据源获取指定日期的事件列表切换内存中的事件列表
  void listTodosByDate(DateTime selectedDate) async {
    currentDate = selectedDate;
    List<TodoVO> todoList =
        await _todoRepo.listTodo(start: currentDate, end: currentDate);
    _classifyTodos(todoList);
  }

  // 根据id获取内存中事件的位置
  TodoVO? _findTodoBelongTo(int id) {
    TodoVO activeTodo = activeTodos.firstWhere((element) => element.id == id,
        orElse: () => TodoVO.empty());
    TodoVO completedTodo = completedTodos.firstWhere((element) => element.id == id,
        orElse: () => TodoVO.empty());
    return (activeTodo.id == null && completedTodo.id == null)
        ? null
        : activeTodo.id == null
            ? completedTodo
            : activeTodo;
  }

  TodoVO? _findInMemery(int id) {}

  // 获取对应事件状态的事件列表
  List<TodoVO> listTodosByState(TodoState state) {
    List<TodoVO> selectedList = [];
    switch (state) {
      case TodoState.active:
        selectedList.addAll(activeTodos);
        break;
      case TodoState.completed:
        selectedList.addAll(completedTodos);
        break;
      case TodoState.all:
        selectedList.addAll(activeTodos);
        selectedList.addAll(completedTodos);
        break;
      default:
        selectedList = [];
        break;
    }
    SortUtil.sortTodo(selectedList, _defaultOrders);
    return selectedList;
  }

  // 更改事件完成状态
  void toggleMainTodoState(int id) async {
    TodoVO? vo = _findTodoBelongTo(id);
    if (vo == null) {
      return;
    }
    DateTime now = DateTime.now();
    TodoVO copy = vo.copyWith();
    copy.completed = !copy.completed;
    copy.updateTime = now;
    copy.completedTime = copy.completed ? now : null;
    await _todoRepo.updateTodo(copy);
  }

  // 更新子事件状态
  Future<bool> toggleSubTaskState(TodoVO vo, String subTaskUuid) async {
    int todoIndex = activeTodos.indexWhere((element) => element.id == vo.id);
    if (todoIndex == -1) {
      return false;
    }
    TodoVO newVo = vo.copyWith();
    int subTaskIndex =
        newVo.subTaskList.indexWhere((element) => element.uuid == subTaskUuid);
    if (subTaskIndex == -1) {
      return false;
    }
    // 更新子事件状态
    SubTaskVO subTask = newVo.subTaskList[subTaskIndex];
    subTask.completed = !subTask.completed;
    subTask.updateTime = DateTime.now();
    newVo.subTaskList[subTaskIndex] = subTask;

    // 检查当前子事件完成是否会影响主事件的完成状态
    int totalCompletedCntOfTodo =
        newVo.subTaskList.where((element) => element.completed).length;
    bool completedFlagOfTodo = newVo.subTaskList.length == totalCompletedCntOfTodo;
    if (completedFlagOfTodo) {
      DateTime now = DateTime.now();
      newVo.completed = true;
      newVo.updateTime = now;
      newVo.completedTime = now;
    }

    int affect = await _todoRepo.updateTodo(newVo);
    return completedFlagOfTodo;
  }

  // 删除事件
  void deleteMainTodo(int id) async {
    TodoVO? vo = _findTodoBelongTo(id);
    if (vo == null) {
      return;
    }

    await _todoRepo.deleteTodoByVO(vo);
  }

  // 事件更新
  void updateTodo(TodoVO vo) {
    _todoRepo.updateTodo(vo);
  }

  Future<void> clearTodoTag(int tagId) async {
    await _todoRepo.clearTodoTagByTagId(tagId);
  }

  void _fireActiveTodosCntEvent() => EventBusHelper().fire(TodosActiveCntEvent(publisher: TodosEventPublisher.homeTodoList));

  @override
  Future<List<TodoVO>> onLoadData({int? page, int? pageSize}) {
    // 拉取当前日期的事件
    return _todoRepo.listTodo(start: currentDate, end: currentDate);
    //  return Future.delayed(const Duration(seconds: 3), () {
    //    List<TodoVO> todos = [
    //      for(int i=0;i<30;i++)
    //        TodoVO.fakeTester(),
    //    ];
    //
    //    return Future.value(todos);
    //  });
  }
}
