// ignore_for_file: no_logic_in_create_state, must_be_immutable, prefer_initializing_formals

import 'package:flutter/material.dart';
import 'package:i_chaos/base_framework/view_model/app_model/locale_model.dart';
import 'package:i_chaos/generated/l10n.dart';
import 'package:i_chaos/ichaos/public/widgets/abstract_transparent_page_y.dart';
import 'package:i_chaos/ichaos/todo/todo-domain/core/widgets/calendar/calendar_bar_vm.dart';
import 'package:provider/provider.dart';
import 'package:table_calendar/table_calendar.dart';

class PageMonthCalendar extends AbstractTransparentPageY<DateTime> {
  late CalendarBarVM? _calendarBarVM;
  late double _paddingWidth;
  late double _calendarWidth;
  late double _calendarHeight;

  // 点击透明区域是否可退出页面
  late final bool _closeByTouchTransparentArea;

  PageMonthCalendar({CalendarBarVM? calendarBarVM, bool closeByTouchTransparentArea = true}) {
    _calendarBarVM = calendarBarVM;
    _closeByTouchTransparentArea = closeByTouchTransparentArea;
  }

  @override
  Widget buildWidget() {
    LocaleModel localeModel = Provider.of<LocaleModel>(context, listen: false);

    return Padding(
      padding: EdgeInsets.only(left: _paddingWidth),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8),
        ),
        width: _calendarWidth,
        child: _WidgetTableCalendar(
          calendarBarVM: _calendarBarVM,
          localeModel: localeModel,
          thisPage: this,
          calendarWidth: _calendarWidth,
        ),
      ),
    );
  }

  @override
  void childWidgetInitWithoutBuildContext() {}

  @override
  AtpYPageConfig initPageConfig() {
    // 获取屏幕宽度高度
    double screenWidth = screen.screenWidth;
    double screenHeight = screen.screenHeight;
    // 设置组件左、上边距
    _paddingWidth = screenWidth * 0.07;
    // 设置组件宽度
    _calendarWidth = screenWidth - 2 * _paddingWidth;
    // 设置组件最大高度
    _calendarHeight = _calendarWidth + 84 + 50;

    return AtpYPageConfig(
        childWidgetMaxHeight: _calendarHeight,
        animationDuration: 250,
        closeByTouchTransparentArea: _closeByTouchTransparentArea,
        childWidgetPadding: (screenHeight - _calendarHeight) * 0.5,
        direction: AtpYPageEnterDirection.bottom);
  }

  @override
  void pageDispose() {}

  @override
  void childWidgetInitState() {}
}

// 日历部分
class _WidgetTableCalendar extends StatefulWidget {
  late CalendarBarVM? calendarBarVM;
  late LocaleModel localeModel;
  late PageMonthCalendar thisPage;
  late double calendarWidth;

  _WidgetTableCalendar(
      {CalendarBarVM? calendarBarVM, required LocaleModel localeModel, required PageMonthCalendar thisPage, required double calendarWidth}) {
    this.calendarBarVM = calendarBarVM;
    this.localeModel = localeModel;
    this.thisPage = thisPage;
    this.calendarWidth = calendarWidth;
  }

  final _WidgetTableCalendarState state = _WidgetTableCalendarState();

  @override
  _WidgetTableCalendarState createState() => state;
}

class _WidgetTableCalendarState extends State<_WidgetTableCalendar> {
  late DateTime _selectDate;
  late final double _btnWidth;

  @override
  void initState() {
    super.initState();
    // 设置当前选择日期
    _selectDate = widget.calendarBarVM != null ? widget.calendarBarVM!.selectDate : DateTime.now();
    _btnWidth = widget.calendarWidth / 2 - 8;
  }

  @override
  Widget build(BuildContext context) {
    final TableCalendar calendar = TableCalendar(
      firstDay: widget.calendarBarVM != null ? widget.calendarBarVM!.firstDay : DateTime.now(),
      lastDay: widget.calendarBarVM != null ? widget.calendarBarVM!.lastDay : CalendarBarVM.publicLastDay,
      headerStyle: const HeaderStyle(formatButtonVisible: false, titleCentered: true),
      focusedDay: _selectDate,
      calendarFormat: CalendarFormat.month,
      locale: widget.localeModel.localeString,
      selectedDayPredicate: (day) {
        return isSameDay(_selectDate, day);
      },
      onDaySelected: (selectedDay, focusedDay) {
        setState(() {
          _selectDate = selectedDay;
        });
      },
    );

    final Widget btnsRow = Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        _widgetInkBtn(S.of(context).month_calendar_page_btn_confirm, () {
          widget.thisPage.popAndReturn(_selectDate);
        }),
        const SizedBox(height: 40, child: VerticalDivider(color: Colors.grey)),
        _widgetInkBtn(S.of(context).month_calendar_page_btn_cancel, () {
          widget.thisPage.popAndReturn(null);
        }),
      ],
    );

    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        calendar,
        const Divider(
          height: 1,
        ),
        btnsRow
      ],
    );
  }

  Widget _widgetInkBtn(String text, VoidCallback onTap) {
    const TextStyle btnTextStyle = TextStyle(fontSize: 18, fontWeight: FontWeight.w400, color: Colors.black, fontFamily: 'Lexend Deca');

    final Widget centerText = Align(
      alignment: Alignment.center,
      child: Text(
        text,
        style: btnTextStyle,
      ),
    );

    return InkWell(
      onTap: onTap,
      child: SizedBox(
        width: _btnWidth,
        height: 50,
        child: centerText,
      ),
    );
  }
}
