
import 'package:flutter/material.dart';
import 'package:i_chaos/base_framework/view_model/single_view_state_model.dart';
import 'package:i_chaos/ichaos/todo/todo-domain/core/scenes/home/widgets/calendar/calendar_bar_vm.dart';
import 'package:i_chaos/ichaos/todo/todo-domain/core/scenes/home/widgets/filtered/filtered_tab_bar_vm.dart';
import 'package:i_chaos/ichaos/public/extension/date_time_extension.dart';

enum FloatBtnDisplayStatus {
  show, hide
}

class TodoHomeFloatingActionBtnVM extends SingleViewStateModel {
  late FilteredTabBarVM _filteredTabBarVM;
  late CalendarBarVM _calendarBarVM;

  bool? isDisplay;
  ValueChanged<bool>? btnDisplayCallback;

  TodoHomeFloatingActionBtnVM({required FilteredTabBarVM filteredTabBarVM, required CalendarBarVM calendarBarVM}) {
    _filteredTabBarVM = filteredTabBarVM;
    _calendarBarVM = calendarBarVM;
  }

  bool get show => isDisplay ?? true;

  // 注册属性更改回调
  void addListenerOfBtnState(ValueChanged<bool> btnDisplayCallback) {
    this.btnDisplayCallback = btnDisplayCallback;
  }

  // 根据传入参数改变按钮展示状态
  void floatingBtnDisplayChange(FloatBtnDisplayStatus action) {
    bool isDisplay = _isShow(action);
    this.isDisplay = isDisplay;
    btnDisplayCallback?.call(isDisplay);
  }

  // 按钮是否需要为展示状态
  bool _isShow(FloatBtnDisplayStatus action) {
    return action == FloatBtnDisplayStatus.show;
  }

  // 回到今日
  void backToToday() {
    _calendarBarVM.backToToday();
  }

  // 当前选择时间是否为今日
  bool isToday() {
    return _filteredTabBarVM.currentDate.isToday();
  }

  @override
  Future? loadData() {
  }

  @override
  onCompleted(data) {
  }
}