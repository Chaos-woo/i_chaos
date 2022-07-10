import 'dart:async';

import 'package:get/get.dart';
import 'package:i_chaos/base-getX-framework/events/event_bus_helper.dart';
import 'package:i_chaos/base-getX-framework/get-x/ctrls/running_state_ctrl.dart';
import 'package:i_chaos/ichaos/common-module/extensions/date_time_extension.dart';
import 'package:i_chaos/ichaos/todos-module/todos-domain/todos-common/events/todos_date_change_event.dart';
import 'package:i_chaos/ichaos/todos-module/todos-domain/todos-common/events/publishers/todos_event_publisher.dart';

class CalendarBarCtrl extends RunningStateCtrl implements GetxService {
  DateTime currentDate;
  late StreamSubscription _onDateChangeCert;

  // 日历条当前页
  int currentPage = 0;

  // 默认日历条翻页时间
  int pagingAnimationDuration = 20;

  CalendarBarCtrl(this.currentDate);

  @override
  void initStateRes() {
    _onDateChangeCert = EventBusHelper().subscribe<TodosDateChangeEvent>((event) {
      if (event.publisher == TodosEventPublisher.weekCalendar || currentDate.isSameDay(event.selectedDate)) {
        return;
      }
      currentDate = event.selectedDate;
      updateBuilder();
    });
  }

  @override
  void releaseStateRes() {
    _onDateChangeCert.cancel();
  }

  void selectDate(DateTime date) {
    DateTime lastSelectedDate = currentDate;
    currentDate = date;
    EventBusHelper().fire(TodosDateChangeEvent(
      selectedDate: currentDate,
      publisher: TodosEventPublisher.weekCalendar,
      lastSelectedDate: lastSelectedDate,
    ));
    updateBuilder();
  }
}
