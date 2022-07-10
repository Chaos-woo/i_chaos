import 'package:i_chaos/base-getX-framework/events/event_bus_helper.dart';
import 'package:i_chaos/base-getX-framework/get-x/ctrls/running_state_ctrl.dart';
import 'package:i_chaos/base-getX-framework/get-x/mixin/get_reference_mixin.dart';
import 'package:i_chaos/base-getX-framework/view-model/app-model/locale_ctrl.dart';
import 'package:i_chaos/ichaos/todos-module/todos-domain/todos-common/events/publishers/todos_event_publisher.dart';
import 'package:i_chaos/ichaos/todos-module/todos-domain/todos-common/events/todos_cud_event.dart';
import 'package:i_chaos/ichaos/todos-module/todos-domain/todos-common/models/todo_vo.dart';
import 'package:i_chaos/ichaos/todos-module/todos-domain/todos-common/repository/todo_repository.dart';
import 'package:i_chaos/ichaos/todos-module/todos-domain/todos-pages/todo-edit-page/editor/todo_base_editor.dart';
import 'package:i_chaos/ichaos/todos-module/todos-domain/todos-pages/todo-edit-page/editor/todo_editor.dart';

class TodosEditingCtrl extends RunningStateCtrl {
  final int todoContentLimitCnt = 20; // 内容字数上限
  final int todoRemarkLimitCnt = 50; // 描述内容字数上限
  final int todoLocationLimitCnt = 40; // 地点信息字数上限
  final int numOfLettersPerEnWords = 5; // 单个英文单词字母数平均值

  final TodoRepository _todoRepo = TodoRepository();
  final LocaleCtrl _localeCtrl = GetXReferenceMixin.findRef();
  late TodoEditor editor;

  TodosEditingCtrl(TodoVO todo) {
    editor = TodoEditor.initEditor(todo);
  }

  Future<bool> saveTodo() async {
    bool saveOk = false;
    try {
      for (TodoBaseEditor childEditor in editor.childEditors) {
        childEditor.writeTodoNewAttr();
      }
      TodoVO editedTodo = editor.todo;
      if (editor.todo.isNewer) {
        int id = await _todoRepo.insertTodo(editedTodo);
        editedTodo.id = id;
        fireTodoInsertEvent(editedTodo);
      } else {
        await _todoRepo.updateTodo(editedTodo);
        fireTodoUpdateEvent(editedTodo);
      }
      saveOk = true;
    } catch (e) {
      saveOk = false;
    }
    return saveOk;
  }

  void fireTodoInsertEvent(TodoVO todo) =>
      EventBusHelper().fire(TodosCreateOrDeleteEvent.singleCreate(
        TodosEventPublisher.todoEditor,
        todo,
      ));

  void fireTodoUpdateEvent(TodoVO todo) =>
      EventBusHelper().fire(TodosUpdateEvent(TodosEventPublisher.todoEditor, todo));

  int get maxCharCntOfContent => _localeCtrl.isEnEnv
      ? todoContentLimitCnt * numOfLettersPerEnWords
      : todoContentLimitCnt;

  int get maxCharCntOfRemark => _localeCtrl.isEnEnv
      ? todoRemarkLimitCnt * numOfLettersPerEnWords
      : todoRemarkLimitCnt;

  int get maxCharCntOfLocation => _localeCtrl.isEnEnv
      ? todoLocationLimitCnt * numOfLettersPerEnWords
      : todoLocationLimitCnt;

  @override
  void releaseStateRes() {
    editor.dispose();
  }
}
