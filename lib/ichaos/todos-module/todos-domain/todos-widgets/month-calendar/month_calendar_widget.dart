import 'package:flutter/material.dart';
import 'package:i_chaos/base-getX-framework/get-x/views/widgets/stateful_view_widget.dart';
import 'package:i_chaos/base-getX-framework/view-model/app-model/locale_ctrl.dart';
import 'package:i_chaos/ichaos/common-module/get-controllers/color-theme/flex_color_theme_ctrl.dart';
import 'package:i_chaos/ichaos/common-module/global_variable.dart';
import 'package:table_calendar/table_calendar.dart';

typedef DateChangeCallback = void Function(DateTime selectDate);

class MonthCalendarWidget extends StatefulViewWidget {
  DateTime? initialDate;
  DateChangeCallback? dateChangeCb; // 每次日期变更时时都会回调一次

  MonthCalendarWidget({
    Key? key,
    this.initialDate,
    this.dateChangeCb,
  }) : super(key: key) {
    initialDate = initialDate ?? DateTime.now();
  }

  @override
  Widget widgetBuilder() {
    FlexColorThemeCtrl themeCtrl = findReference();

    return TableCalendar(
      key: UniqueKey(),
      firstDay: calendarFirstDay,
      lastDay: calendarLastDay,
      focusedDay: initialDate!,
      calendarFormat: CalendarFormat.month,
      locale: findReference<LocaleCtrl>().localeString,
      headerStyle: const HeaderStyle(formatButtonVisible: false, titleCentered: true),
      calendarStyle: CalendarStyle(
        todayDecoration: BoxDecoration(
          color: themeCtrl.getCurrentThemeData().secondaryHeaderColor,
          shape: BoxShape.circle,
        ),
        selectedDecoration: BoxDecoration(
          color: themeCtrl.getPrimaryColor(),
          shape: BoxShape.circle,
        ),
      ),
      availableGestures: AvailableGestures.horizontalSwipe,
      pageAnimationDuration: const Duration(milliseconds: 200),
      selectedDayPredicate: (day) {
        return isSameDay(initialDate, day);
      },
      onDaySelected: (selectedDay, _) {
        _refreshSelectDate(selectedDay);
      },
    );
  }

  void _refreshSelectDate(DateTime selectDate) {
    setState(() {
      initialDate = selectDate;
      dateChangeCb?.call(selectDate);
    });
  }

  void jumpToSelectDateQuickly(DateTime date) {
    _refreshSelectDate(date);
  }
}
