import 'package:i_chaos/ichaos/public/config/log/log_level.dart';

class MeLog {
  static const String _DIVISION = ' || ';

  late MeLogLevel _level;
  late String _message;
  late Map<String, Object> _extra;
  late DateTime _timestamp;

  MeLog({level = MeLogLevel.INFO, message = ''}) {
    _level = level;
    _message = message;
    _extra = {};
  }

  MeLog msg(Object msg) {
    _message = msg.toString();
    return this;
  }

  MeLog level(MeLogLevel level) {
    _level = level;
    return this;
  }

  MeLog extra(String key, Object msg) {
    _extra[key] = msg;
    return this;
  }

  @override
  String toString() {
    _timestamp = DateTime.now();
    var timestamp = _timestamp.microsecondsSinceEpoch;
    String extraInfo = '{';
    if (_extra.isNotEmpty) {
      for (final key in _extra.keys) extraInfo = extraInfo + '$key' + ':' + '${_extra[key]}' + _DIVISION;
      extraInfo = extraInfo.replaceRange(extraInfo.length - _DIVISION.length, extraInfo.length, '');
      extraInfo = extraInfo + '}';
    }
    String log = 'MeLog<level: $_level, message: $_message, timestamp: $timestamp';
    return _extra.isEmpty ? log + '>' : log + ', extra: $extraInfo>';
  }
}
