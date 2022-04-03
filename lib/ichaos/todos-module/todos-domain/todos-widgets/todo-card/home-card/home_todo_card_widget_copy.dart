//// ignore_for_file: prefer_initializing_formals, unrelated_type_equality_checks
//
//import 'package:flustars/flustars.dart';
//import 'package:flutter/material.dart';
//import 'package:flutter/src/widgets/framework.dart';
//import 'package:getwidget/colors/gf_color.dart';
//import 'package:i_chaos/generated/l10n.dart';
//import 'package:noripple_overscroll/noripple_overscroll.dart';
//
//class HomeTodoCardWidget extends WidgetState {
//  static const String _cardFontFamily = 'Lexend Deca';
//  late final TodoVO _todo;
//  // 事件操作回调
//  TodoOperateCallback? operateCallback;
//  // 是否展开子任务列表
//  late bool expandAllList;
//  // 子任务列表是否出现展开/收起按钮的任务数量上限
//  late int expandBtnDisplayLimits;
//
//  HomeTodoCardWidget(this._todo, {TodoOperateCallbacks? operateCallback, int expandBtnDisplayLimits = 2}) {
//    this.operateCallback = operateCallback;
//    expandAllList = false; // 默认不展开子任务列表
//    this.expandBtnDisplayLimits = expandBtnDisplayLimits;
//  }
//
//  @override
//  Widget build(BuildContext context) {
//    return Padding(
//      padding: const EdgeInsetsDirectional.fromSTEB(8, 0, 8, 0),
//      child: InkWell(
//        onTap: () {
//          WWDialog.showMiddleDialog(context,
//              title: S.of(context).todo_card_detail_query_title,
//              contentAlign: TextAlign.left,
//              isNeedCloseDiaLog: true,
//              titleAlign: TextAlign.left,
//              customContentWidget: WidgetTodoDetailCard(_todo, onDetailQuery: operateCallback!.onDetailQuery).transformToPageWidget(),
//              customWidgetButtons: [
//                defaultCustomButton(context, text: S.of(context).todo_card_detail_query_btn_confirm, textFontSize: 15.0, buttonHeight: 35.0, textColor: Colors.grey, onTap: () {}),
//                defaultCustomButton(context, text: S.of(context).todo_card_option_btn_modify, textFontSize: 15.0, buttonHeight: 35.0, textColor: const Color(0xFF2989F2), onTap: () {
//                  operateCallback?.onModify?.call(context, _todo);
//                }),
//                defaultCustomButton(context, text: S.of(context).todo_card_option_btn_delete, textFontSize: 15.0, buttonHeight: 35.0, textColor: Colors.red, onTap: () {
//                  WWDialog.showBottomDialog(context,
//                      title: S.of(context).todo_card_option_btn_delete_tip_title,
//                      titleAlign: TextAlign.center,
//                      titleColor: Colors.red,
//                      content: _todo.content,
//                      contentAlign: TextAlign.start,
//                      contentColor: Colors.black,
//                      contentFontSize: 15.0,
//                      location: DiaLogLocation.middle,
//                      arrangeType: buttonArrangeType.row,
//                      customWidgetButtons: [
//                        defaultCustomButton(context, text: S.of(context).todo_card_option_btn_delete_tip_confirm, textFontSize: 15.0, buttonHeight: 35.0, onTap: () {
//                          operateCallback?.onDelete?.call(context, _todo);
//                        }),
//                        defaultCustomButton(context, text: S.of(context).todo_card_option_btn_delete_tip_cancel, textFontSize: 15.0, buttonHeight: 35.0, textColor: Colors.grey, onTap: () {}),
//                      ]);
//                }),
//              ],
//              );
//        },
//        onLongPress: () {
//          WWDialog.showBottomDialog(
//            context,
//            isSystemBottomDialog: false,
//            customTitleWidget: Container(
//              padding: const EdgeInsets.symmetric(vertical: 15),
//              child: Text(
//                S.of(context).todo_card_more_option,
//                style: const TextStyle(
//                  fontSize: 17.0,
//                  fontWeight: FontWeight.w500,
//                ),
//              ),
//            ),
//            customWidgetButtons: fitOperationButtons(),
//            arrangeType: buttonArrangeType.column,
//          );
//        },
//        child: Container(
//          margin: const EdgeInsets.only(top: 8),
//          decoration: BoxDecoration(
//            color: Colors.white,
//            border: Border.all(
//              width: 1,
//              color: const Color(0xFFEEEEEE),
//            ),
//            borderRadius: const BorderRadius.all(Radius.circular(8)),
//            boxShadow: [
//              if (_todo.isColorPrompt)
//                BoxShadow(
//                    color: TodoLevel.coded(_todo.level).color,
//                    offset: const Offset(0.0, -4.0), // 阴影y轴偏移量
//                    blurRadius: 0, // 阴影模糊程度
//                    spreadRadius: 0 // 阴影扩散程度
//                    )
//            ],
//          ),
//          child: Column(
//            mainAxisSize: MainAxisSize.max,
//            crossAxisAlignment: CrossAxisAlignment.start,
//            // 卡片列信息
//            children: _cardColumn(),
//          ),
//        ),
//      ),
//    );
//  }
//
//  // 根据事件的是否完成展示不同操作按钮
//  List<Widget> fitOperationButtons() {
//    List<Widget> allOperationBtns = [
//      defaultCustomButton(context, text: S.of(context).todo_card_option_btn_completed, onTap: () {
//        operateCallback?.onCompleted?.call(context, _todo);
//      }),
//      defaultCustomButton(context, text: S.of(context).todo_card_option_btn_modify, onTap: () {
//        operateCallback?.onModify?.call(context, _todo);
//      }),
//      defaultCustomButton(context, text: S.of(context).todo_card_option_btn_delete, textColor: Colors.red, fontWeight: FontWeight.w600, onTap: () {
//        WWDialog.showBottomDialog(context,
//            title: S.of(context).todo_card_option_btn_delete_tip_title,
//            titleAlign: TextAlign.center,
//            titleColor: Colors.red,
//            content: _todo.content,
//            contentAlign: TextAlign.start,
//            contentColor: Colors.black,
//            contentFontSize: 15.0,
//            location: DiaLogLocation.middle,
//            arrangeType: buttonArrangeType.row,
//            customWidgetButtons: [
//              defaultCustomButton(context, text: S.of(context).todo_card_option_btn_delete_tip_confirm, textFontSize: 15.0, buttonHeight: 35.0, onTap: () {
//                operateCallback?.onDelete?.call(context, _todo);
//              }),
//              defaultCustomButton(context, text: S.of(context).todo_card_option_btn_delete_tip_cancel, textFontSize: 15.0, buttonHeight: 35.0, textColor: Colors.grey, onTap: () {}),
//            ]);
//      }),
//      defaultCustomButton(context, text: S.of(context).todo_card_option_btn_unaccomplished, textColor: Colors.blue, fontWeight: FontWeight.w600, onTap: () {
//        operateCallback?.onCancelCompleted?.call(context, _todo);
//      }),
//    ];
//
//    return !_todo.completed ? allOperationBtns.sublist(0, 3) : allOperationBtns.sublist(2, 4);
//  }
//
//  // 卡片列信息
//  List<Widget> _cardColumn() {
//    List<Widget> baseNode = (_todo.isPromptLocation || _todo.isPromptDate) ? _promptInfoRow() : [];
//    baseNode.add(_mainContentRow());
//    if (_todo.isRemarkInfo) {
//      baseNode.add(_remarkInfoRow());
//    }
//    if (_todo.isSubTaskInfo) {
//      baseNode.add(_subTaskInfoRow());
//    }
//
//    return baseNode;
//  }
//
//  Widget _remarkInfoRow() {
//    return Padding(
//      padding: const EdgeInsetsDirectional.fromSTEB(12, 4, 12, 4),
//      child: Row(
//        mainAxisSize: MainAxisSize.max,
//        mainAxisAlignment: MainAxisAlignment.start,
//        children: [
//          Expanded(
//            child: Text(
//              _todo.remark!,
//              style: const TextStyle(
//                fontFamily: _cardFontFamily,
//                color: Color(0xFF8B97A2),
//                fontSize: 14,
//                fontWeight: FontWeight.normal,
//              ),
//              softWrap: true,
//              maxLines: 2,
//              overflow: TextOverflow.ellipsis,
//            ),
//          ),
//        ],
//      ),
//    );
//  }
//
//  Widget _mainContentRow() {
//    return Padding(
//      padding: const EdgeInsetsDirectional.fromSTEB(12, 4, 12, 4),
//      child: Padding(
//          padding: const EdgeInsetsDirectional.fromSTEB(0, 4, 0, 0),
//          child: Text(
//            _todo.content,
//            style: const TextStyle(
//              fontSize: 18,
//              fontWeight: FontWeight.w500,
//              fontFamily: _cardFontFamily,
//              color: Color(0xFF151B1E),
//            ),
//            softWrap: true,
//            maxLines: 2,
//            overflow: TextOverflow.ellipsis,
//          )),
//    );
//  }
//
//  List<Widget> _promptInfoRow() {
//    List<Widget> baseNode = [];
//    if (_todo.isPromptDate) {
//      baseNode.add(const Padding(
//        padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 4),
//        child: Icon(
//          Icons.schedule,
//          color: Colors.teal,
//          size: 20,
//        ),
//      ));
//      baseNode.add(Padding(
//        padding: const EdgeInsetsDirectional.fromSTEB(4, 0, 0, 0),
//        child: Text(
//          _todo.needPromptTime!.HHmm,
//          style: const TextStyle(
//            fontFamily: _cardFontFamily,
//            color: Color(0xFF8B97A2),
//            fontSize: 14,
//            fontWeight: FontWeight.w500,
//          ),
//        ),
//      ));
//    }
//
//    if (_todo.isPromptLocation) {
//      baseNode.add(
//        const Padding(
//          padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 4),
//          child: Icon(
//            Icons.location_on_sharp,
//            color: Colors.teal,
//            size: 20,
//          ),
//        ),
//      );
//      baseNode.add(Padding(
//        padding: const EdgeInsetsDirectional.fromSTEB(4, 0, 0, 4),
//        child: Text(
//          '${_todo.location}',
//          style: const TextStyle(
//            fontFamily: _cardFontFamily,
//            color: Colors.black87,
//            fontSize: 15,
//            fontWeight: FontWeight.w500,
//          ),
//        ),
//      ));
//    }
//
//    return <Widget>[
//      Padding(
//        padding: const EdgeInsetsDirectional.fromSTEB(12, 4, 12, 4),
//        child: Row(
//          mainAxisSize: MainAxisSize.max,
//          children: baseNode,
//        ),
//      ),
//      Center(
//        child: Container(
//          width: ScreenUtil.getInstance().screenWidth * 0.85,
//          height: 1,
//          decoration: const BoxDecoration(
//            color: Color(0xFFDBE2E7),
//          ),
//        ),
//      ),
//    ];
//  }
//
//  /// 子任务区域.
//  Widget _subTaskInfoRow() {
//    return Container(
//      margin: EdgeInsets.only(top: 8.h, bottom: 8.h),
//      padding: const EdgeInsets.only(left: 20, right: 8),
//
//      /// 去除ListView的边界水波纹效果
//      child: NoRippleOverScroll(
//        child: Column(
//          crossAxisAlignment: CrossAxisAlignment.start,
//          children: _getComplexSubTaskList(),
//        ),
//      ),
//    );
//  }
//
//  // 根据事件状态及子任务数量来展示子任务为展开全部或部分子任务，获得较好的体验效果
//  List<Widget> _getComplexSubTaskList() {
//    List<Widget> taskWidgets = [];
//    final List<SubTaskVO> subTaskList = _todo.subTaskList;
//
//    // 展开/关闭功能按键
//    if (subTaskList.length > expandBtnDisplayLimits) {
//      taskWidgets.add(InkWell(
//        onTap: () {
//          expandAllList = !expandAllList;
//          refreshState();
//        },
//        child: Container(
//          margin: const EdgeInsets.only(top: 5, bottom: 5),
//          width: 65,
//          height: 20,
//          decoration: const BoxDecoration(color: Color(0xFFE0E0E0), borderRadius: BorderRadius.all(Radius.circular(10))),
//          child: Row(
//            mainAxisAlignment: MainAxisAlignment.center,
//            crossAxisAlignment: CrossAxisAlignment.center,
//            children: <Widget>[
//              Container(
//                child: expandAllList
//                    ? Container(
//                        alignment: Alignment.center,
//                        child: const Icon(
//                          Icons.arrow_drop_up,
//                          color: Colors.white,
//                          size: 25,
//                        ),
//                      )
//                    : Container(
//                        alignment: Alignment.center,
//                        child: const Icon(
//                          Icons.arrow_drop_down,
//                          color: Colors.white,
//                          size: 25,
//                        ),
//                      ),
//              ),
//              Text(
//                expandAllList
//                    ? S.of(context).todo_card_subtask_btn_retract
//                    : _todo.completed
//                        ? '${_todo.subTaskList.length}/${_todo.subTaskList.length}'
//                        : '${_todo.subTaskList.where((e) => e.completed).length}/${_todo.subTaskList.length}',
//                style: TextStyle(color: Colors.white, fontSize: expandAllList ? 11 : 13),
//              )
//            ],
//          ),
//        ),
//      ));
//    }
//
//    if (expandAllList) {
//      taskWidgets.add(ListView.builder(
//        physics: const NeverScrollableScrollPhysics(),
//        itemCount: subTaskList.length,
//        shrinkWrap: true,
//        padding: const EdgeInsets.all(0),
//        itemBuilder: (BuildContext context, int index) {
//          final task = subTaskList[index];
//
//          // 事件完成时其下的子任务全部展示为完成状态
//          return _todo.completed
//              ? MiniCheckboxListTitle(
//                  title: task.content,
//                  isChecked: true,
//                  activeIcon: const Icon(
//                    Icons.brightness_1,
//                    size: 10,
//                    color: GFColors.SUCCESS,
//                  ),
//                  activeBgColor: GFColors.WHITE,
//                  onTap: (val) {},
//                )
//              : MiniCheckboxListTitle(
//                  title: task.content,
//                  isChecked: task.completed,
//                  onTap: (val) async {
//                    Future.delayed(const Duration(milliseconds: 100)).then((value) {
//                      operateCallback?.onTodoToggleSubTaskCallback?.call(_todo, task, this);
//                    });
//                  },
//                );
//        },
//      ));
//    } else {
//      if (_todo.completed && subTaskList.length <= expandBtnDisplayLimits) {
//        // 事件完成状态 & 子任务数量小于上限
//        taskWidgets.add(ListView.builder(
//          physics: const NeverScrollableScrollPhysics(),
//          itemCount: subTaskList.length,
//          shrinkWrap: true,
//          padding: const EdgeInsets.all(0),
//          itemBuilder: (BuildContext context, int index) {
//            final task = subTaskList[index];
//            return MiniCheckboxListTitle(
//              title: task.content,
//              isChecked: true,
//              activeIcon: const Icon(
//                Icons.brightness_1,
//                size: 10,
//                color: GFColors.SUCCESS,
//              ),
//              activeBgColor: GFColors.WHITE,
//              onTap: (val) {},
//            );
//          },
//        ));
//      } else if (!_todo.completed && subTaskList.length <= expandBtnDisplayLimits) {
//        // 事件未完成状态 & 子任务数量小于上限
//        taskWidgets.add(ListView.builder(
//          physics: const NeverScrollableScrollPhysics(),
//          itemCount: subTaskList.length,
//          shrinkWrap: true,
//          padding: const EdgeInsets.all(0),
//          itemBuilder: (BuildContext context, int index) {
//            final task = subTaskList[index];
//
//            return MiniCheckboxListTitle(
//              title: task.content,
//              isChecked: task.completed,
//              onTap: (val) async {
//                Future.delayed(const Duration(milliseconds: 100)).then((value) {
//                  operateCallback?.onTodoToggleSubTaskCallback?.call(_todo, task, this);
//                });
//              },
//            );
//          },
//        ));
//      } else if (!_todo.completed && subTaskList.length > expandBtnDisplayLimits) {
//        // 事件未完成状态 & 子任务数量大于上限
//        List<SubTaskVO> activeSubTasks = subTaskList.where((task) => !task.completed).toList();
//
//        taskWidgets.add(ListView.builder(
//          physics: const NeverScrollableScrollPhysics(),
//          itemCount: activeSubTasks.length,
//          shrinkWrap: true,
//          padding: const EdgeInsets.all(0),
//          itemBuilder: (BuildContext context, int index) {
//            final task = activeSubTasks[index];
//            return MiniCheckboxListTitle(
//              title: task.content,
//              isChecked: task.completed,
//              onTap: (val) {
//                Future.delayed(const Duration(milliseconds: 100)).then((value) {
//                  operateCallback?.onTodoToggleSubTaskCallback?.call(_todo, task, this);
//                });
//              },
//            );
//          },
//        ));
//      }
//    }
//
//    return taskWidgets;
//  }
//}
