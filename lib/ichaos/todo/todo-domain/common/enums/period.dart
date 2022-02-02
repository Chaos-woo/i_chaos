class Period {
  final int day;
  final int code;
  final String desc;
  final String abbr;

  Period._(this.day, this.code, this.desc, this.abbr);

  @override
  String toString() => 'Period:day_$day,code:$code,$desc,$abbr';

  static Period day_0 = Period._(-1, 0, '一次性', 'only one');
  static Period day_1 = Period._(1, 1, '周一', 'mon');
  static Period day_2 = Period._(2, 2, '周二', 'tue');
  static Period day_3 = Period._(3, 4, '周三', 'wed');
  static Period day_4 = Period._(4, 8, '周四', 'thu');
  static Period day_5 = Period._(5, 16, '周五', 'fri');
  static Period day_6 = Period._(6, 32, '周六', 'sat');
  static Period day_7 = Period._(7, 64, '周日', 'sun');

  // ignore: non_constant_identifier_names
  static Period day_n = Period._(0, 127, '每天', 'every');

  static List<Period> weeks = [
    day_1, day_2, day_3, day_4, day_5, day_6, day_7
  ];

  static bool containsDayN(Period day, int code) {
    if (!weeks.contains(day) || code < -1 || code > 127) {
      return false;
    }

    ///
    /// func(day_1, 1) => 1&1=1 == 1? true 只有某一天的情况
    /// func(day_3, 6) => 4&6=4 == 4? true 包含某一天的情况
    /// func(day_7, 127) => 64&127=64 == 64? true 同包含某一天情况，127包含了周一~周日
    ///
    return (code & day.code) == day.code;
  }

}