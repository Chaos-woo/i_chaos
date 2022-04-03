// ignore_for_file: prefer_initializing_formals, import_of_legacy_library_into_null_safe, implementation_imports, must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:i_chaos/base-getX-framework/utils/image_helper.dart';
import 'package:i_chaos/base-getX-framework/view/base_controller_view.dart';
import 'package:i_chaos/base-getX-framework/view/page/refresh_page_controller_view.dart';
import 'package:i_chaos/generated/l10n.dart';
import 'package:i_chaos/ichaos/todos-module/todos-domain/todos-common/enums/todo_state.dart';
import 'package:i_chaos/ichaos/todos-module/todos-domain/todos-common/models/todo_vo.dart';
import 'package:i_chaos/ichaos/todos-module/todos-domain/todos-widgets/todo-card/home-card/home_todo_card_widget.dart';
import 'package:i_chaos/ichaos/todos-module/todos-domain/todos-widgets/todo-card/todo_operate_callback.dart';
import 'package:i_chaos/ichaos/todos-module/todos-domain/todos-widgets/todo-list/home-tood-list/home_todo_list_ctrl.dart';
import 'package:widget_chain/widget_chain.dart';

class HomeTodoListWidget extends RefreshPageControllerView<HomeTodoListCtrl> {
  late bool _isActive;
  late TodoState _todoState;
  late HomeTodoListCtrl _homeTodoListCtrl;

  // 监听事件列表回调
  ListScrollListener? _listScrollCallback;

  HomeTodoListWidget({Key? key, required bool isActive, ListScrollListener? listScrollCallback}) : super(key: key) {
    _isActive = isActive;
    _todoState = _isActive ? TodoState.active : TodoState.completed;
    _listScrollCallback = listScrollCallback;
  }

  @override
  void initViewRes() {
    _homeTodoListCtrl = findDependency<HomeTodoListCtrl>();
  }

  @override
  ViewWidgetBuilder viewWidgetBuilder(BuildContext context, HomeTodoListCtrl controller) {
    return ViewWidgetBuilder(
        builderId: _homeTodoListCtrl.activeListBuilderId,
        viewBuilder: <HomeTodoListCtrl>(ctrl) {
          return _scrollTodoListView();
        });
  }

  Widget _scrollTodoListView() {
    List<TodoVO> currTodoList = _homeTodoListCtrl.getTodoListByState(_todoState);
    return pullDownControllerView(
        listBuilder: RefreshListItemBuilder(
          builder: (ctx, index) {
            if (index == currTodoList.length) {
              return _getMoreTipPlaceholder(currTodoList.length);
            }
            return HomeTodoCardWidget(currTodoList[index], _homeTodoListCtrl.todoOperateCallbacks());
          },
          itemCount: currTodoList.length + 1,
        ),
        scrollListener: ListScrollListener(
          onListOverScroll: _listScrollCallback?.onListOverScroll,
          onListScrollEnd: _listScrollCallback?.onListScrollEnd,
          onListScrollUpdate: _listScrollCallback?.onListScrollUpdate,
        ));
  }

  // 仅有当前ListView下标和事件列表长度相同时获取占位
  Widget _getMoreTipPlaceholder(int currentTodoListLength) {
    if (currentTodoListLength > 0) {
      // 当前列表数据大于0时，最后展示数据加载完的提示
      return Padding(
        padding: const EdgeInsets.symmetric(vertical: 20),
        child: _tipText(S.current.todos_main_page_todo_list_tip_no_data).intoCenter(),
      );
    }

    int completedTodoCnt = _homeTodoListCtrl.completedTodoCnt;
    int activeTodoCnt = _homeTodoListCtrl.activeTodoCnt;

    if (completedTodoCnt == 0 && activeTodoCnt == 0) {
      // 未完成/已完成均无数据时展示查找为空提示
      final Widget tip = ImageHelper.placeHolderLocalSVGImg(imageName: 'image_search_empty', width: 100, height: 100)
          .addNeighbor(_tipText(S.current.todos_main_page_todo_list_tip_not_found))
          .intoColumn(mainAxisAlignment: MainAxisAlignment.center);

      return Padding(
        padding: const EdgeInsets.symmetric(vertical: 40),
        child: tip.intoCenter(),
      );
    }

    if (_isActive) {
      // 当前为未完成列表&已完成列表有数据则展示所有事件完成的提示
      final Widget tip = (completedTodoCnt > 0
          ? ImageHelper.placeHolderLocalSVGImg(imageName: 'image_complete', width: 100, height: 100)
              .addNeighbor(_tipText(S.current.todos_main_page_todo_list_tip_completed))
              .intoColumn(mainAxisAlignment: MainAxisAlignment.center)
          : _tipText(S.current.todos_main_page_todo_list_tip_no_data));

      return Padding(
        padding: const EdgeInsets.symmetric(vertical: 40),
        child: tip.intoCenter(),
      );
    } else {
      // 当前为已完成列表&未完成列表有数据则展示还有未完成事件的提示
      final Widget tip = (activeTodoCnt > 0
          ? ImageHelper.placeHolderLocalSVGImg(imageName: 'image_task', width: 100, height: 100)
              .addNeighbor(_tipText(S.current.todos_main_page_todo_list_tip_has_more_todos))
              .intoColumn(mainAxisAlignment: MainAxisAlignment.center)
          : _tipText(S.current.todos_main_page_todo_list_tip_no_data));

      return Padding(
        padding: const EdgeInsets.symmetric(vertical: 40),
        child: tip.intoCenter(),
      );
    }
  }

  Widget _tipText(String text) {
    return Text('~~~~ $text ~~~~',
        style: TextStyle(
          color: Get.isDarkMode ? Colors.white : const Color(0xFF757575),
          fontWeight: FontWeight.w500,
          fontSize: 12,
        ));
  }
}
