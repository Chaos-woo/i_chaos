import 'package:dartx/dartx.dart';
import 'package:i_chaos/ichaos/todos-module/todos-domain/todos-common/models/todo_vo.dart';
import 'package:i_chaos/ichaos/todos-module/todos-domain/todos-pages/todo-edit-page/editor/todo_base_editor.dart';
import 'package:i_chaos/ichaos/todos-module/todos-domain/todos-pages/todo-edit-page/editor/child-editors/todo_content_editor.dart';
import 'package:i_chaos/ichaos/todos-module/todos-domain/todos-pages/todo-edit-page/editor/child-editors/todo_level_editor.dart';
import 'package:i_chaos/ichaos/todos-module/todos-domain/todos-pages/todo-edit-page/editor/child-editors/todo_location_editor.dart';
import 'package:i_chaos/ichaos/todos-module/todos-domain/todos-pages/todo-edit-page/editor/child-editors/todo_remark_editor.dart';
import 'package:i_chaos/ichaos/todos-module/todos-domain/todos-pages/todo-edit-page/editor/child-editors/todo_sub_task_editor.dart';
import 'package:i_chaos/ichaos/todos-module/todos-domain/todos-pages/todo-edit-page/editor/child-editors/todo_valid_date_editor.dart';

class TodoEditor {
  bool initEditorFlag = false; // 表示editor的初始化状态
  bool checkValidationState = true; // 校验状态 true-通过

  late TodoVO todo;

  List<TodoBaseEditor> childEditors = []; // 子编辑器集合

  late TodoContentEditor contentEditor;
  late TodoRemarkEditor remarkEditor;
  late TodoLocationEditor locationEditor;

  late TodoLevelEditor levelEditor;
  late TodoValidDateEditor validDateEditor;
  late TodoSubTaskEditor subTaskEditor;

  TodoEditor.initEditor(this.todo) {
    contentEditor = TodoContentEditor(this);
    remarkEditor = TodoRemarkEditor(this);
    locationEditor = TodoLocationEditor(this);

    levelEditor = TodoLevelEditor(this);
    validDateEditor = TodoValidDateEditor(this);
    subTaskEditor = TodoSubTaskEditor(this);

    _initChildEditors();

    initEditorFlag = true;
  }

  bool attrsCheck() {
    checkValidationState = true;
    List<bool> verifyResults = [];
    for (TodoBaseEditor childEditor in childEditors) {
      verifyResults.add(childEditor.attrVerify());
    }
    checkValidationState = verifyResults.all((e) => e == true);
    return checkValidationState;
  }

  void _initChildEditors() {
    for (TodoBaseEditor childEditor in childEditors) {
      childEditor.editorAttrInit();
    }
  }

  void dispose() {
    for (TodoBaseEditor childEditor in childEditors) {
      childEditor.releaseRes();
    }
  }

  void addChildEditor(TodoBaseEditor editor) => childEditors.add(editor);
}
