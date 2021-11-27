import 'package:i_chaos/base_framework/view_model/single_view_state_model.dart';
import 'package:i_chaos/ichaos/public/units/uuid.dart';
import 'package:i_chaos/ichaos/todo/todo-common/enums/todo_sort_rule.dart';
import 'package:i_chaos/ichaos/todo/todo-common/enums/todo_state.dart';
import 'package:i_chaos/ichaos/todo/todo-common/models/subtask.dart';
import 'package:i_chaos/ichaos/todo/todo-common/models/todo_vo.dart';
import 'package:i_chaos/ichaos/todo/todo-common/repository/todo_repository.dart';
import 'package:i_chaos/ichaos/todo/todo-common/units/sort_unit.dart';

/// 事件列表视图模型
class SingleTodoListVM extends SingleViewStateModel<List<TodoVO>> {
  // 排序规则，支持自定义后将排序规则的获取放置到service中
  final List<int> _orders = TodoSortRule.defaultTodoSortRulesOrderIds;
  /// 默认排序规则.
  final List<int> _defaultOrders = TodoSortRule.defaultTodoSortRulesOrderIds;

  SingleTodoListVM({DateTime? selectDate}) {
    _currentDate = selectDate ?? DateTime.now();
    _activeTodoList = [];
    _completedTodoList = [];

    _todoRepo = TodoRepository();
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

  @override
  Future<List<TodoVO>>? loadData() {
//    DateTime now = DateTime.now();
//    List<SubTaskVO> vos = [
//      SubTaskVO.newSubTask(content: 'subtask context1'),
//      SubTaskVO.newSubTask(content: 'subtask context2'),
//      SubTaskVO.newSubTask(content: 'subtask context3'),
//      SubTaskVO.newSubTask(content: 'subtask context4'),
//    ];
//
//    TodoVO vo = TodoVO.newTodo(content: 'new Todo content $now', subTaskList: vos, level: 3);
//    _todoRepo.insertTodo(vo);
    return _todoRepo.listTodo();
  }

  @override
  onCompleted(List<TodoVO> data) {
    _activeTodoList = data.where((todo) => !todo.completed).toList();
    _completedTodoList = data.where((todo) => todo.completed).toList();
  }

  // 根据id获取内存中事件的位置
  TodoVO? _findTodoBelongTo(int id) {
    TodoVO activeTodo = _activeTodoList.lastWhere((element) => element.id == id, orElse: () => TodoVO.emptyReplace());
    TodoVO completedTodo = _completedTodoList.lastWhere((element) => element.id == id, orElse: () => TodoVO.emptyReplace());
    return (activeTodo.id == null && completedTodo.id == null) ? null : activeTodo.id == null ? completedTodo : activeTodo;
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
    SortUnit.sort(selectedList, _defaultOrders);
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
    int affectRow = await _todoRepo.updateTodo(copy);
    if (affectRow > 0) {
      if (vo.completed) {
        _activeTodoList.add(copy);
        _completedTodoList.removeWhere((element) => element.id == id);
      } else {
        _completedTodoList.add(copy);
        _activeTodoList.removeWhere((element) => element.id == id);
      }
      notifyListeners(refreshSelector: true);
    }
  }

  // 更新子事件状态
  void toggleSubTaskState(TodoVO vo, String subTaskUuid) async {
    int todoIndex = _activeTodoList.indexWhere((element) => element.id == vo.id);
    if (todoIndex == -1) {
      return;
    }
    TodoVO newVo = vo.copyWith();
    int subTaskIndex = newVo.subTaskList.indexWhere((element) => element.uuid == subTaskUuid);
    if (subTaskIndex == -1) {
      return;
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
    if (affect > 0) {
      if (completedFlagOfTodo) {
        _completedTodoList.add(newVo);
        _activeTodoList.removeAt(todoIndex);
      } else {
        _activeTodoList[todoIndex] = newVo;
      }
      notifyListeners(refreshSelector: true);
    }
  }

  // 删除事件
  void deleteMainTodo(int id) async {
    TodoVO? vo = _findTodoBelongTo(id);
    if (vo == null) {
      return;
    }

    await _todoRepo.deleteTodoById(vo);
    _activeTodoList.removeWhere((element) => element.id == id);
    notifyListeners();
  }
























}
