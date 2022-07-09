import 'package:flutter/material.dart';
import 'package:i_chaos/base-getX-framework/flutter3-pak-process/widget-chain/widget_chain.dart';
import 'package:i_chaos/base_framework/widget_state/widget_state.dart';
import 'package:i_chaos/generated/l10n.dart';
import 'package:i_chaos/ichaos/public/extension/date_time_extension.dart';
import 'package:i_chaos/ichaos/public/units/snack_bar_util.dart';
import 'package:i_chaos/ichaos/todo/todo-domain/core/widgets/calendar/calendar_bar_vm.dart';
import 'package:i_chaos/ichaos/todo/todo-domain/core/widgets/filtered/filtered_tab_bar_vm.dart';
import 'package:provider/provider.dart';

import 'month_calendar_page.dart';

class CalendarImage extends WidgetState {
  final CalendarBarVM _calendarBarVM;

  CalendarImage(this._calendarBarVM);

  @override
  Widget build(BuildContext context) {
    double calendarImageChunkWidth = screenWidth / 10 * 1.5 - 1;
    double calendarImageWidth = calendarImageChunkWidth - 12;
    double calendarLTRBRadius = 3;

    // ignore: prefer_function_declarations_over_variables
    final VoidCallback imageOnTap = () async {
      DateTime? selectDate = await push(PageMonthCalendar(
        calendarBarVM: _calendarBarVM,
        barrierDismissible: false,
      ));
      final calendarBarVM = Provider.of<CalendarBarVM>(context, listen: false);
      if (selectDate != null && !calendarBarVM.selectDate.isSameDay(selectDate)) {
        showRichToast([
          TextSpan(text: '${S.of(context).todo_calendar_switch_toast_text1} ', style: SnackBarUtil.defaultStyle),
          TextSpan(text: selectDate.yyyyMMdd, style: toastRichStyle(Colors.orange)),
        ]);

        calendarBarVM.jumpToToday(selectDate);
      }
    };

    final Widget yearContainer = Container(
      width: calendarImageWidth,
      height: calendarImageWidth / 3,
      decoration: BoxDecoration(
        color: const Color(0xFFFF5650),
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(calendarLTRBRadius),
            topRight: Radius.circular(
              calendarLTRBRadius,
            )),
      ),
      child: Selector<FilteredTabBarVM, int>(
        selector: (ctx, vm) => vm.currentDate.year,
        shouldRebuild: (pre, next) => pre != next,
        builder: (ctx, currentYear, child) {
          return Text(
            '$currentYear',
            style: const TextStyle(
              color: Colors.white,
              fontFamily: 'Lexend Deca',
              fontWeight: FontWeight.w500,
              fontSize: 12,
            ),
          );
        },
      ).asList().intoRow(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
          ),
    );

    final Widget monthContainer = Container(
      width: calendarImageWidth,
      height: calendarImageWidth / 3 * 2,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(calendarLTRBRadius),
            bottomRight: Radius.circular(
              calendarLTRBRadius,
            )),
      ),
      child: Selector<FilteredTabBarVM, int>(
        selector: (ctx, vm) => vm.currentDate.month,
        shouldRebuild: (pre, next) => pre != next,
        builder: (ctx, currentMonth, child) {
          return Text(
            '$currentMonth',
            style: const TextStyle(
              color: Colors.black87,
              fontFamily: 'Lexend Deca',
              fontWeight: FontWeight.w900,
              fontSize: 24,
            ),
          );
        },
      ).asList().intoRow(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
          ),
    );

    return InkWell(
      onTap: imageOnTap,
      child: Container(
        width: calendarImageChunkWidth,
        padding: const EdgeInsets.fromLTRB(6, 10, 6, 10),
        height: 68,
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(bottomLeft: Radius.circular(15)),
          color: Colors.teal,
        ),
        child: Container(
          width: calendarImageWidth,
          height: calendarImageWidth,
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(6)),
            boxShadow: [BoxShadow(color: Colors.black12, offset: Offset(2, 2), blurRadius: 1, spreadRadius: 0)],
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              yearContainer,
              monthContainer,
            ],
          ),
        ),
      ),
    );
  }
}
