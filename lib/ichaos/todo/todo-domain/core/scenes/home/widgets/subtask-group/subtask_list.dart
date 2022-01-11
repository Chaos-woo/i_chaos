import 'package:flutter/material.dart';
import 'package:i_chaos/base_framework/widget_state/widget_state.dart';
import 'package:i_chaos/ichaos/todo/todo-domain/core/scenes/home/widgets/subtask-group/subtask_list_vm.dart';
import 'package:i_chaos/icons/ali_icons.dart';

class SubTaskList extends WidgetState {
  // 添加按钮颜色
  final Color addButtonColor;

  // 移除按钮颜色
  final Color removeButtonColor;

  // 单个子任务行行高
  final double rowHeight = 38;

  // 子任务输入框之间的边距
  final double rowPadding = 5;

  final SubTaskListVM _subTaskListVM;

  SubTaskList(this._subTaskListVM, {this.addButtonColor = Colors.teal, this.removeButtonColor = Colors.red});

  @override
  Widget build(BuildContext context) {
    final taskInputList = _subTaskInputList();
    return SizedBox(
        height: rowHeight * taskInputList.length,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: taskInputList,
        ));
  }

  List<Widget> _subTaskInputList() {
    List<Widget> list = [];

    for (int i = 0; i < _subTaskListVM.modifiableSubTaskList.length; i++) {
      list.add(_subTaskInput(index: i, controller: _subTaskListVM.subTaskControllerList[i], isEmpty: false));
    }

    if (_subTaskListVM.modifiableSubTaskList.length < _subTaskListVM.taskLimit) {
      TextEditingController emptyTaskController = TextEditingController();
      list.add(_subTaskInput(index: _subTaskListVM.modifiableSubTaskList.length + 1, controller: emptyTaskController));
    }

    return list;
  }

  // 单个子任务输入栏
  Widget _subTaskInput({required int index, required TextEditingController controller, bool isEmpty = true}) {
    return Container(
      padding: EdgeInsets.only(bottom: rowPadding),
      height: rowHeight,
      child: Row(
        children: <Widget>[
          Container(
            width: rowHeight / 2,
            height: rowHeight,
            alignment: Alignment.center,
            child: const Icon(
              AliIcons.IconTools,
              color: Colors.grey,
            ),
          ),
          const SizedBox(
            width: 5,
          ),
          Expanded(
              child: TextFormField(
            controller: controller,
            obscureText: false,
            minLines: 1,
            maxLines: 1,
            maxLength: 20,
            keyboardType: TextInputType.multiline,
            decoration: InputDecoration(
              counterText: '',
              enabledBorder: OutlineInputBorder(
                borderSide: const BorderSide(
                  color: Color(0x00000000),
                  width: 1,
                ),
                borderRadius: BorderRadius.circular(8),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: const BorderSide(
                  color: Color(0x00000000),
                  width: 1,
                ),
                borderRadius: BorderRadius.circular(8),
              ),
              filled: true,
              fillColor: Colors.white,
              contentPadding: const EdgeInsetsDirectional.fromSTEB(10, 10, 10, 0),
            ),
            style: const TextStyle(
              fontFamily: 'Lexend Deca',
              color: Colors.black,
            ),
          )),
          const SizedBox(
            width: 8,
          ),
          Container(
            width: rowHeight / 2,
            height: rowHeight,
            alignment: Alignment.center,
            child: InkResponse(
              child: isEmpty
                  ? const Icon(
                      Icons.add_circle_outline,
                      color: Colors.teal,
                    )
                  : const Icon(
                      Icons.remove_circle,
                      color: Colors.red,
                    ),
              onTap: () {
                _subTaskListVM.onTapOfTaskOperate(index, isEmpty, controller);
              },
            ),
          )
        ],
      ),
    );
  }
}
