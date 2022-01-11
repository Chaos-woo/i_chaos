
import 'package:flutter/material.dart';
import 'package:i_chaos/base_framework/view_model/single_view_state_model.dart';
import 'package:i_chaos/ichaos/todo/todo-common/models/subtask.dart';

class SubTaskListVM extends SingleViewStateModel {
  // 子任务上限
  final int taskLimit;

  // 源任务子列表参数
  final List<SubTaskVO> originalSubTaskList;

  // 可修改的子任务
  late List<SubTaskVO> modifiableSubTaskList;

  // 子任务TextEditController列表
  late List<TextEditingController> subTaskControllerList;

  SubTaskListVM({this.taskLimit = 5, this.originalSubTaskList = const []});

  // 数据初始化
  void init() {
    modifiableSubTaskList = [];
    subTaskControllerList = [];
    if (originalSubTaskList.isNotEmpty) {
      for (SubTaskVO task in originalSubTaskList) {
        modifiableSubTaskList.add(task);
        subTaskControllerList.add(TextEditingController(text: task.content));
      }
    }
  }

  // 重置子任务列表
  void resetSubTaskList() {
    init();
    notifyListeners();
  }

  // 操作子任务
  void onTapOfTaskOperate(int index, bool isEmpty, TextEditingController controller) {
    if (isEmpty) {
      if (controller.text.isEmpty || controller.text.trim() == '') {
        return;
      }
      SubTaskVO vo = SubTaskVO.newSubTask(content: controller.text, createTime: DateTime.now());
      modifiableSubTaskList.add(vo);
      subTaskControllerList.add(controller);
    } else {
      modifiableSubTaskList.removeAt(index);
      subTaskControllerList.removeAt(index);
    }
    notifyListeners();
  }

  @override
  Future? loadData() {
  }

  @override
  onCompleted(data) {
  }

  @override
  void dispose() {
    if (subTaskControllerList.isNotEmpty) {
      for (TextEditingController c in subTaskControllerList) {
        c.dispose();
      }
    }
    super.dispose();
  }

}