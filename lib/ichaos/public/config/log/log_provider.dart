import 'package:logger/logger.dart';

class LogProvider {
  static final LogFilter _defaultFilter = _CustomLogFilter();
  static final LogPrinter _defaultPrinter =
      PrettyPrinter(methodCount: 2, errorMethodCount: 8, lineLength: 120, colors: true, printEmojis: true, printTime: false);
  static final Logger _logCache = Logger(filter: _defaultFilter, printer: _defaultPrinter, output: null);

  ///
  /// 获取基本logger对象
  ///
  static Logger get() {
    return _logCache;
  }
}

///
/// 自定义日志过滤器
///
class _CustomLogFilter extends LogFilter {
  @override
  bool shouldLog(LogEvent event) {
    return true;
  }
}
