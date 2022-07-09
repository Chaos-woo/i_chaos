

import 'package:flutter/material.dart';
import 'package:i_chaos/ichaos/todos-module/todos-domain/todos-common/card-module/card_module_mixin.dart';

// 耗时信息
class CardCostModule with CardModule {
  @override
  Widget toWidget() {
    // TODO: implement toWidget
    throw UnimplementedError();
  }

}

// 是否添加到系统日历信息
class CardSystemCalendarModule with CardModule {
  final bool isAddToSystemCalendar;

  CardSystemCalendarModule(this.isAddToSystemCalendar);

  @override
  Widget toWidget() {
    // TODO: implement toWidget
    throw UnimplementedError();
  }

}

// 超时信息
class CardOvertimeModule with CardModule {
  final DateTime fixedTime;
  final Color currentWarningColor;

  CardOvertimeModule(this.fixedTime, this.currentWarningColor);

  @override
  Widget toWidget() {
    // TODO: implement toWidget
    throw UnimplementedError();
  }

}

// 反思信息，卡片翻转
class CardReviewModule with CardModule {
  final String reviewText;

  CardReviewModule(this.reviewText);

  @override
  Widget toWidget() {
    // TODO: implement toWidget
    throw UnimplementedError();
  }

}