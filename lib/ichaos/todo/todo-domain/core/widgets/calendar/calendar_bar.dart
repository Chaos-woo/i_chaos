import 'package:flustars/flustars.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:i_chaos/base_framework/widget_state/widget_state.dart';
import 'package:provider/provider.dart';
import 'package:table_calendar/table_calendar.dart';

import 'calendar_bar_vm.dart';

class WidgetCalendarBar extends WidgetState {
  late CalendarBarVM _calendarBarVM;

  WidgetCalendarBar();

  @override
  Widget build(BuildContext context) {
    _calendarBarVM = Provider.of<CalendarBarVM>(context);

    return Container(
      margin: const EdgeInsets.only(top: 0),
      width: ScreenUtil.getInstance().screenWidth / 10 * 8.5,
      color: Colors.teal,
      child: NotificationListener<ScrollNotification>(
        onNotification: (ScrollNotification notification) {
          if (notification.depth == 0 && notification is ScrollEndNotification) {
            final PageMetrics metrics = notification.metrics as PageMetrics;
            final int currentPage = metrics.page!.round();
            // 保存当前页(TableCalendar根据firstDay生成翻页)
            _calendarBarVM.currentPage = currentPage;
            _calendarBarVM.swipeDateChange(_calendarBarVM.selectDate);
          }
          return false;
        },
        child: TableCalendar(
//            eventLoader: _getEventsForDay,
          firstDay: _calendarBarVM.firstDay,
          lastDay: _calendarBarVM.lastDay,
          focusedDay: _calendarBarVM.selectDate,
          calendarFormat: CalendarFormat.week,
          headerVisible: false,
//            daysOfWeekStyle: ,
          calendarStyle: _calendarBarVM.getCalendarStyle(),
          availableGestures: AvailableGestures.horizontalSwipe,
          pageAnimationDuration: Duration(milliseconds: _calendarBarVM.pageAnimationDuration),
          calendarBuilders: CalendarBuilders(
            dowBuilder: (context, day) {
              String weekLabel = _calendarBarVM.getWeekLabel(day.weekday);
              return Center(
                child: Text(
                  weekLabel,
                  style: const TextStyle(fontSize: 10, color: Colors.black54, fontFamily: 'Lexend Deca', fontWeight: FontWeight.w600),
                ),
              );
            },
          ),
//              simpleSwipeConfig: SimpleSwipeConfig(),
          selectedDayPredicate: (day) {
            return isSameDay(_calendarBarVM.selectDate, day);
          },
          onDaySelected: (selectedDay, focusedDay) {
            // 用户点击日期时触发
            if (!isSameDay(_calendarBarVM.selectDate, selectedDay)) {
              setState(() {
                _calendarBarVM.selectDateChange(selectedDay);
              });
            }
          },
          onPageChanged: (focusedDay) {
            // 滑动时触发
            _calendarBarVM.selectDate = focusedDay;
          },
        ),
      ),
    );
  }
}