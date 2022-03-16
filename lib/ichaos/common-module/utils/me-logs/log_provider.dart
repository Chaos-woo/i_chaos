import 'package:logger/logger.dart';

class LogProvider {
  const LogProvider._();

  factory LogProvider() => const LogProvider._();

  static final Logger _logger = Logger(filter: _logFilter, printer: _logPrinter, output: null);

  static final LogFilter _logFilter = _CustomLogFilter();
  static final LogPrinter _logPrinter = PrettyPrinter(
    methodCount: 2,
    errorMethodCount: 8,
    lineLength: 120,
    colors: true,
    printEmojis: true,
    printTime: true,
  );

  Logger get logger => _logger;
}

// 自定义日志过滤器
class _CustomLogFilter extends LogFilter {
  @override
  bool shouldLog(LogEvent event) {
    return true;
  }
}
