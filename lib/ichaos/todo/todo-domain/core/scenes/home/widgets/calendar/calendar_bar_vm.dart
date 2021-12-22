import 'package:flutter/material.dart';
import 'package:i_chaos/base_framework/view_model/single_view_state_model.dart';
import 'package:i_chaos/ichaos/todo/todo-domain/core/scenes/home/widgets/filtered/filtered_tab_bar_vm.dart';
import 'package:table_calendar/table_calendar.dart';

class CalendarBarVM extends SingleViewStateModel {
  final DateTime firstDay = DateTime(2016, 1, 1);
  final DateTime lastDay = DateTime(2099, 12, 30);
  final int _defaultSinglePageAnimationDuration = 100;

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

  // 默认日历条翻页时间为100
  int _pageAnimationDuration = 20;
  // 日历条当前页
  late int _currentPage = 0;

  CalendarBarVM({required FilteredTabBarVM filteredTabBarVM}) {
    _filteredTabBarVM = filteredTabBarVM;
    _selectDate = _filteredTabBarVM.currentDate;
    _currentPage = _calculateFinalFocusedPage(_selectDate);
  }

  DateTime get selectDate => _selectDate;
  int get pageAnimationDuration => _pageAnimationDuration;
  int get currentPage => _currentPage;

  set selectDate(DateTime value) {
    _selectDate = value;
  }

  set currentPage(int value) {
    _currentPage = value;
  }

  // 日期切换 - 滑动
  void swipeDateChange(DateTime selectDate) {
    _filteredTabBarVM.selectedDateChange(selectDate,
        calendarPageAnimationDuration: _pageAnimationDuration);
    // 恢复为默认单页滑动时间100
    _pageAnimationDuration = _defaultSinglePageAnimationDuration;
  }

  // 日期切换 - 点选
  void selectDateChange(DateTime selectDate) {
    // 定义为400延迟是因为日历组件内部UI刷新时间为300
    _filteredTabBarVM.selectedDateChange(selectDate, calendarPageAnimationDuration: 400);
    _selectDate = selectDate;
  }

  // 获取周标签值
  String getWeekLabel(int weekday) {
    return weekLabels[weekday]!;
  }

  // 跳转至指定日期
  void jumpToToday(DateTime targetDate) {
    _selectDate = targetDate;
    int targetPage = _calculateFinalFocusedPage(_selectDate);
    // 简单实验下5页以下使用恒定滑动时间体验较好
    if (targetPage - _currentPage < 5) {
      _pageAnimationDuration = 500;
    } else {
      _pageAnimationDuration = _calculateTargetPageAnimationDuration(targetPage);
    }
    notifyListeners(refreshSelector: true);
  }

  // 回到今日
  void backToToday() {
    _selectDate = DateTime.now();
    int targetPage = _calculateFinalFocusedPage(_selectDate);
    // 简单实验下5页以下使用恒定滑动时间体验较好
    if (targetPage - _currentPage < 5) {
      _pageAnimationDuration = 500;
    } else {
      _pageAnimationDuration = _calculateTargetPageAnimationDuration(targetPage);
    }
    notifyListeners(refreshSelector: true);
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

  // 根据当前页和选择时间计算日历滑动时间
  int _calculatePageAnimationDuration() {
    return (_calculateFinalFocusedPage(_selectDate) - currentPage).abs() * _defaultSinglePageAnimationDuration;
  }

  // 根据当前页和和目标页计算日历滑动时间
  int _calculateTargetPageAnimationDuration(int targetPage) {
    return (targetPage - currentPage).abs() * _defaultSinglePageAnimationDuration;
  }

  // 计算指定日期在滑动页面中的页数，参照table_calendar_base.dart _calculateFocusedPage
  int _calculateFinalFocusedPage(DateTime focusedDay) {
    final daysBefore = (firstDay.weekday + 7 - getWeekdayNumber(StartingDayOfWeek.sunday)) % 7;
    DateTime firstDatOfWeek = firstDay.subtract(Duration(days: daysBefore));
    return focusedDay.difference(firstDatOfWeek).inDays ~/ 7;
  }
}