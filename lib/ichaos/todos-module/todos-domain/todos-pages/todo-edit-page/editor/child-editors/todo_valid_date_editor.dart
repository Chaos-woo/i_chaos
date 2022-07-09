import 'package:i_chaos/ichaos/common-module/extensions/date_time_extension.dart';
import 'package:i_chaos/ichaos/todos-module/todos-domain/todos-pages/todo-edit-page/editor/todo_base_editor.dart';
import 'package:i_chaos/ichaos/todos-module/todos-domain/todos-pages/todo-edit-page/editor/todo_editor.dart';

class TodoValidDateEditor extends TodoBaseEditor {
  static const int todayBtnIndex = 0;
  static const int tomorrowBtnIndex = 1;
  static const int pointDateBtnIndex = 2;
  static const int draftBtnIndex = 3;

  DateTime? validDate; // 所处日期，null标识为草稿
  List<bool> validDateBtnsSelected = [];
  int selectedTypeIndex = 0; // 默认为今天

  TodoValidDateEditor(TodoEditor parentEditor) : super(parentEditor);

  @override
  bool attrVerify() {
    return true;
  }

  @override
  void editorAttrInit() {
    final todo = parentEditor.todo;
    validDate = todo.isNewer ? DateTime.now() : todo.validTime;
    selectedTypeIndex = _date2SelectedBtnIndex();
    for (int i = 0; i < 4; i++) {
      validDateBtnsSelected.add(false);
    }
    // 初始化【日期】当前选择项
    validDateBtnsSelected = _updateValidDateBtnsSelectedState(selectedTypeIndex);
  }

  bool get isSelectDateBtnIndex => selectedTypeIndex == pointDateBtnIndex;

  int _date2SelectedBtnIndex() {
    if (null == validDate) {
      selectedTypeIndex = draftBtnIndex;
    } else if (validDate!.isToday()) {
      selectedTypeIndex = todayBtnIndex;
    } else if (validDate!.isSameDay(DayDateUtil.tomorrow())) {
      selectedTypeIndex = tomorrowBtnIndex;
    } else {
      selectedTypeIndex = pointDateBtnIndex;
    }
    return selectedTypeIndex;
  }

  void selectTodoValidDate(DateTime? selectedDate) {
    validDate = selectedDate;
    selectedTypeIndex = _date2SelectedBtnIndex();
    validDateBtnsSelected = _updateValidDateBtnsSelectedState(selectedTypeIndex);
  }

  // 更新【日期】选项被选中的按钮状态
  List<bool> _updateValidDateBtnsSelectedState(int selectedDateType) {
    if (selectedDateType >= validDateBtnsSelected.length) {
      throw ArgumentError(
          "out of valid date buttons index, max length is ${validDateBtnsSelected.length}, input is $selectedDateType");
    }

    List<bool> tempSelectedState = validDateBtnsSelected.map((e) => false).toList();
    for (int i = 0; i < tempSelectedState.length; i++) {
      if (i == selectedDateType) {
        tempSelectedState[i] = true;
      }
    }
    return tempSelectedState;
  }

  @override
  void writeTodoNewAttr() {
    parentEditor.todo.validTime = validDate;
  }
}
