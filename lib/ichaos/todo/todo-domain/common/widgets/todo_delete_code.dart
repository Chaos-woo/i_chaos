//import 'package:flutter/material.dart';
//import 'package:flutter_slidable/flutter_slidable.dart';
//
///// 滑动卡片，处理相应的滑动事件
//Widget _sliderCard(BuildContext rootCtx) {
//  return Container(
//    margin: const EdgeInsets.fromLTRB(0, 4, 0, 4),
//    child: Container(
//      margin: const EdgeInsets.fromLTRB(0, 0, 0, 0),
//      decoration: BoxDecoration(
//        color: Colors.grey[200],
////          borderRadius: BorderRadius.circular(8),
//        boxShadow: const [
//          BoxShadow(
//            blurRadius: 1.5,
//            spreadRadius: 1,
//            color: Color.fromARGB(50, 0, 0, 0),
//          ),
//        ],
//      ),
//      child: Slidable(
//        key: ValueKey(_todo.id),
//        startActionPane: _getStartActionPane(rootCtx),
//        endActionPane: _getEndActionPane(),
//        child: Column(
//          crossAxisAlignment: CrossAxisAlignment.stretch,
//          children: <Widget>[
//            /// 事件等级颜色标记.
//            if (_todo.isColorArea) _promptColorArea(),
//
//            /// 卡片.
//            _renderTodoCard(rootCtx),
//          ],
//        ),
//      ),
//    ),
//  );
//}
//
//// 获取对应的startAction面板按钮.
//ActionPane? _getStartActionPane(BuildContext rootCtx) {
//  return _todo.completed
//      ? null
//      : ActionPane(
//    motion: const BehindMotion(),
//    extentRatio: 0.75,
//    children: <Widget>[
//      CustomizeSlidableAction.get(SlidableActionContent.finish, onPressed: (ctx) {}),
//      CustomizeSlidableAction.get(SlidableActionContent.edit, onPressed: (ctx) {}),
//      CustomizeSlidableAction.get(SlidableActionContent.delete, onPressed: (ctx) {
//        WWDialog.showMiddleDialog(rootCtx,
//            title: '确认删除?',
//            content: '待删除内容: ${_todo.content}',
//            contentAlign: TextAlign.left,
//            buttons: ['取消', '确认'],
//            cancelButtonColor: colorWithQ,
//            cancelButtonFontWeight: FontWeight.w500,
//            otherButtonColor: Colors.red,
//            otherButtonFontWeight: FontWeight.w500, onTap: (index, ctx) {
//              if (index == 1) {
//                // todo: delete
//              }
//            });
//      }),
//    ],
//  );
//}
//
//// 获取对应的endAction面板按钮.
//ActionPane? _getEndActionPane() {
//  return !_todo.completed
//      ? null
//      : ActionPane(
//    motion: const BehindMotion(),
//    extentRatio: 0.25,
//    children: <Widget>[
//      CustomizeSlidableAction.get(SlidableActionContent.recall, onPressed: (ctx) {}),
//    ],
//  );
//}