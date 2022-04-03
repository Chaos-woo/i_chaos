import 'package:i_chaos/base-getX-framework/view-model/list_view_state_ctrl.dart';
import 'package:i_chaos/generated/l10n.dart';
import 'package:i_chaos/ichaos/common-module/utils/uuid.dart';
import 'package:i_chaos/ichaos/todos-module/todos-domain/todos-common/enums/todo_sort_rule.dart';
import 'package:i_chaos/ichaos/todos-module/todos-domain/todos-common/enums/todo_state.dart';
import 'package:i_chaos/ichaos/todos-module/todos-domain/todos-common/models/subtask.dart';
import 'package:i_chaos/ichaos/todos-module/todos-domain/todos-common/models/todo_vo.dart';
import 'package:i_chaos/ichaos/todos-module/todos-domain/todos-common/repository/todo_repository.dart';
import 'package:i_chaos/ichaos/todos-module/todos-domain/todos-common/units/sort_unit.dart';
import 'package:i_chaos/ichaos/todos-module/todos-domain/todos-widgets/todo-card/todo_operate_callback.dart';

/// 事件列表视图模型
class HomeTodoListCtrl extends ListViewStateCtrl<TodoVO> {
  // 排序规则，支持自定义后将排序规则的获取放置到service中
  final List<int> _orders = TodoSortRule.defaultTodoSortRulesOrderIds;

  /// 默认排序规则.
  final List<int> _defaultOrders = TodoSortRule.defaultTodoSortRulesOrderIds;
  final String _activeListBuilderId = UuidUnit.id();
  final String _completedListBuilderId = UuidUnit.id();

  HomeTodoListCtrl({DateTime? selectDate}) {
    _currentDate = selectDate ?? DateTime.now();
  }

  // 当前选择日期
  late DateTime _currentDate;

  // X日已完成事件列表
  late List<TodoVO> _activeTodoList;

  // X日未完成事件列表
  late List<TodoVO> _completedTodoList;

  DateTime get currentDate => _currentDate;

  late TodoRepository _todoRepo;

  int get activeTodoCnt => _activeTodoList.length;

  int get completedTodoCnt => _completedTodoList.length;

  String get completedListBuilderId => _activeListBuilderId;

  String get activeListBuilderId => _completedListBuilderId;

  @override
  List<String>? builderIds() => [_activeListBuilderId, _completedListBuilderId];

  @override
  Future<List<TodoVO>> loadData({int? page, int? pageSize}) {
    // 拉取当前日期的事件
//    return _todoRepo.listTodo(start: _currentDate, end: _currentDate);
    List<TodoVO> todos = [
      TodoVO.fakeTester(),
      TodoVO.fakeTester(),
      TodoVO.fakeTester(),
      TodoVO.fakeTester(),
      TodoVO.fakeTester(),
      TodoVO.fakeTester(),
      TodoVO.fakeTester(),
      TodoVO.fakeTester(),
      TodoVO.fakeTester(),
      TodoVO.fakeTester(),
      TodoVO.fakeTester(),
      TodoVO.fakeTester(),
      TodoVO.fakeTester(),
    ];
    return Future.value(todos);
  }

  @override
  void onRefreshLoadCompleted(List<TodoVO> data) {
    _classifyTodoToListByStatus(data);
  }

  // 根据事件状态分发到不同的列表事件列表中
  void _classifyTodoToListByStatus(List<TodoVO> data) {
    _activeTodoList = data.where((todo) => !todo.completed && isValidTodo(todo)).toList();
    _completedTodoList = data.where((todo) => todo.completed && isValidTodo(todo)).toList();
  }

  // 是否是有效的事件，事件无有效时间时标识为草稿
  bool isValidTodo(TodoVO vo) {
    return vo.validTime != null;
  }

  // 从数据源获取指定日期的事件列表切换内存中的事件列表
  Future<void> switchTodoListByDate(DateTime selectDate) async {
    _currentDate = selectDate;
    List<TodoVO> todoList = await _todoRepo.listTodo(start: _currentDate, end: _currentDate);
    _classifyTodoToListByStatus(todoList);
  }

  // 根据id获取内存中事件的位置
  TodoVO? _findTodoBelongTo(int id) {
    TodoVO activeTodo = _activeTodoList.firstWhere((element) => element.id == id, orElse: () => TodoVO.empty());
    TodoVO completedTodo = _completedTodoList.firstWhere((element) => element.id == id, orElse: () => TodoVO.empty());
    return (activeTodo.id == null && completedTodo.id == null)
        ? null
        : activeTodo.id == null
            ? completedTodo
            : activeTodo;
  }

  // 获取对应事件状态的事件列表
  List<TodoVO> getTodoListByState(TodoState state) {
    List<TodoVO> selectedList = [];
    switch (state) {
      case TodoState.active:
        selectedList.addAll(_activeTodoList);
        break;
      case TodoState.completed:
        selectedList.addAll(_completedTodoList);
        break;
      case TodoState.all:
        selectedList.addAll(_activeTodoList);
        selectedList.addAll(_completedTodoList);
        break;
      default:
        selectedList = [];
        break;
    }
    SortUnit.sortTodo(selectedList, _defaultOrders);
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
    int todoIndex = _activeTodoList.indexWhere((element) => element.id == vo.id);
    if (todoIndex == -1) {
      return false;
    }
    TodoVO newVo = vo.copyWith();
    int subTaskIndex = newVo.subTaskList.indexWhere((element) => element.uuid == subTaskUuid);
    if (subTaskIndex == -1) {
      return false;
    }
    // 更新子事件状态
    SubTaskVO subTask = newVo.subTaskList[subTaskIndex];
    subTask.completed = !subTask.completed;
    subTask.updateTime = DateTime.now();
    newVo.subTaskList[subTaskIndex] = subTask;

    // 检查当前子事件完成是否会影响主事件的完成状态
    int totalCompletedCntOfTodo = newVo.subTaskList.where((element) => element.completed).length;
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

  @override
  void initRes() {
    _activeTodoList = [];
    _completedTodoList = [];

    _todoRepo = TodoRepository();
  }

  @override
  void onStateCtrlInit() {
    super.onStateCtrlInit();
  }

  TodoOperateCallbacks todoOperateCallbacks() {
    return TodoOperateCallbacks(
      // 事件删除回调
      onDelete: (ctx, vo) {
        showToast(S.current.todos_todo_card_widget_toast_text_deleted);
        deleteMainTodo(vo.id!);
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
        toggleMainTodoState(vo.id!);
//        filteredTabBarVM.selectedDateChange(singleTodoListVM.currentDate);
      },
      // 事件取消完成回调
      onCancelCompleted: (ctx, vo) {
        showToast(S.current.todos_todo_card_widget_toast_text_unaccomplished);
        toggleMainTodoState(vo.id!);
//        filteredTabBarVM.selectedDateChange(singleTodoListVM.currentDate);
      },
      // 事件触发子任务状态回调
      onTodoToggleSubTaskCallback: (vo, taskVO) {
        // 是否需要刷新列表：子任务全部完成时刷新列表
        toggleSubTaskState(vo, taskVO.uuid).then((refreshList) {
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
        toggleSubTaskState(vo, clickSubTask.uuid).then((refreshList) {
//          filteredTabBarVM.selectedDateChange(singleTodoListVM.currentDate);
//          thisTodoCardWidget.refreshState();
        });
      },
    );
  }
}
