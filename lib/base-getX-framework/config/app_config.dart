

import 'package:i_chaos/base-getX-framework/config/storage_manager.dart';

class AppConfig{
  static init() async {
    // 初始化本地存储工具
    await StorageManager.init();
  }
}