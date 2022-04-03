//// ignore_for_file: prefer_initializing_formals
//
//import 'dart:math';
//
//import 'package:flustars/flustars.dart';
//import 'package:flutter/material.dart';
//import 'package:flutter/src/widgets/framework.dart';
//import 'package:getwidget/colors/gf_color.dart';
//import 'package:i_chaos/base_framework/widget_state/widget_state.dart';
//import 'package:i_chaos/generated/l10n.dart';
//import 'package:i_chaos/ichaos/public/extension/date_time_extension.dart';
//import 'package:i_chaos/ichaos/public/widgets/mini_checkbox_list_title.dart';
//import 'package:i_chaos/ichaos/todo/todo-domain/common/enums/todo_level.dart';
//import 'package:i_chaos/ichaos/todo/todo-domain/common/models/subtask.dart';
//import 'package:i_chaos/ichaos/todo/todo-domain/common/models/todo_vo.dart';
//import 'package:i_chaos/ichaos/todo/todo-domain/core/widgets/card/todo_op_callback.dart';
//
//class WidgetTodoDetailCard extends WidgetState {
//  late final TodoVO _todo;
//  late OnTodoDetailQueryCallback? onDetailQuery;
//
//  // 事件等级多语言字符串
//  late List<String> todoLevelString;
//
//  WidgetTodoDetailCard(this._todo, {OnTodoDetailQueryCallback? onDetailQuery}) {
//    this.onDetailQuery = onDetailQuery;
//  }
//
//  @override
//  Widget build(BuildContext context) {
//    todoLevelString = [
//      S.of(context).todo_edit_level_btn_deferrable,
//      S.of(context).todo_edit_level_btn_unimportant,
//      S.of(context).todo_edit_level_btn_normal,
//      S.of(context).todo_edit_level_btn_important,
//      S.of(context).todo_edit_level_btn_urgent
//    ];
//
//    if (_todo.subTaskList.isNotEmpty
//        && _todo.subTaskList.where((task) => task.completed).length == _todo.subTaskList.length) {
//
//      _todo.completed = true;
//    }
//
//    return _widgetCustomTodoContentDialog();
//  }
//
//  Widget _widgetCustomTodoContentDialog() {
//    List<Widget> contentList = [];
//    contentList.add(_widgetMainSubContent(_todo.content, S.of(context).todo_card_detail_query_content_label));
//
//    if (_todo.isRemarkInfo) {
//      contentList.add(_widgetMainSubContent(_todo.remark!, S.of(context).todo_card_detail_query_desc_label));
//    }
//
//    contentList.add(_widgetMainSubContent(todoLevelString[_todo.level], S.of(context).todo_card_detail_query_level_label, mainContentPreColor: TodoLevel.coded(_todo.level).color));
//    contentList.add(_widgetMainSubContent(_todo.completed ? S.of(context).todo_card_detail_query_has_completed : S.of(context).todo_card_detail_query_not_completed, S.of(context).todo_card_detail_query_is_completed_label));
//
//    if (_todo.completedTime != null) {
//      contentList.add(_widgetMainSubContent(_todo.completedTime!.yyyyMMddHHmmss, S.of(context).todo_card_detail_query_completed_date_label));
//    }
//
//    if (_todo.location != null && _todo.location!.trim() != '') {
//      contentList.add(_widgetMainSubContent(_todo.location!, S.of(context).todo_card_detail_query_location_label));
//    }
//
//    if (_todo.subTaskList.isNotEmpty) {
//      contentList.add(_widgetMainSubContent('', S.of(context).todo_card_detail_query_subtask_label));
//      contentList.addAll(_getComplexSubTaskList());
//    }
//
//    contentList.add(_widgetMainSubContent(_todo.validTime!.yyyyMMdd, S.of(context).todo_card_detail_query_valid_date_label));
//    contentList.add(_widgetMainSubContent(_todo.createTime.yyyyMMddHHmmss, S.of(context).todo_card_detail_query_crete_date_label));
//    contentList.add(_widgetMainSubContent(_todo.updateTime.yyyyMMddHHmmss, S.of(context).todo_card_detail_query_update_date_label));
//
//    double contentHeight = contentList.length * 38.0;
//    contentHeight = min(contentHeight, ScreenUtil.getInstance().screenHeight / 2);
//
//    return Padding(
//      padding: const EdgeInsets.symmetric(horizontal: 0),
//      child: Container(
//        height: contentHeight,
//        child: ListView.builder(
//          itemBuilder: (ctx, index) {
//            return Column(
//              mainAxisAlignment: MainAxisAlignment.start,
//              crossAxisAlignment: CrossAxisAlignment.start,
//              children: contentList,
//            );
//          },
//          itemCount: 1,
//        ),
//      ),
//    );
//  }
//
//  Widget _widgetMainSubContent(String mainContent, String subContent, {Color? mainContentPreColor}) {
//    return Padding(
//      padding: const EdgeInsets.only(top: 8),
//      child: Column(
//        mainAxisAlignment: MainAxisAlignment.start,
//        crossAxisAlignment: CrossAxisAlignment.start,
//        children: <Widget>[
//          if (subContent.trim() != '')
//            Row(
//              mainAxisAlignment: MainAxisAlignment.start,
//              children: <Widget>[
//                Padding(
//                  padding: const EdgeInsets.only(right: 3),
//                  child: Container(
//                    height: 5,
//                    width: 5,
//                    decoration: const BoxDecoration(
//                      color: Colors.green,
//                      borderRadius: BorderRadius.all(Radius.circular(5)),
//                    ),
//                  ),
//                ),
//                Text(
//                  subContent,
//                  style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w300, color: Colors.black54),
//                  maxLines: 10,
//                ),
//              ],
//            ),
//          const SizedBox(
//            height: 3,
//          ),
//          if (mainContent.trim() != '')
//            Wrap(
//              children: <Widget>[
//                Text(
//                  mainContent,
//                  style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w400, color: Colors.black),
//                  maxLines: 10,
//                ),
//                if (mainContentPreColor != null)
//                  Padding(
//                    padding: const EdgeInsets.only(left: 5),
//                    child: Container(
//                      height: 8,
//                      width: 8,
//                      decoration: BoxDecoration(
//                        color: mainContentPreColor,
//                        borderRadius: const BorderRadius.all(Radius.circular(8)),
//                      ),
//                    ),
//                  ),
//              ],
//            ),
//        ],
//      ),
//    );
//  }
//
//  List<Widget> _getComplexSubTaskList() {
//    List<Widget> taskWidgets = [];
//    final List<SubTaskVO> subTaskList = _todo.subTaskList;
//
//    if (_todo.completed) {
//      taskWidgets.add(ListView.builder(
//        physics: const NeverScrollableScrollPhysics(),
//        itemCount: subTaskList.length,
//        shrinkWrap: true,
//        padding: const EdgeInsets.all(0),
//        itemBuilder: (BuildContext context, int index) {
//          final task = subTaskList[index];
//          return MiniCheckboxListTitle(
//            title: task.content,
//            isChecked: true,
//            textStyle: const TextStyle(
//              height: 1.1,
//              fontSize: 14
//            ),
//            activeIcon: const Icon(
//              Icons.brightness_1,
//              size: 10,
//              color: GFColors.SUCCESS,
//            ),
//            maxLines: 2,
//            activeBgColor: GFColors.WHITE,
//            onTap: (val) {},
//          );
//        },
//      ));
//    } else {
//      for (int i = 0; i < subTaskList.length; i++) {
//        final task = subTaskList[i];
//
//        taskWidgets.add(MiniCheckboxListTitle(
//          title: task.content,
//          isChecked: task.completed,
//          textStyle: const TextStyle(
//              height: 1.1,
//              fontSize: 14
//          ),
//          maxLines: 2,
//          onTap: (val) async {
//            Future.delayed(const Duration(milliseconds: 20)).then((value) {
//              onDetailQuery?.call(context, _todo, this, task);
//            });
//          },
//        ));
//      }
//    }
//
//    return taskWidgets;
//  }
//}
