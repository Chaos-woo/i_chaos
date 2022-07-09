
import 'package:flutter/material.dart';
import 'package:i_chaos/generated/l10n.dart';
import 'package:i_chaos/ichaos/todos-module/todos-domain/todos-pages/todo-edit-page/editor/todo_base_editor.dart';
import 'package:i_chaos/ichaos/todos-module/todos-domain/todos-pages/todo-edit-page/editor/todo_editor.dart';
import 'package:dartx/dartx.dart';

class TodoContentEditor extends TodoBaseEditor {
  late TextEditingController controller;

  TodoContentEditor(TodoEditor parentEditor) : super(parentEditor);

  @override
  bool attrVerify() {
    return controller.value.text.isNotBlank;
  }

  String? submit() => controller.value.text;

  @override
  void editorAttrInit() {
    controller = TextEditingController(text: parentEditor.todo.content);
  }

  @override
  String attrVerifyErrorTip() => parentEditor.checkValidationState ? '' : S.current.todos_edit_page_error_tip_content;

  @override
  void releaseRes() {
    controller.dispose();
  }

  @override
  void writeTodoNewAttr() {
    parentEditor.todo.content = controller.text;
  }

}