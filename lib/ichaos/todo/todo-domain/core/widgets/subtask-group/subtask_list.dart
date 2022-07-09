// ignore_for_file: prefer_initializing_formals, must_be_immutable

import 'package:flutter/material.dart';
import 'package:i_chaos/base-getX-framework/flutter3-pak-process/widget-chain/widget_chain.dart';
import 'package:i_chaos/base_framework/widget_state/widget_state.dart';
import 'package:i_chaos/ichaos/todo/todo-domain/core/widgets/subtask-group/subtask_list_vm.dart';
import 'package:i_chaos/icons/ali_icons.dart';

class WidgetSubTaskList extends WidgetState {
  // 添加按钮颜色
  final Color addButtonColor;
  // 移除按钮颜色
  final Color removeButtonColor;
  // 单个子任务行行高
  final double rowHeight = 38;
  final SubTaskListVM _subTaskListVM;

  WidgetSubTaskList(this._subTaskListVM, {this.addButtonColor = Colors.teal, this.removeButtonColor = Colors.red});

  @override
  Widget build(BuildContext context) {
    final taskList = _subTaskWriterList();
    return taskList.intoColumn(mainAxisAlignment: MainAxisAlignment.start).intoSizedBox(
          height: rowHeight * taskList.length,
        );
  }

  List<Widget> _subTaskWriterList() {
    List<Widget> list = [];

    // 将已有的子任务展示
    for (int i = 0; i < _subTaskListVM.modifiableSubTaskList.length; i++) {
      list.add(
        WidgetSingleSubTaskWriter(
          i,
          _subTaskListVM.subTaskControllerList[i],
          false,
          rowHeight,
          subTaskListVM: _subTaskListVM,
          key: UniqueKey(),
        ),
      );
    }

    // 若还未到子任务上线，则新增一个空白的可填写子任务
    if (_subTaskListVM.modifiableSubTaskList.length < _subTaskListVM.taskLimit) {
      TextEditingController emptyTaskController = TextEditingController();
      list.add(
        WidgetSingleSubTaskWriter(
          _subTaskListVM.modifiableSubTaskList.length + 1,
          emptyTaskController,
          true,
          rowHeight,
          subTaskListVM: _subTaskListVM,
          key: UniqueKey(),
        ),
      );
    }

    return list;
  }
}

class WidgetSingleSubTaskWriter extends StatelessWidget {
  final int index;
  final TextEditingController controller;
  final bool isNewer;
  final double rowHeight;
  final double rowPadding = 5;
  late SubTaskListVM subTaskListVM;

  WidgetSingleSubTaskWriter(
    this.index,
    this.controller,
    this.isNewer,
    this.rowHeight, {
    Key? key,
    required SubTaskListVM subTaskListVM,
  }) : super(key: key) {
    this.subTaskListVM = subTaskListVM;
  }

  @override
  Widget build(BuildContext context) {
    final List<Widget> icon = const Icon(AliIcons.IconTools, color: Colors.grey)
        .intoContainer(width: rowHeight / 2, height: rowHeight, alignment: Alignment.center)
        .addNeighbor(5.hGap);

    final Widget form = Expanded(
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
    ));

    final List<Widget> button = (8.hGap).addNeighbor(InkResponse(
      child: isNewer
          ? const Icon(
              Icons.add_circle_outline,
              color: Colors.teal,
            )
          : const Icon(
              Icons.remove_circle,
              color: Colors.red,
            ),
      onTap: () {
        subTaskListVM.onTapOfTaskOperate(index, isNewer, controller);
      },
    ).intoContainer(
      width: rowHeight / 2,
      height: rowHeight,
      alignment: Alignment.center,
    ));

    return Row(
      children: icon
        ..add(form)
        ..addAll(button),
    ).intoContainer(
      padding: EdgeInsets.only(bottom: rowPadding),
      height: rowHeight,
    );
  }
}
