

import 'package:i_chaos/base_framework/view_model/single_view_state_model.dart';
import 'package:i_chaos/ichaos/todo/todo-common/enums/todo_state.dart';
import 'package:i_chaos/ichaos/todo/todo-common/models/todo_vo.dart';
import 'package:i_chaos/ichaos/todo/todo-domain/core/scenes/home/widgets/todolist/single_todo_list_vm.dart';

/// 事件状态切换tabBar视图模型
class FilteredTabBarVM extends SingleViewStateModel {

  final Map<TodoState, String> _tabWords = {
    TodoState.active: '进行中',
    TodoState.completed: '已完成',
    TodoState.all: '全部'
  };

  // tabBar的总个数
  final _totalTabCnt = 2;
  int _currTabIndex = 0;

  late SingleTodoListVM _singleTodoListVM;
  late DateTime _selectDate;

  FilteredTabBarVM({DateTime? selectDate, required SingleTodoListVM singleTodoListVM}) {
    _singleTodoListVM = singleTodoListVM;
    _selectDate = selectDate ?? DateTime.now();
  }

  // tab下标切换
  void tabIndexSwitch(int targetIndex) {
    if (targetIndex < 0 || targetIndex > _totalTabCnt || targetIndex == _currTabIndex) {
      return;
    }
    _currTabIndex = targetIndex;
  }

  // 选择的日期切换
  void selectedDateChange(DateTime selectDate) {
    setBusy(true);
    notifyListeners();
    Future.delayed(const Duration(milliseconds: 100), () {
      _singleTodoListVM.switchTodoListByDate(selectDate).then((_) {
        _selectDate = selectDate;
        setBusy(false);
        notifyListeners();
      });
    });
  }

  // 获取未完成事件数量
  int get activeTodoCnt => _singleTodoListVM.activeTodoCnt;
  // 获取当前选择日期
  DateTime get currentDate => _selectDate;
  // 获取当前tabBar下标
  int get currentTabBarIndex => _currTabIndex;
  // 获取对应状态的标签文案
  String tabWord(TodoState state) {
    return _tabWords[state]!;
  }

  // 获取对应状态的事件列表
  List<TodoVO> get activeTodoList => _singleTodoListVM.getTodoListByState(TodoState.active);
  List<TodoVO> get completedTodoList => _singleTodoListVM.getTodoListByState(TodoState.completed);

  @override
  Future? loadData() {
    return null;
  }

  @override
  onCompleted(data) {
  }

}