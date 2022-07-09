import 'package:dartx/dartx.dart';
import 'package:flustars/flustars.dart';
import 'package:flutter/material.dart';
import 'package:i_chaos/ichaos/todos-module/todos-domain/todos-common/models/subtask.dart';
import 'package:i_chaos/ichaos/todos-module/todos-domain/todos-common/todos-settings/todos_settings_keys.dart';
import 'package:i_chaos/ichaos/todos-module/todos-domain/todos-pages/todo-edit-page/editor/todo_base_editor.dart';
import 'package:i_chaos/ichaos/todos-module/todos-domain/todos-pages/todo-edit-page/editor/todo_editor.dart';

class TodoSubTaskEditor extends TodoBaseEditor {
  static const int defaultMaxSubTaskCnt = 6; // 默认最大子任务数量
  int maxSubTaskCnt = 0; // 最大子任务数量

  Map<String, SubTaskVO> originalSubTasks = {};
  List<SubTaskTempController> addedWrapperSubTasks = []; // 真实保存的子任务包装
  List<SubTaskTempController> workingWrapperSubTasks = []; // 新任务暂存区，只有一个
  List<SubTaskTempController> deletedWrapperSubTasks =
      []; // 待删除区域，textEditingController等到releaseRes时统一处理

  TodoSubTaskEditor(TodoEditor parentEditor) : super(parentEditor);

  bool get reachUpperLimit => addedWrapperSubTasks.length >= maxSubTaskCnt;

  bool get needAddEmptyTask => !reachUpperLimit && workingWrapperSubTasks.isEmpty;

  @override
  bool attrVerify() => true;

  @override
  void editorAttrInit() {
    // 处理最大子任务数量
    int? maxSubTaskCntCache = SpUtil.getInt(TodoSettingKeys.kSubTaskMaxLimit);
    bool needInitMaxSubTaskCnt = maxSubTaskCntCache == null || maxSubTaskCntCache == 0;
    maxSubTaskCnt = needInitMaxSubTaskCnt ? defaultMaxSubTaskCnt : maxSubTaskCntCache;
    if (needInitMaxSubTaskCnt) {
      SpUtil.putInt(TodoSettingKeys.kSubTaskMaxLimit, defaultMaxSubTaskCnt);
    }

    List<SubTaskVO> subTasks = parentEditor.todo.subTaskList;
    if (subTasks.isNotEmpty) {
      for (SubTaskVO task in subTasks) {
        TextEditingController controller = TextEditingController(text: task.content);
        SubTaskTempController temp = SubTaskTempController(task, controller);
        addedWrapperSubTasks.add(temp);

        originalSubTasks[task.uuid] = task;
      }
    }
  }

  @override
  void releaseRes() {
    for (SubTaskTempController temp in addedWrapperSubTasks) {
      temp.controller.dispose();
    }
    for (SubTaskTempController temp in workingWrapperSubTasks) {
      temp.controller.dispose();
    }
    for (SubTaskTempController temp in deletedWrapperSubTasks) {
      temp.controller.dispose();
    }
  }

  List<SubTaskVO> convertSubTask2Db() {
    List<SubTaskVO> tasks = [];
    if (addedWrapperSubTasks.isEmpty) {
      return tasks;
    }

    DateTime modifyTime = DateTime.now();
    for (SubTaskTempController task in addedWrapperSubTasks) {
      SubTaskVO? editedOrNewTask = originalSubTasks[task.task.uuid];
      if (null == editedOrNewTask) {
        editedOrNewTask = task.task;
        editedOrNewTask.content = task.controller.value.text;
      } else {
        editedOrNewTask.content = task.controller.value.text;
        editedOrNewTask.updateTime = modifyTime;
      }

      if (editedOrNewTask.content.isNotNullOrBlank) {
        tasks.add(editedOrNewTask);
      }
    }

    return tasks;
  }

  void addTask() {
    addedWrapperSubTasks.add(workingWrapperSubTasks[0]);
    workingWrapperSubTasks.clear();
  }

  void removeTask(String taskUuid) {
    int index = -1;
    SubTaskTempController? task;
    for (int i = 0; i < addedWrapperSubTasks.length; i++) {
      task = addedWrapperSubTasks[i];
      if (task.task.uuid == taskUuid) {
        index = i;
        break;
      }
    }

    if (index != -1) {
      addedWrapperSubTasks.removeAt(index);
      deletedWrapperSubTasks.add(task!);
    }
  }

  SubTaskTempController getEmptyTask() {
    SubTaskTempController temp;
    if (workingWrapperSubTasks.isNotEmpty) {
      // 工作区已存在时使用工作区创建的空任务，并清除多余的空任务
      temp = workingWrapperSubTasks[0];
      processTooMuchWorkingTasks(needRemainder: 1);
    } else {
      TextEditingController controller = TextEditingController(text: '');
      SubTaskVO task =
          SubTaskVO.newSubTask(content: controller.text, createTime: DateTime.now());
      temp = SubTaskTempController(task, controller);
      workingWrapperSubTasks.add(temp);
    }
    return temp;
  }

  void processTooMuchWorkingTasks({int needRemainder = 0}) {
    if (needRemainder == 0) {
      deletedWrapperSubTasks.addAll(workingWrapperSubTasks);
      workingWrapperSubTasks.clear();
    } else {
      for (int i = 0; i < workingWrapperSubTasks.length; i++) {
        if (i < needRemainder) {
          continue;
        } else {
          deletedWrapperSubTasks.add(workingWrapperSubTasks[i]);
          workingWrapperSubTasks.removeAt(i);
        }
      }
    }
  }

  @override
  void writeTodoNewAttr() {
    parentEditor.todo.subTaskList = convertSubTask2Db();
  }
}

class SubTaskTempController {
  final SubTaskVO task;
  final TextEditingController controller;

  SubTaskTempController(this.task, this.controller);
}
