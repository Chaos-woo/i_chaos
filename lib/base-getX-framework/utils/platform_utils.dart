import 'package:package_info_plus/package_info_plus.dart';

const bool inProduction = bool.fromEnvironment("dart.vm.product");

class PlatformUtils {
  /// * 获取包信息
  static Future<PackageInfo> getAppPackageInfo() {
    return PackageInfo.fromPlatform();
  }
}
