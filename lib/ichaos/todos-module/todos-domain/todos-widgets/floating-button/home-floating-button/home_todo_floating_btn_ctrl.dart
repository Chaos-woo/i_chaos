import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:i_chaos/base-getX-framework/events/event_bus_helper.dart';
import 'package:i_chaos/base-getX-framework/get-x/ctrls/running_state_ctrl.dart';
import 'package:i_chaos/ichaos/common-module/extensions/date_time_extension.dart';
import 'package:i_chaos/ichaos/todos-module/todos-domain/todos-common/events/publishers/todos_event_publisher.dart';
import 'package:i_chaos/ichaos/todos-module/todos-domain/todos-common/events/todos_date_change_event.dart';
import 'package:i_chaos/ichaos/todos-module/todos-domain/todos-widgets/floating-button/home-floating-button/home_todo_slide_btns.dart';

enum FloatBtnStatus { show, hide }

class HomeTodoFloatingBtnCtrl extends RunningStateCtrl implements GetxService {
  bool? isSlideHide; // 是否滑动隐藏
  ValueChanged<bool>? slideCb;
  bool isToday = true;
  late StreamSubscription _dateChangeCert;

  bool get hide => isSlideHide ?? false;

  @override
  void initStateRes() {
    HomeTodoSlideBtnsCtrl slideBtnsCtrl = findReference();
    registerBtnSlide((isSlideHide) {
      if (isSlideHide) {
        slideBtnsCtrl.slideOutScreen();
      } else {
        slideBtnsCtrl.slideBackScreen();
      }
    });

    _dateChangeCert = EventBusHelper().subscribe<TodosDateChangeEvent>((event) {
      if (event.selectedDate.isToday()) {
        isToday = true;
      } else {
        isToday = false;
      }
      updateBuilder();
    });
  }

  @override
  void releaseStateRes() {
    _dateChangeCert.cancel();
  }

  void registerBtnSlide(ValueChanged<bool> slideCb) {
    this.slideCb = slideCb;
  }

  void notify(FloatBtnStatus status) {
    isSlideHide = status == FloatBtnStatus.hide;
    slideCb?.call(hide);
  }

  void back2Today() {
    TodosDateChangeEvent event = TodosDateChangeEvent(
      selectedDate: DateTime.now(),
      publisher: TodosEventPublisher.homeFloatingButton,
    );
    EventBusHelper().fire(event);
  }
}
