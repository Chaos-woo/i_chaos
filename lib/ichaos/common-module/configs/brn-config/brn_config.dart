import 'dart:async';

import 'package:bruno/bruno.dart';
import 'package:get/get.dart';
import 'package:i_chaos/base-getX-framework/events/event_bus_helper.dart';
import 'package:i_chaos/ichaos/common-module/events/app_theme_event.dart';

class BrnConfigCtrl extends GetxController implements GetxService {
  static BrnAllThemeConfig defaultAllConfig = BrnAllThemeConfig(commonConfig: defaultCommonConfig);

  /// 全局配置
  static BrnCommonConfig defaultCommonConfig = BrnCommonConfig();

  late StreamSubscription _subscription;

  @override
  void onInit() {
    super.onInit();
    _subscription = registerBrnConfig();
  }

  @override
  void onClose() {
    unRegisterBrnConfig();
  }

  StreamSubscription registerBrnConfig() {
    return EventBusHelper().subscribe<AppThemeModeEvent>((event) {});
  }

  void unRegisterBrnConfig() => _subscription.cancel();
}
