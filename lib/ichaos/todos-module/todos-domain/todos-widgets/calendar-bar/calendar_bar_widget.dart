import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:i_chaos/base-getX-framework/get-x/views/widgets/stateless_ctrl_widget.dart';
import 'package:i_chaos/generated/l10n.dart';
import 'package:i_chaos/ichaos/common-module/get-controllers/color-theme/flex_color_theme_ctrl.dart';
import 'package:i_chaos/ichaos/common-module/global_variable.dart';
import 'package:i_chaos/ichaos/common-module/resources/app_style.dart';
import 'package:i_chaos/ichaos/todos-module/todos-domain/todos-widgets/calendar-bar/calendar_bar_ctrl.dart';
import 'package:table_calendar/table_calendar.dart';

class CalendarBarWidget extends StatelessCtrlWidget<CalendarBarCtrl> {
  CalendarBarWidget({Key? key}) : super(key: key);

  @override
  Widget ctrlWidgetBuilder() {
    Map<int, String> weekLabels = {
      1: S.current.todos_main_page_widget_label_week_abbr_mon,
      2: S.current.todos_main_page_widget_label_week_abbr_tue,
      3: S.current.todos_main_page_widget_label_week_abbr_wed,
      4: S.current.todos_main_page_widget_label_week_abbr_thu,
      5: S.current.todos_main_page_widget_label_week_abbr_fri,
      6: S.current.todos_main_page_widget_label_week_abbr_sat,
      7: S.current.todos_main_page_widget_label_week_abbr_sun,
    };

    FlexColorThemeCtrl themeCtrl = findReference();

    return Container(
      margin: const EdgeInsets.only(top: 0),
      // width: screenWidth / 10 * 8.5,
      color: themeCtrl.getFitModeColor(isBackground: true),
      child: NotificationListener<ScrollNotification>(
        onNotification: (ScrollNotification notification) {
          if (notification.depth == 0 && notification is ScrollEndNotification) {
            // 把滑动更新ToDOs的逻辑下移到后一个event loop，避免组件build时setState()发生异常
            zeroDelay(() {
              final PageMetrics metrics = notification.metrics as PageMetrics;
              final int currentPage = metrics.page!.round();
              // 保存当前页(TableCalendar根据firstDay生成翻页)
              metaCtrl.currentPage = currentPage;
            });
          }
          return false;
        },
        child: GetBuilder<CalendarBarCtrl>(
          builder: (_) {
            return TableCalendar(
//            eventLoader: _getEventsForDay,
              firstDay: calendarFirstDay,
              lastDay: calendarLastDay,
              focusedDay: metaCtrl.currentDate,
              calendarFormat: CalendarFormat.week,
              headerVisible: false,
//            daysOfWeekStyle: ,
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
              pageAnimationDuration: Duration(milliseconds: metaCtrl.pagingAnimationDuration),
              calendarBuilders: CalendarBuilders(
                dowBuilder: (context, day) {
                  String weekLabel = weekLabels[day.weekday] ?? '';
                  return Center(
                    child: Text(weekLabel,
                        style:
                            TextStyle(fontSize: AppStyle.fontSize.mini_10, fontWeight: AppStyle.fontWidget.normalMore)),
                  );
                },
              ),
//              simpleSwipeConfig: SimpleSwipeConfig(),
              selectedDayPredicate: (day) => isSameDay(metaCtrl.currentDate, day),
              onDaySelected: (selectedDay, focusedDay) {
                // 用户点击日期时触发
                if (!isSameDay(metaCtrl.currentDate, selectedDay)) {
                  metaCtrl.selectDate(selectedDay);
                }
              },
              // 滑动时触发
              onPageChanged: (focusedDay) => metaCtrl.selectDate(focusedDay),
            );
          },
        ),
      ),
    );
  }
}
