import 'package:flustars/flustars.dart';
import 'package:flutter/material.dart';
import 'package:i_chaos/base_framework/view_model/app_model/locale_model.dart';
import 'package:i_chaos/ichaos/public/widgets/abstract_transparent_page.dart';
import 'package:i_chaos/ichaos/todo/todo-domain/core/widgets/calendar/calendar_bar_vm.dart';
import 'package:provider/provider.dart';
import 'package:table_calendar/table_calendar.dart';

class PageMonthCalendar extends AbstractTransparentPageY<DateTime> {
  late CalendarBarVM? _calendarBarVM;
  late DateTime _selectDate;
  late double _screenWidth;
  late double _screenHeight;
  late double _paddingWidth;
  late double _paddingHeight;
  late double _calendarWidth;
  late double _calendarHeight;

  // 点击透明区域是否可退出页面
  late final bool _canBeCloseByTouchTransparentArea;
  // 点击当天日期时是否可退出页面且返回选择日期
  late final bool _canPopWhenSelectSameDateWithCurrent;

  PageMonthCalendar({CalendarBarVM? calendarBarVM, bool canBeCloseByTouchTransparentArea = true, bool canPopWhenSelectSameDateWithCurrent = false}) {
    _calendarBarVM = calendarBarVM;
    _canBeCloseByTouchTransparentArea = canBeCloseByTouchTransparentArea;
    _canPopWhenSelectSameDateWithCurrent = canPopWhenSelectSameDateWithCurrent;
  }

  @override
  Widget buildWidget(BuildContext context) {
    LocaleModel localeModel = Provider.of<LocaleModel>(context, listen: false);

    return Padding(
      padding: EdgeInsets.only(left: _paddingWidth),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8),
        ),
        width: _calendarWidth,
        height: _calendarHeight,
        child: Align(
          alignment: Alignment.center,
          child: TableCalendar(
            firstDay: _calendarBarVM != null ? _calendarBarVM!.firstDay : DateTime.now(),
            lastDay: _calendarBarVM != null ? _calendarBarVM!.lastDay : CalendarBarVM.publicLastDay,
            headerStyle: const HeaderStyle(formatButtonVisible: false, titleCentered: true),
            focusedDay: _selectDate,
            calendarFormat: CalendarFormat.month,
            locale: localeModel.localeString,
            selectedDayPredicate: (day) {
              return isSameDay(_selectDate, day);
            },
            onDaySelected: (selectedDay, focusedDay) {
              bool isSameDateWithCurrent = isSameDay(_selectDate, selectedDay);

              if (isSameDateWithCurrent && _canPopWhenSelectSameDateWithCurrent) {
                setState(() {
                  _selectDate = selectedDay;
                });
                Future.delayed(const Duration(milliseconds: 50)).whenComplete(() => popAndReturn(selectedDay));
              }

              if (!isSameDateWithCurrent) {
                setState(() {
                  _selectDate = selectedDay;
                });
                Future.delayed(const Duration(milliseconds: 50)).whenComplete(() => popAndReturn(selectedDay));
              }
            },
          ),
        ),
      ),
    );
  }

  @override
  void initPageParams() {
    // 设置动画时长
    animationDuration = 300;
    // 设置当前选择日期
    _selectDate = _calendarBarVM != null ? _calendarBarVM!.selectDate : DateTime.now();
    // 获取屏幕宽度高度
    _screenWidth = ScreenUtil.getInstance().screenWidth;
    _screenHeight = ScreenUtil.getInstance().screenHeight;
    // 设置组件左、上边距
    _paddingWidth = _screenWidth * 0.07;
    _paddingHeight = _screenHeight * 0.2;
    // 设置组件宽度
    _calendarWidth = _screenWidth - 2 * _paddingWidth;
    // 设置组件最大宽度
    _calendarHeight = _calendarWidth + 84;
    widgetMaxHeight = _calendarHeight;
    // 设置组件上方边距
    topPadding = _paddingHeight;
    // 设置拖拉和触摸透明区域不可关闭页面
    canBeCloseByTouchTransparentArea = _canBeCloseByTouchTransparentArea;
  }

  @override
  void prePageDispose() {}
}
