import 'package:redstonex/src/app-configs/initial/initializer.dart';
import 'package:redstonex/src/commons/log/loggers.dart';

/// BuiltIn logger initializer.
class BuiltInLoggerInitializer extends Initializer {
  @override
  void init() async {
    /// initial built-in logger
    Loggers.builtInLogger();
  }
}
