
import 'package:flutter/material.dart';
import 'package:i_chaos/base-getX-framework/ui/widget/notification/notification_handler.dart';

// 通知状态
enum NotifyStatus { running, completed }

// 通知显示类型
enum NotifyType {
  // 顶部滑出
  fromTop
}

// 通知状态回调
typedef NotifyStatusListener = void Function(NotifyStatus notifyStatus);
typedef NotifyDoneCallback = void Function(bool notifyDone);

abstract class AbstractNotification {
  BuildContext? context;

  // 建议在根页面调用此方法
  void init(BuildContext context) {
    if (this.context != null) {
      return;
    }
    this.context = context;
  }

  Future showNotificationFromTop(
      {required Widget child,
        Duration? animationDuration,
        Duration? notifyDwellTime,});

  Future showNotifyListFromTop(
      {required List<Widget> children,
        Duration? animationDuration,
        Duration? notifyDwellTime,});

  Future? showNotificationCustom(
      {required Widget child,
        Duration? animationDuration,
        Duration? notifyDwellTime});

  void addNotifyListener(NotifyStatusListener listener);

  void removeNotifyListener(NotifyStatusListener listener);

  void clearAllListener();

  ///特殊情况，你需要刷新context
  /// * 一般情况下，在项目根页面初始化[NotificationHandler]后，不需要下面这个方法
  /// * 如果你在子页面，即生命周期较短的页面来初始化后，再次使用可能需要调用此方法
  void refreshContext(BuildContext context) {
    this.context = context;
  }
}
