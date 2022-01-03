import 'package:flutter/material.dart';
import 'package:i_chaos/base_framework/view_model/single_view_state_model.dart';
import 'package:i_chaos/ichaos/todo/todo-common/models/todo_vo.dart';
import 'package:i_chaos/ichaos/todo/todo-common/repository/todo_repository.dart';
import 'package:i_chaos/ichaos/todo/todo-domain/core/scenes/details/todo_detail_form.dart';

/// 单事件模型
class SingleTodoVM extends SingleViewStateModel<TodoVO> {
  final String appBarTitleOfEdit = '编辑';
  final String appBarTitleOfAdd = '新增';

  late TodoVO _todoCopy;
  late bool _isNew;
  // 事件表单对象
  late TodoDetailFormVO _todoFormVO;
  // 事件数据仓库操作对象
  late TodoRepository _todoRepo;

  // TextEditController
  late TextEditingController contentController;
  late TextEditingController descController;
  late TextEditingController locationController;

  // 标记'保存'按钮是否可用
  bool btnDisable = true;

  SingleTodoVM(TodoVO vo) {
    initRes(vo);
  }

  bool get isNew => _isNew;

  TodoDetailFormVO get detailForm => _todoFormVO;

  // 初始化资源
  void initRes(TodoVO originalTodo) {
    _todoCopy = originalTodo.copyWith();
    _isNew = _todoCopy.id == null;

    if (_isNew) {
      _todoCopy.content = '';
    }

    _todoFormVO = TodoDetailFormVO.fromTodo(_todoCopy);
    _todoRepo = TodoRepository();

    if (_todoFormVO.content.isEmpty) {
      btnDisable = true;
    } else {
      btnDisable = false;
    }

    contentController = TextEditingController(text: _todoFormVO.content);
    descController = TextEditingController(text: _todoFormVO.remark);
    locationController = TextEditingController(text: _todoFormVO.location);

    // 添加内容值监听
    contentController.addListener(_onContentFieldChanged);
  }

  // 监听内容表单字段更改
  void _onContentFieldChanged() {
    if (contentController.text.isNotEmpty) {
      // 内容字段的值不为空时'保存'按钮可用
      btnDisable = false;
      notifyListeners(refreshSelector: true);
    }
  }

  // 事件保存
  bool save() {
    // 校验失败时保持当前页面并弹框提示
    if (!_fieldCheck()) return false;


    if (_isNew) {
      _todoRepo.insertTodo(TodoVO.emptyReplace());
    } else {
      _todoRepo.updateTodo(TodoVO.emptyReplace());
    }

    // 校验成功时弹框提示并退出当前页面
    return true;
  }

  // 表单字段校验
  bool _fieldCheck() {
    return false;
  }

  // 表单字段样式
  TextStyle formFieldSimpleTextStyle(Color color) {
    return TextStyle(
      fontFamily: 'Lexend Deca',
      color: color,
    );
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
  Future<TodoVO>? loadData() {
  }

  @override
  onCompleted(TodoVO data) {
  }

}