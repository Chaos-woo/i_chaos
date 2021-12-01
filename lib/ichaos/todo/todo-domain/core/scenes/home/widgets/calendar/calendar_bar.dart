
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:i_chaos/base_framework/ui/widget/provider_widget.dart';
import 'package:i_chaos/base_framework/widget_state/widget_state.dart';
import 'package:i_chaos/ichaos/todo/todo-domain/core/scenes/home/widgets/calendar/calendar_bar_vm.dart';
import 'package:i_chaos/ichaos/todo/todo-domain/core/scenes/home/widgets/filtered/filtered_tab_bar_vm.dart';
import 'package:simple_gesture_detector/simple_gesture_detector.dart';
import 'package:table_calendar/table_calendar.dart';

class CalendarBar extends WidgetState {
  late CalendarBarVM _calendarBarVM;

  CalendarBar({required FilteredTabBarVM filteredTabBarVM}) {
    _calendarBarVM = CalendarBarVM(filteredTabBarVM: filteredTabBarVM);
  }

  @override
  Widget build(BuildContext context) {

    return Container(
      margin: const EdgeInsets.only(top: 0),
      color: Colors.teal,
      child: ProviderWidget<CalendarBarVM>(
        model: _calendarBarVM,
        builder: (ctx, calendarBarVM, child) {
          return NotificationListener<ScrollNotification>(
            onNotification: (ScrollNotification notification) {
              if (notification.depth == 0 && notification is ScrollEndNotification) {
                calendarBarVM.swipeDateChange(calendarBarVM.selectDate);
              }
              return false;
            },
            child: TableCalendar(
//            eventLoader: _getEventsForDay,
              firstDay: calendarBarVM.firstDay,
              lastDay: calendarBarVM.lastDay,
              focusedDay: calendarBarVM.selectDate,
              calendarFormat: CalendarFormat.week,
              headerVisible: false,
//            daysOfWeekStyle: ,
              calendarStyle: calendarBarVM.getCalendarStyle(),
              availableGestures: AvailableGestures.horizontalSwipe,
              calendarBuilders: CalendarBuilders(
                dowBuilder: (context, day) {
                  String weekLabel = calendarBarVM.getWeekLabel(day.weekday);
                  return Center(
                    child: Text(
                      weekLabel,
                      style: const TextStyle(
                          fontSize: 12,
                          color: Colors.black54,
                          fontWeight: FontWeight.w600
                      ),
                    ),
                  );
                },
              ),
//              simpleSwipeConfig: SimpleSwipeConfig(),
              selectedDayPredicate: (day) {
                return isSameDay(calendarBarVM.selectDate, day);
              },
              onDaySelected: (selectedDay, focusedDay) {
                // 用户点击日期时触发
                if (!isSameDay(calendarBarVM.selectDate, selectedDay)) {
                  setState(() {
                    calendarBarVM.selectDateChange(selectedDay);
                  });
                }
              },
              onPageChanged: (focusedDay) {
                // 滑动时触发
                calendarBarVM.selectDate = focusedDay;
              },
            ),
          );
        },
      ),
    );
  }

}