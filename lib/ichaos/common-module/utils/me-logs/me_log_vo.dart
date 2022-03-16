import 'package:i_chaos/ichaos/public/config/log/log_level.dart';
import 'package:i_chaos/ichaos/common-module/extensions/date_time_extension.dart';

class MeLog {
  static const String _divide = '||';

  late MeLogLevel _level;
  late String _message;
  late Map<String, Object> _extra;
  late DateTime _timestamp;

  MeLog({level = MeLogLevel.INFO, message = ''}) {
    _level = level;
    _message = message;
    _extra = {};
  }

  void msg(Object msg) {
    _message = msg.toString();
  }

  void level(MeLogLevel level) {
    _level = level;
  }

  void extra(String key, Object msg) {
    _extra[key] = msg;
  }

  @override
  String toString() {
    _timestamp = DateTime.now();
    String extraInfo = '{';
    if (_extra.isNotEmpty) {
      for (final key in _extra.keys) {
        extraInfo = '$extraInfo$key:${_extra[key]}$_divide';
      }
      extraInfo = extraInfo.replaceRange(extraInfo.length - _divide.length, extraInfo.length, '');
      extraInfo = extraInfo + '}';
    }
    String log = 'MeLog<level: $_level, message: $_message, timestamp: ${_timestamp.yyyyMMddHHmmss}';
    return _extra.isEmpty ? log + '>' : log + ', extra: $extraInfo>';
  }
}
