import 'package:flutter/material.dart';
import 'package:i_chaos/base-getX-framework/ui/widget/notification/abstract_notification.dart';
import 'package:i_chaos/base-getX-framework/ui/widget/notification/notification-type/top_notification_widget.dart';

// 通知内容实体
class NotifyOverlayEntry {
  // 通知的内容组件
  final Widget notifyWidget;
  // 通知滑出所需时间
  final Duration animationDuration;
  // 通知停滞时间
  final Duration notifyDwellTime;
  // 通知结束回调
  final VoidCallback onNotifyDone;
  // 通知类型（动画）
  final NotifyType notifyType;
  OverlayEntry? entry;

  // 是否通知完成
  bool notifyDone = false;

  OverlayEntry? get overlayEntry => entry;

  NotifyOverlayEntry(
    this.notifyWidget,
    this.animationDuration,
    this.notifyDwellTime, {
    required this.onNotifyDone,
    this.notifyType = NotifyType.fromTop,
  }) {
    _createOverlay();
  }

  /// 根据类型 构建不同显示方式的通知
  /// 目前只有一个从顶部滑出的方式
  void _createOverlay() {
    switch (notifyType) {
      case NotifyType.fromTop:
        entry = OverlayEntry(builder: (ctx) {
          return TopNotificationWidget(
            notifyWidget,
            animationDuration,
            notifyDwellTime,
            (notifyDone) {
              this.notifyDone = notifyDone;
              if (notifyDone) overlayEntry!.remove();
              onNotifyDone.call();
            },
          );
        });
        break;
    }
  }
}

// 通知操作模块
class NotifyListItemWrapper {
  final Widget child;
  final Duration? animationDuration;
  final Duration? notifyDwellTime;

  NotifyListItemWrapper(this.child, this.animationDuration, this.notifyDwellTime);
}
