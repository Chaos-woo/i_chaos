
import 'package:flutter/material.dart';
import 'package:i_chaos/base_framework/view_model/single_view_state_model.dart';
import 'package:i_chaos/ichaos/todo/todo-domain/core/scenes/home/widgets/filtered/filtered_tab_bar_vm.dart';
import 'package:table_calendar/table_calendar.dart';

class CalendarBarVM extends SingleViewStateModel {
  final DateTime firstDay = DateTime(2000, 1, 1);
  final DateTime lastDay = DateTime(2099, 12, 30);

  final Map<int, String> weekLabels = {
    7 : "周日",
    1: "周一",
    2: "周二",
    3: "周三",
    4: "周四",
    5: "周五",
    6: "周六"
  };

  late DateTime _selectDate;
  late FilteredTabBarVM _filteredTabBarVM;

  CalendarBarVM({required FilteredTabBarVM filteredTabBarVM}) {
    _filteredTabBarVM = filteredTabBarVM;
    _selectDate = _filteredTabBarVM.currentDate;
  }

  DateTime get selectDate => _selectDate;

  set selectDate(DateTime value) {
    _selectDate = value;
  }

  // 日期切换 - 滑动
  void swipeDateChange(DateTime selectDate) {
    _filteredTabBarVM.selectedDateChange(selectDate);
  }

  // 日期切换 - 点选
  void selectDateChange(DateTime selectDate) {
    Future.delayed(const Duration(milliseconds: 300), () {
      _filteredTabBarVM.selectedDateChange(selectDate);
    });
    _selectDate = selectDate;
  }

  // 获取周标签值
  String getWeekLabel(int weekday) {
    return weekLabels[weekday]!;
  }

  // 回到今日
  void backToToday() {
    _selectDate = DateTime.now();
    _filteredTabBarVM.selectedDateChange(selectDate);
  }

  // 设置日历组件的装饰
  CalendarStyle getCalendarStyle() {
    return const CalendarStyle(
      todayDecoration:BoxDecoration(
        color: Color(0xCFFFA500),
        shape: BoxShape.circle,
      ),
      selectedDecoration: BoxDecoration(
        color: Color(0xCFFFD700),
        shape: BoxShape.circle,
      ),

    );
  }

  @override
  Future? loadData() {
    return null;
  }

  @override
  onCompleted(data) {
  }
}