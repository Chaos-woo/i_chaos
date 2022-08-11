import 'package:redstonex/src/app-configs/user-configs/global_app_configs.dart';
import 'package:redstonex/src/app-configs/user-configs/global_http_option_configs.dart';
import 'package:redstonex/src/app-configs/user-configs/global_log_configs.dart';
import 'package:redstonex/src/commons/standards/of_syntax.dart';
import 'package:redstonex/src/commons/utils/reference_utils.dart';

/// A global configuration.
///
/// If want to custom app global configuration, extending this
/// configuration class and override the attribute that want to
/// customize putting it in GetX bean container tagged
/// [GlobalConfig.fixedGlobalConfigTag].
///
class GlobalConfig with OfSyntax {
  static const String fixedGlobalConfigTag = 'fixedGlobalConfigTag';

  /// Get GetX bean container [GlobalConfig] instance
  static GlobalConfig of() =>
      ReferenceUtils.find<GlobalConfig>(tag: GlobalConfig.fixedGlobalConfigTag);

  /// Safety put global configuration in GetX bean container.
  ///
  /// Default global configuration will put in container when built-in initialing,
  /// using the same tag replace default configuration when want to.
  static void safePutGlobalConfig(GlobalConfig customGlobalConfig) {
    if (ReferenceUtils.exist<GlobalConfig>(tag: fixedGlobalConfigTag)) {
      ReferenceUtils.remove<GlobalConfig>(tag: fixedGlobalConfigTag);
    }

    ReferenceUtils.put<GlobalConfig>(customGlobalConfig, tag: fixedGlobalConfigTag);
  }

  /// Current development mode whether debug mode
  bool get debugMode => false;

  /// global configuration of app
  GlobalAppConfigs get globalAppConfigs => GlobalAppConfigs();

  /// global configuration of log
  GlobalLogConfigs get globalLogConfigs => GlobalLogConfigs();

  /// global configuration of http
  GlobalHttpOptionConfigs get globalHttpOptionConfigs => GlobalHttpOptionConfigs();
}