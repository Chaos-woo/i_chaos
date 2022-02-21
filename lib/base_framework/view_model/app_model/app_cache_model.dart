import 'package:flutter/material.dart';
import 'package:i_chaos/base_framework/utils/platform_utils.dart';
import 'package:package_info_plus/package_info_plus.dart';

/// 应用缓存

class AppCacheModel extends ChangeNotifier {
  late PackageInfo packageInfo;
  late String appVersion;
  String? buildNum;

  AppCacheModel() {
    initAppInfo();
  }

  initAppInfo() async {
    packageInfo = await PlatformUtils.getAppPackageInfo();
    appVersion = await PlatformUtils.getAppVersion();
    buildNum = await PlatformUtils.getBuildNum();
  }
}
