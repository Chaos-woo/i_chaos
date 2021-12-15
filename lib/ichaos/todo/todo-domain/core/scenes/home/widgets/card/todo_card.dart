import 'package:flustars/flustars.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:getwidget/colors/gf_color.dart';
import 'package:i_chaos/base_framework/widget_state/widget_state.dart';
import 'package:i_chaos/ichaos/public/extension/date_time_extension.dart';
import 'package:i_chaos/ichaos/public/widgets/icon_text.dart';
import 'package:i_chaos/ichaos/public/widgets/mini_checkbox_list_title.dart';
import 'package:i_chaos/ichaos/todo/todo-common/enums/todo_level.dart';
import 'package:i_chaos/ichaos/todo/todo-common/models/subtask.dart';
import 'package:i_chaos/ichaos/todo/todo-common/models/todo_vo.dart';
import 'package:noripple_overscroll/noripple_overscroll.dart';

class TodoCard extends WidgetState {
  static const String _cardFontFamily = 'Lexend Deca';

  final TodoVO _todo;

  TodoCard(this._todo);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsetsDirectional.fromSTEB(2, 0, 2, 0),
        child: InkWell(
          child: Container(
            margin: EdgeInsets.only(top: 8),
            decoration: BoxDecoration(
              color: Colors.white,
              border: Border.all(
                width: 1,
                color: TodoLevel.coded(_todo.level).color,
              ),
              borderRadius: const BorderRadius.all(Radius.circular(8)),
              boxShadow: [
                if(_todo.isColorPrompt)
                  BoxShadow(
                      color: TodoLevel.coded(_todo.level).color,
                      offset: const Offset(0.0, -5.0), // 阴影y轴偏移量
                      blurRadius: 0, // 阴影模糊程度
                      spreadRadius: 0 // 阴影扩散程度
                  )
              ],
            ),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              // 卡片列信息
              children: _cardColumn(),
            ),
          ),
        ),
      ),
    );
  }

  // 卡片列信息
  List<Widget> _cardColumn() {
    List<Widget> baseNode = _todo.isPromptContent ? _promptInfoRow() : [];
    baseNode.addAll([
      _mainContentRow(),
      if(_todo.isRemarkInfo) _remarkInfoRow()
    ]);
    return baseNode;
  }

  Widget _remarkInfoRow() {
    return Padding(
      padding: const EdgeInsetsDirectional.fromSTEB(12, 4, 12, 4),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        children: [
          Expanded(
            child: Text(
              _todo.remark!,
              style: const TextStyle(
                fontFamily: _cardFontFamily,
                color: Color(0xFF8B97A2),
                fontSize: 14,
                fontWeight: FontWeight.normal,
              ),
              softWrap: true,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      ),
    );
  }

  Widget _mainContentRow() {
    return Padding(
      padding: const EdgeInsetsDirectional.fromSTEB(12, 4, 12, 4),
      child: Padding(
          padding: const EdgeInsetsDirectional.fromSTEB(0, 4, 0, 0),
          child: Text(
            _todo.content,
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w500,
              fontFamily: _cardFontFamily,
              color: Color(0xFF151B1E),
            ),
            softWrap: true,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          )
      ),
    );
  }

  List<Widget> _promptInfoRow() {
    return <Widget>[
      Padding(
        padding: const EdgeInsetsDirectional.fromSTEB(12, 4, 12, 8),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          children: [
            const Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 4),
              child: Icon(
                Icons.schedule,
                color: Colors.teal,
                size: 20,
              ),
            ),
            Padding(
              padding: const EdgeInsetsDirectional.fromSTEB(4, 0, 0, 0),
              child: Text(
                _todo.needPromptTime!.HHmm,
                style: const TextStyle(
                  fontFamily: _cardFontFamily,
                  color: Color(0xFF4B39EF),
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsetsDirectional.fromSTEB(24, 0, 0, 4),
              child: Icon(
                Icons.location_on_sharp,
                color: Colors.teal,
                size: 20,
              ),
            ),
            Padding(
              padding: const EdgeInsetsDirectional.fromSTEB(4, 0, 0, 0),
              child: Text(
                '${_todo.location}',
                style: const TextStyle(
                  fontFamily: _cardFontFamily,
                  color: Color(0xFF4B39EF),
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ],
        ),
      ),
      Container(
        width: ScreenUtil.getInstance().screenWidth * 0.85,
        height: 1,
        decoration: const BoxDecoration(
          color: Color(0xFFDBE2E7),
        ),
      ),
    ];
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
//  Widget _renderTodoCard(BuildContext rootCtx) {
//    return Container(
//      decoration: const BoxDecoration(
//        color: Colors.white,
//      ),
//      child: Column(
//        crossAxisAlignment: CrossAxisAlignment.stretch,
//        children: <Widget>[
//          /// 提醒区域：包含地点和时间
//          if (_todo.isPromptContent) _promptInfoArea(),
//
//          /// 主内容区域
//          _mainContentArea(),
//
//          /// 子任务区域
//          if (_todo.isSubTaskInfo) _subTaskInfoRow(),
//
//          /// 备注区域
//          if (_todo.isRemarkInfo) _remarkInfoArea(),
//        ],
//      ),
//    );
//  }

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
  Widget _subTaskInfoRow() {
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
}
