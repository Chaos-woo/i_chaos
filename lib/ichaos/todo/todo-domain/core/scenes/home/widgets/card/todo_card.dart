
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:getwidget/colors/gf_color.dart';
import 'package:i_chaos/base_framework/widget_state/widget_state.dart';
import 'package:i_chaos/ichaos/public/widgets/icon_text.dart';
import 'package:i_chaos/ichaos/public/widgets/mini_checkbox_list_title.dart';
import 'package:i_chaos/ichaos/public/widgets/ww-dialog/ww_dialog.dart';
import 'package:i_chaos/ichaos/todo/todo-common/enums/todo_level.dart';
import 'package:i_chaos/ichaos/todo/todo-common/models/subtask.dart';
import 'package:i_chaos/ichaos/todo/todo-common/models/todo_vo.dart';
import 'package:i_chaos/ichaos/public/extension/date_time_extension.dart';
import 'package:i_chaos/ichaos/todo/todo-domain/common/widgets/custom_slidable_action.dart';
import 'package:noripple_overscroll/noripple_overscroll.dart';

class TodoCard extends WidgetState {

  final TodoVO _todo;

  TodoCard(this._todo);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: _sliderCard(context),
      onLongPress: () {
      },
    );
  }

  /// 滑动卡片，处理相应的滑动事件
  Widget _sliderCard(BuildContext rootCtx) {
    return Container(
      margin: const EdgeInsets.fromLTRB(0, 4, 0, 4),
      child: Container(
        margin: const EdgeInsets.fromLTRB(0, 0, 0, 0),
        decoration: BoxDecoration(
          color: Colors.grey[200],
//          borderRadius: BorderRadius.circular(8),
          boxShadow: const [
            BoxShadow(
              blurRadius: 1.5,
              spreadRadius: 1,
              color: Color.fromARGB(50, 0, 0, 0),
            ),
          ],
        ),
        child: Slidable(
          key: ValueKey(_todo.id),
          startActionPane: _getStartActionPane(rootCtx),
          endActionPane: _getEndActionPane(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              /// 事件等级颜色标记.
              if (_todo.isColorArea) _promptColorArea(),
              /// 卡片.
              _renderTodoCard(rootCtx),
            ],
          ),
        ),
      ),
    );
  }

  // 获取对应的startAction面板按钮.
  ActionPane? _getStartActionPane(BuildContext rootCtx) {
    return _todo.completed ? null : ActionPane(
      motion: const BehindMotion(),
      extentRatio: 0.75,
      children: <Widget>[
        CustomizeSlidableAction.get(SlidableActionContent.finish, onPressed: (ctx) {}),
        CustomizeSlidableAction.get(SlidableActionContent.edit, onPressed: (ctx) {}),
        CustomizeSlidableAction.get(SlidableActionContent.delete, onPressed: (ctx) {
          WWDialog.showMiddleDialog(rootCtx,
            title: '确认删除?',
            content: '待删除内容: ${_todo.content}',
            contentAlign: TextAlign.left,
            buttons: ['取消', '确认'],
            cancelButtonColor: colorWithQ,
            cancelButtonFontWeight: FontWeight.w500,
            otherButtonColor: Colors.red,
            otherButtonFontWeight: FontWeight.w500,
            onTap: (index, ctx) {
              if (index == 1) {
                // todo: delete
              }
            }
          );
        }),
      ],
    );
  }

  // 获取对应的endAction面板按钮.
  ActionPane? _getEndActionPane() {
    return !_todo.completed ? null : ActionPane(
      motion: const BehindMotion(),
      extentRatio: 0.25,
      children: <Widget>[
        CustomizeSlidableAction.get(SlidableActionContent.recall, onPressed: (ctx) {}),
      ],
    );
  }

  /// *******************************************
  ///  卡片UI组件.
  ///
  /// *******************************************
  /// 提示颜色区域.
  Widget _promptColorArea() {
    return Container(
      decoration: BoxDecoration(
        color: TodoLevel.coded(_todo.level).color,
      ),
      height: 5.h,
    );
  }

  /// 卡片信息.
  Widget _renderTodoCard(BuildContext rootCtx) {
    return Container(
      decoration: const BoxDecoration(
        color: Colors.white,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          /// 提醒区域：包含地点和时间
          if (_todo.isPromptArea) _promptInfoArea(),
          /// 主内容区域
          _mainContentArea(),
          /// 子任务区域
          if (_todo.isSubTaskArea) _subTaskInfoArea(),
          /// 备注区域
          if (_todo.isRemarkArea) _remarkInfoArea(),
          /// 标签区域
          if (_todo.isTagsArea) _tagInfoArea(rootCtx),
        ],
      ),
    );
  }

  /// 提醒信息区域.
  Widget _promptInfoArea() {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 5.h),
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          _todo.location != null
              ? IconText(
            _todo.location!,
            icon: const Icon(Icons.location_on),
            softWrap: false,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            padding: EdgeInsets.only(right: 5.h),
          )
              : Text('待办事件将在设置时间提醒您!'),
          if (_todo.needPromptTime != null)
            IconText(
              (_todo.needPromptTime!.HHmm),
              style: TextStyle(color: Colors.red, fontSize: 16.sp),
              icon: const Icon(Icons.alarm),
              padding: EdgeInsets.only(right: 5.h),
            ),
        ],
      ),
    );
  }

  /// 备注信息区域.
  Widget _remarkInfoArea() {
    return Container(
      margin: EdgeInsets.only(top: 4.h, bottom: 4.h),
      padding: const EdgeInsets.only(left: 20, right: 4),
      child: Row(
        children: <Widget>[
          Text(
            '备注：',
            style: TextStyle(
              fontSize: 14,
              color: Colors.grey[600],
            ),
          ),
          Expanded(
            child: Text(
              _todo.remark!,
              style: TextStyle(
                fontSize: 14.sp,
                color: Colors.grey,
              ),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          )
        ],
      ),
    );
  }

  /// 主内容区域.
  Widget _mainContentArea() {
    return Container(
      margin: EdgeInsets.only(top: 8.h, bottom: 4.h),
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Text(
        _todo.content,
        style: const TextStyle(
          fontSize: 17,
          fontWeight: FontWeight.w500,
        ),
        softWrap: true,
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
      ),
    );
  }

  /// 子任务区域.
  Widget _subTaskInfoArea() {
    final List<SubTaskVO> subTaskList = _todo.subTaskList;

    return Container(
      margin: EdgeInsets.only(top: 8.h, bottom: 8.h),
      padding: const EdgeInsets.only(left: 20, right: 8),

      /// 去除ListView的边界水波纹效果
      child: NoRippleOverScroll(
        child: ListView.builder(
          physics: const NeverScrollableScrollPhysics(),
          itemCount: subTaskList.length,
          shrinkWrap: true,
          padding: const EdgeInsets.all(0),
          itemBuilder: (BuildContext context, int index) {
            final task = subTaskList[index];
            return _todo.completed
                ? MiniCheckboxListTitle(
              title: task.content,
              isChecked: true,
              activeIcon: const Icon(
                Icons.brightness_1,
                size: 10,
                color: GFColors.SUCCESS,
              ),
              activeBgColor: GFColors.WHITE,
              onTap: (val) {},
            )
                : MiniCheckboxListTitle(
              title: task.content,
              isChecked: task.completed,
              onTap: (val) => {},
            );
          },
        ),
      ),
    );
  }

  /// 标签信息区域.
  Widget _tagInfoArea(BuildContext rootCtx) {
    return Container(
      margin: const EdgeInsets.fromLTRB(0, 0, 0, 4),
      padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[

          /// 扩展标签 - 事件等级
//          if (_todo.isColorArea)
//            MiniChip(
//              content: ref
//                  .read(TodoPageNotifierProvider.get().notifier)
//                  .pageStateTags[TodoLevel
//                  .coded(todo.level)
//                  .desc]!.content,
//              badgeColor: TodoLevel
//                  .coded(todo.level)
//                  .color,
//            ),

//          /// 用户指定的分组标签
//          if (tag != null)
//            MiniChip(
//              content: tag.content,
//              badgeColor: Palette.random(),
//              onTap: () {
//                print('to 分组标签');
//              },
//            ),

//          /// 扩展标签 - 周期
//          if (PeriodUnit.isPromptToday(todo.period))
//            MiniChip(
//              content: '定时任务',
//              badgeColor: Palette.random(),
//              onTap: () {
//                print('to 定时任务');
//              },
//            ),
        ],
      ),
    );
  }

}