// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:getwidget/colors/gf_color.dart';
import 'package:i_chaos/base-getX-framework/view/base_controller_view.dart';
import 'package:i_chaos/base-getX-framework/view/widget/widget_controller_view.dart';
import 'package:i_chaos/generated/l10n.dart';
import 'package:i_chaos/ichaos/common-module/common-widgets/mini_checkbox_list_title.dart';
import 'package:i_chaos/ichaos/common-module/extensions/date_time_extension.dart';
import 'package:i_chaos/ichaos/todos-module/todos-domain/todos-common/enums/todo_level.dart';
import 'package:i_chaos/ichaos/todos-module/todos-domain/todos-common/models/subtask.dart';
import 'package:i_chaos/ichaos/todos-module/todos-domain/todos-common/models/todo_vo.dart';
import 'package:i_chaos/ichaos/todos-module/todos-domain/todos-widgets/todo-card/home-card/home_todo_card_ctrl.dart';
import 'package:i_chaos/ichaos/todos-module/todos-domain/todos-widgets/todo-card/todo_operate_callback.dart';
import 'package:noripple_overscroll/noripple_overscroll.dart';

// 首页todo事件组件
class HomeTodoCardWidget extends WidgetControllerView<HomeTodoCardCtrl> {
  final TodoVO _vo;
  final TodoOperateCallbacks _callbacks;
  late HomeTodoCardCtrl _todoCardCtrl;

  HomeTodoCardWidget(this._vo, this._callbacks, {Key? key}) : super(key: key);

  @override
  void initViewRes() {
    HomeTodoCardCtrl ctrl = HomeTodoCardCtrl(_vo, callbacks: _callbacks);
    _todoCardCtrl = putDependency<HomeTodoCardCtrl>(ctrl, tag: ctrl.todoBuilderTag);
  }

  @override
  String? get tag => _todoCardCtrl.todoBuilderTag;

  @override
  ViewWidgetBuilder viewWidgetBuilder(BuildContext context, HomeTodoCardCtrl controller) {
    return ViewWidgetBuilder(
      viewBuilder: <HomeTodoCardCtrl>(ctrl) {
        return InkWell(
          onTap: () {},
          onLongPress: () {},
          child: _todoCard(),
        );
      },
      builderId: _todoCardCtrl.todoBuilderTag,
      ctrlTag: _todoCardCtrl.todoBuilderTag,
    );
  }

  Widget _todoCard() {
    final cardColumn = Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      // 卡片列信息
      children: _cardColumn(),
    );

    final List<BoxShadow> promptColorBoxShadow = _todoCardCtrl.todo.isColorPrompt
        ? [
            BoxShadow(
              color: TodoLevel.coded(_todoCardCtrl.todo.level).color,
              offset: const Offset(0.0, -4.0),
              blurRadius: 0,
              spreadRadius: 0,
            )
          ]
        : [];

    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: Theme.of(crrContext).dialogBackgroundColor,
        border: Border.all(width: 1, color: const Color(0xFFEEEEEE)),
        borderRadius: const BorderRadius.all(Radius.circular(8)),
        boxShadow: promptColorBoxShadow,
      ),
      child: cardColumn,
    );
  }

  // 卡片列信息
  List<Widget> _cardColumn() {
    List<Widget> baseNode = (_todoCardCtrl.todo.isPromptLocation || _todoCardCtrl.todo.isPromptDate) ? _promptInfoRow() : [];
    baseNode.add(_mainContentRow());
    if (_todoCardCtrl.todo.isRemarkInfo) {
      baseNode.add(_remarkInfoRow());
    }
    if (_todoCardCtrl.todo.isSubTaskInfo) {
      baseNode.add(_subTaskInfoRow());
    }

    return baseNode;
  }

  Widget _remarkInfoRow() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
      child: Text(
        _todoCardCtrl.todo.remark!,
        style: _todoCardCtrl.baseTodoCardTextStyle.merge(
          const TextStyle(color: Color(0xFF8B97A2), fontWeight: FontWeight.normal),
        ),
        softWrap: true,
        maxLines: 2,
        overflow: TextOverflow.ellipsis,
      ),
    );
  }

  Widget _mainContentRow() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
      child: Padding(
          padding: const EdgeInsets.only(top: 4),
          child: Text(
            _todoCardCtrl.todo.content,
            style: _todoCardCtrl.baseTodoCardTextStyle.merge(const TextStyle(fontSize: 18)),
            softWrap: true,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          )),
    );
  }

  List<Widget> _promptInfoRow() {
    List<Widget> baseNode = [];
    if (_todoCardCtrl.todo.isPromptDate) {
      baseNode.add(const Padding(
        padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 4),
        child: Icon(
          Icons.schedule,
          color: Colors.teal,
          size: 20,
        ),
      ));
      baseNode.add(Padding(
        padding: const EdgeInsetsDirectional.fromSTEB(4, 0, 0, 0),
        child: Text(
          _todoCardCtrl.todo.needPromptTime!.HHmm,
          style: _todoCardCtrl.baseTodoCardTextStyle.merge(const TextStyle(color: Color(0xFF8B97A2))),
        ),
      ));
    }

    if (_todoCardCtrl.todo.isPromptLocation) {
      baseNode.add(
        const Padding(
          padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 4),
          child: Icon(
            Icons.location_on_sharp,
            color: Colors.teal,
            size: 20,
          ),
        ),
      );
      baseNode.add(Padding(
        padding: const EdgeInsetsDirectional.fromSTEB(4, 0, 0, 4),
        child: Text(
          _todoCardCtrl.todo.location!,
          style: _todoCardCtrl.baseTodoCardTextStyle.merge(const TextStyle(color: Color(0xFF8B97A2))),
        ),
      ));
    }

    return <Widget>[
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          children: baseNode,
        ),
      ),
      Center(
        child: Container(
          width: screenWidth * 0.85,
          height: 1,
          decoration: const BoxDecoration(
            color: Color(0xFFDBE2E7),
          ),
        ),
      ),
    ];
  }

  // 子任务区域.
  Widget _subTaskInfoRow() {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8),
      padding: const EdgeInsets.only(left: 20, right: 8),

      /// 去除ListView的边界水波纹效果
      child: NoRippleOverScroll(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: _getComplexSubTaskList(),
        ),
      ),
    );
  }

  // 根据事件状态及子任务数量来展示子任务为展开全部或部分子任务，获得较好的体验效果
  List<Widget> _getComplexSubTaskList() {
    List<Widget> taskWidgets = [];
    final List<SubTaskVO> subTaskList = _todoCardCtrl.todo.subTaskList;

    // 展开/关闭功能按键
    if (subTaskList.length > _todoCardCtrl.expandSubListTotal) {
      taskWidgets.add(
        InkWell(
          onTap: _todoCardCtrl.switchSubListExpand,
          child: Container(
            margin: const EdgeInsets.only(bottom: 5),
            height: 20,
            decoration: BoxDecoration(
                color: Get.isDarkMode ? Colors.grey[800] : const Color(0xFFE0E0E0),
                borderRadius: const BorderRadius.all(
                  Radius.circular(10),
                )),
            child: _expandedBtn(),
          ),
        ),
      );
    }

    if (_todoCardCtrl.canExpandSubList) {
      taskWidgets.add(
        _neverScrollableSubTaskList(subTaskList.length, (context, index) {
          final task = subTaskList[index];

          // 事件完成时其下的子任务全部展示为完成状态
          return _todoCardCtrl.todo.completed
              ? _okSubTask(task.content)
              : _tapableSubTask(
                  task,
                  () => _todoCardCtrl.onTodoToggleSubTask(task),
                );
        }),
      );
    } else {
      if (_todoCardCtrl.todo.completed && subTaskList.length <= _todoCardCtrl.expandSubListTotal) {
        // 事件完成状态 & 子任务数量小于上限
        taskWidgets.add(
          _neverScrollableSubTaskList(subTaskList.length, (context, index) {
            return _okSubTask(subTaskList[index].content);
          }),
        );
      } else if (!_todoCardCtrl.todo.completed && subTaskList.length <= _todoCardCtrl.expandSubListTotal) {
        // 事件未完成状态 & 子任务数量小于上限
        taskWidgets.add(
          _neverScrollableSubTaskList(subTaskList.length, (context, index) {
            final task = subTaskList[index];
            return _tapableSubTask(task, () => _todoCardCtrl.onTodoToggleSubTask(task));
          }),
        );
      } else if (!_todoCardCtrl.todo.completed && subTaskList.length > _todoCardCtrl.expandSubListTotal) {
        // 事件未完成状态 & 子任务数量大于上限
        List<SubTaskVO> activeSubTasks = subTaskList.where((task) => !task.completed).toList();

        taskWidgets.add(
          _neverScrollableSubTaskList(activeSubTasks.length, (context, index) {
            final task = activeSubTasks[index];
            return _tapableSubTask(task, () => _todoCardCtrl.onTodoToggleSubTask(task));
          }),
        );
      }
    }

    return taskWidgets;
  }

  Widget _okSubTask(String content) {
    return MiniCheckboxListTitle(
      title: content,
      isChecked: true,
      activeIcon: const Icon(
        Icons.brightness_1,
        size: 10,
        color: GFColors.SUCCESS,
      ),
      activeBgColor: GFColors.WHITE,
      onTap: (val) {},
    );
  }

  Widget _tapableSubTask(SubTaskVO task, VoidCallback callback) {
    return MiniCheckboxListTitle(
      title: task.content,
      isChecked: task.completed,
      onTap: (val) async => zeroDelay(callback),
    );
  }

  Widget _neverScrollableSubTaskList(int itemCount, IndexedWidgetBuilder itemBuilder) {
    return ListView.builder(
      physics: const NeverScrollableScrollPhysics(),
      itemCount: itemCount,
      shrinkWrap: true,
      padding: const EdgeInsets.all(0),
      itemBuilder: itemBuilder,
    );
  }

  Widget _expandedIcon(IconData icon) {
    return Icon(
      icon,
      color: Colors.white,
      size: 16,
    );
  }

  Widget _expandedBtn() {
    String text = _todoCardCtrl.canExpandSubList
        ? S.current.todos_todo_card_widget_btn_subtask_retract
        : _todoCardCtrl.todo.completed
            ? '${_todoCardCtrl.todo.subTaskList.length}/${_todoCardCtrl.todo.subTaskList.length}'
            : '${_todoCardCtrl.todo.subTaskList.where((e) => e.completed).length}/${_todoCardCtrl.todo.subTaskList.length}';

    List<Widget> iconTexts = [
      _todoCardCtrl.canExpandSubList ? _expandedIcon(Icons.arrow_drop_up) : _expandedIcon(Icons.arrow_drop_down),
      Text(text, style: const TextStyle(color: Colors.white, fontSize: 14)),
    ];

    return Container(
      margin: EdgeInsets.symmetric(horizontal: _todoCardCtrl.canExpandSubList ? 0 : 3),
      width: variableTextWidthAdapt([text], 14),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: iconTexts,
      ),
    );
  }
}
