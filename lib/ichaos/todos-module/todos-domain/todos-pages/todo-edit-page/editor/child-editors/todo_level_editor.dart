import 'package:i_chaos/ichaos/todos-module/todos-domain/todos-common/enums/todo_level.dart';
import 'package:i_chaos/ichaos/todos-module/todos-domain/todos-pages/todo-edit-page/editor/todo_base_editor.dart';
import 'package:i_chaos/ichaos/todos-module/todos-domain/todos-pages/todo-edit-page/editor/todo_editor.dart';

class TodoLevelEditor extends TodoBaseEditor {
  int level = TodoLevel.newTodoDefaultLevel;
  List<bool> levelBtnsSelected = [];

  TodoLevelEditor(TodoEditor parentEditor) : super(parentEditor);

  @override
  bool attrVerify() {
    return true;
  }

  @override
  void editorAttrInit() {
    if (!parentEditor.todo.isNewer) {
      level = parentEditor.todo.level;
    }

    for (int i = 0; i < TodoLevel.values.length; i++) {
      levelBtnsSelected.add(false);
    }

    // 初始化【紧急程度】当前选择项
    levelBtnsSelected = _updateLevelBtnsSelectedState(level);
  }

  void selectTodoLevel(int selectedLevel) {
    levelBtnsSelected = _updateLevelBtnsSelectedState(selectedLevel);
    level = selectedLevel;
  }

  // 更新【紧急程度】选项被选中的按钮状态
  List<bool> _updateLevelBtnsSelectedState(int selectedLevel) {
    if (selectedLevel >= levelBtnsSelected.length) {
      throw ArgumentError(
          "out of level buttons index, max length is ${levelBtnsSelected.length}, input is $selectedLevel");
    }

    List<bool> tempSelectedState = levelBtnsSelected.map((e) => false).toList();
    for (int i = 0; i < tempSelectedState.length; i++) {
      if (i == selectedLevel) {
        tempSelectedState[i] = true;
      }
    }
    return tempSelectedState;
  }

  @override
  void writeTodoNewAttr() {
    parentEditor.todo.level = level;
  }
}
