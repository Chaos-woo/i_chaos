import 'package:flutter/material.dart';
import 'package:i_chaos/base_framework/view_model/single_view_state_model.dart';
import 'package:i_chaos/ichaos/public/widgets/button-group/radio_button_group.dart';
import 'package:i_chaos/ichaos/todo/todo-common/enums/todo_level.dart';
import 'package:i_chaos/ichaos/todo/todo-common/models/todo_vo.dart';
import 'package:i_chaos/ichaos/todo/todo-common/repository/todo_repository.dart';
import 'package:i_chaos/ichaos/todo/todo-domain/core/scenes/details/todo_detail_form.dart';
import 'package:i_chaos/ichaos/public/extension/date_time_extension.dart';
import 'package:i_chaos/ichaos/todo/todo-domain/core/scenes/home/widgets/subtask-group/subtask_list_vm.dart';

/// 单事件模型
class SingleTodoVM extends SingleViewStateModel<TodoVO> {
  final String appBarTitleOfEdit = '编辑';
  final String appBarTitleOfAdd = '新增';

  final List<String> selectDateBtnGroupLabels = [
    TodoFormBO.todayBtnText,
    TodoFormBO.tomorrowBtnText,
    TodoFormBO.chooseDateBtnText,
    TodoFormBO.noDateBtnText
  ];

  final List<String> levelBtnGroupLabels = [
    TodoLevel.deferrable.title,
    TodoLevel.unimportant.title,
    TodoLevel.normal.title,
    TodoLevel.important.title,
    TodoLevel.urgent.title,
  ];

  final List<Color> levelCustomBtnGroupColor = [
    TodoLevel.deferrable.color,
    TodoLevel.unimportant.color,
    TodoLevel.normal.color,
    TodoLevel.important.color,
    TodoLevel.urgent.color,
  ];

  late TodoVO _todoCopy;
  late bool _isNew;

  // 事件表单对象
  late TodoFormBO _todoFormBO;

  // 事件数据仓库操作对象
  late TodoRepository _todoRepo;

  // TextEditController
  late TextEditingController contentController;
  late TextEditingController descController;
  late TextEditingController locationController;

  late GlobalKey<RadioButtonGroupState> todoLevelBtnGroupKey = GlobalKey();
  late GlobalKey<RadioButtonGroupState> todoDateBtnGroupKey = GlobalKey();
  late SubTaskListVM subTaskListVM;

  // 标记'保存'按钮是否可用
  late bool saveBtnAvailable;

  SingleTodoVM(TodoVO vo) {
    initRes(vo);
  }

  bool get isNew => _isNew;

  TodoFormBO get todoForm => _todoFormBO;

  // 初始化资源
  void initRes(TodoVO originalTodo) {
    _todoCopy = originalTodo.copyWith();
    _isNew = _todoCopy.id == null;

    if (_isNew) {
      _todoCopy.content = '';
      _todoCopy.validTime = DateTime.now();
    }

    _todoFormBO = TodoFormBO.fromTodo(_todoCopy);
    _todoRepo = TodoRepository();

    if (_saveBtnAvailable(_todoFormBO.content)) {
      saveBtnAvailable = true;
    } else {
      saveBtnAvailable = false;
    }

    contentController = TextEditingController(text: _todoFormBO.content);
    descController = TextEditingController(text: _todoFormBO.remark);
    locationController = TextEditingController(text: _todoFormBO.location);

    // 添加内容值监听
    contentController.addListener(_onContentFieldChanged);

    subTaskListVM = SubTaskListVM(originalSubTaskList: _todoFormBO.subTaskVOs);
  }

  bool _saveBtnAvailable(String content) {
    return content.isNotEmpty && content.trim() != '';
  }

  // 监听内容表单字段更改
  void _onContentFieldChanged() {
    // 内容字段的值为空时'保存'按钮可用
    saveBtnAvailable = _saveBtnAvailable(contentController.text);
    notifyListeners(refreshSelector: true);
  }

  // 事件保存
  Future<bool> save() async {
    // 校验失败时保持当前页面并弹框提示
    if (!_fieldCheck()) return Future.value(false);

    int res;
    if (_isNew) {
      res = await _todoRepo.insertTodo(_todoFormBO.newValidTodo());
    } else {
      res = await _todoRepo.updateTodo(_todoFormBO.copyWithTodo(_todoCopy));
    }
    print('$res');
    // 校验成功时弹框提示并退出当前页面
    return Future.value(true);
  }

  // 表单字段校验
  bool _fieldCheck() {
    _todoFormBO.content = contentController.text;
    _todoFormBO.remark = descController.text;
    _todoFormBO.location = locationController.text;

    _todoFormBO.level = TodoLevel.coded(todoLevelBtnGroupKey.currentState!.currentIndex).code;
    _todoFormBO.subTaskVOs = subTaskListVM.updatedSubTaskList();
    return _todoFormBO.check();
  }

  // 重置到进入页面时的状态
  void reset(TodoVO originalTodo) {
    _todoCopy = originalTodo.copyWith();
    if (_isNew) {
      _todoCopy.content = '';
    }
    _todoFormBO = TodoFormBO.fromTodo(_todoCopy);
    contentController = TextEditingController(text: _todoFormBO.content);
    descController = TextEditingController(text: _todoFormBO.remark);
    locationController = TextEditingController(text: _todoFormBO.location);

    DateTime? todoValidDate = _todoFormBO.selectedDate;
    int selectDateBtnIndex = todoValidDate == null
        ? 3
        : DateTime.now().isSameDay(todoValidDate)
            ? 0
            : DayDateUtil.tomorrow().isSameDay(todoValidDate)
                ? 1
                : 2;

    todoLevelBtnGroupKey.currentState?.reloadIndex(_todoFormBO.level);
    todoDateBtnGroupKey.currentState?.reloadIndex(selectDateBtnIndex);
    subTaskListVM.resetSubTaskList();

    // 重新注册内容值监听
    contentController.addListener(_onContentFieldChanged);

    notifyListeners();
  }

  // 表单字段样式
  TextStyle formFieldSimpleTextStyle(Color color) {
    return TextStyle(
      fontFamily: 'Lexend Deca',
      color: color,
    );
  }

  // 根据事件的有效时间放回日期按钮组当前应展示的下标
  int getSelectDateIndex() {
    DateTime? validDate = _todoFormBO.selectedDate;
    if (validDate == null) {
      return selectDateBtnGroupLabels.indexOf(TodoFormBO.noDateBtnText);
    }

    if (DateTime.now().isSameDay(validDate)) {
      return selectDateBtnGroupLabels.indexOf(TodoFormBO.todayBtnText);
    } else if (DayDateUtil.tomorrow().isSameDay(validDate)) {
      return selectDateBtnGroupLabels.indexOf(TodoFormBO.tomorrowBtnText);
    } else {
      return selectDateBtnGroupLabels.indexOf(TodoFormBO.chooseDateBtnText);
    }
  }

  // 释放资源
  void _disposeRes() {
    contentController.dispose();
    descController.dispose();
    locationController.dispose();
  }

  @override
  void dispose() {
    _disposeRes();
    super.dispose();
  }

  @override
  Future<TodoVO>? loadData() {}

  @override
  onCompleted(TodoVO data) {}
}
