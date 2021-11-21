
import 'package:i_chaos/ichaos/todo/todo-common/enums/period.dart';

class PeriodUnit {
  static const int period = 7;

  ///
  /// 根据给定的数值计算周一~周日哪天被设置为提醒日
  ///
  static List<bool> getPromptWeeks(int code) {
    List<bool> weeks = [false, false, false, false, false, false, false];
    if (code <= 0) {
      return weeks;
    }

    if (code >= 127) {
      return [true, true, true, true, true, true, true];
    }

    for (int i = 0; i < period; i++) {
      weeks[i] = Period.containsDayN(Period.weeks[i], code);
    }
    return weeks;
  }

  ///
  /// 将一周提醒日转换为int值
  ///
  static int getPromptWeeksCode(List<bool> weeks) {
    if(weeks.isEmpty || weeks.length < period) {
      throw Exception('getPromptWeeksCode exception, weeks empty or length < 7');
    }

    int code = 0;
    for (int i = 0; i < period; i++) {
      code += weeks[i] ? Period.weeks[i].code : 0;
    }
    return code;
  }

  ///
  /// 判断今天是否是提醒日
  ///
  static bool isPromptToday(int code) {
    if (code <= 0) {
      return false;
    }

    if (code >= 127) {
      return true;
    }

    int day = DateTime.now().day;
    return Period.containsDayN(Period.weeks[day-1], code);
  }

}
