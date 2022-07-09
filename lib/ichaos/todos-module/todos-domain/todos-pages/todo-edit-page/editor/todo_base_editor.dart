
import 'package:flutter/material.dart';
import 'package:i_chaos/ichaos/todos-module/todos-domain/todos-pages/todo-edit-page/editor/todo_editor.dart';

abstract class TodoBaseEditor {
  TodoEditor parentEditor;

  void editorAttrInit(); // 基础属性初始化器
  bool attrVerify(); // 内容校验
  String attrVerifyErrorTip() => ''; // 获取内容校验的错误信息
  void writeTodoNewAttr(); // 写入todo新属性
  void releaseRes() => {}; // 资源释放

  @mustCallSuper
  TodoBaseEditor(this.parentEditor) {
    parentEditor.addChildEditor(this);
  }
}