
import 'package:flutter/material.dart';
import 'package:i_chaos/base_framework/view_model/single_view_state_model.dart';
import 'package:i_chaos/ichaos/todo/todo-common/models/subtask.dart';

/// 子任务列表视图模型
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

  // 获取最新的子任务列表内容，去除空内容子任务
  List<SubTaskVO> updatedSubTaskList() {
    List<SubTaskVO> vos = [];
    for(int i=0; i< modifiableSubTaskList.length; i++) {
      SubTaskVO vo = modifiableSubTaskList[i];
      String content = subTaskControllerList[i].text;

      if (content.trim() == '') {
        continue;
      }

      if(vo.content.compareTo(content) != 0) {
        vo.content = subTaskControllerList[i].text;
      }
      vos.add(vo);
    }

    return vos;
  }

  // 重置子任务列表
  void resetSubTaskList() {
    init();
    notifyListeners();
  }

  // 操作子任务
  void onTapOfTaskOperate(int index, bool isNewer, TextEditingController controller) {
    if (isNewer) {
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