
import 'package:common_utils/common_utils.dart';

const String _yyyyMMddHHmmss = 'yyyy-MM-dd HH:mm:ss';
const String _yyyyMMdd = 'yyyy-MM-dd';
// ignore: constant_identifier_names
const String _HHmm = 'HH:mm';
const String _beginPointOfDay = 'yyyy-MM-dd 00:00:00';
const String _endPointOfDay = 'yyyy-MM-dd 23:59:59';

class DayDateUtil {
  static String beginOfDay() => DateUtil.formatDate(DateTime.now(), format: _beginPointOfDay);
  static String endOfDay() => DateUtil.formatDate(DateTime.now(), format: _endPointOfDay);
  static String beginOfAssignDay(DateTime dateTime) => DateUtil.formatDate(dateTime, format: _beginPointOfDay);
  static String endOfAssignDay(DateTime dateTime) => DateUtil.formatDate(dateTime, format: _endPointOfDay);
  static DateTime tomorrow() => DateTime.now().add(const Duration(days: 1));
}

/// 日期时间扩展
extension DateTimeExtension on DateTime {

  // 格式化指定格式时间字符串
  String get yyyyMMddHHmmss => DateUtil.formatDate(this, format: _yyyyMMddHHmmss);
  String get yyyyMMdd => DateUtil.formatDate(this, format: _yyyyMMdd);
  // ignore: non_constant_identifier_names
  String get HHmm => DateUtil.formatDate(this, format: _HHmm);
  DateTime get beginPoint => DateTime.parse(DateUtil.formatDate(this, format: _beginPointOfDay));
  DateTime get endPoint => DateTime.parse(DateUtil.formatDate(this, format: _endPointOfDay));

  // 获取所选日期的周一的日期
  DateTime get monday => subtract(Duration(days: weekday - 1));

  bool isToday() {
    DateTime now = DateTime.now();
    return now.year == year && now.month == month && now.day == day;
  }

  bool isSameDay(DateTime date) {
    return date.year == year && date.month == month && date.day == day;
  }
}

/// 时间字符串扩展
extension DateTimeStringExtension on String {
  DateTime get dateTime => DateTime.parse(this);
}

