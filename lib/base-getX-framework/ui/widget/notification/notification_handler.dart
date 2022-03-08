// ignore_for_file: avoid_function_literals_in_foreach_calls

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:i_chaos/base-getX-framework/ui/widget/notification/abstract_notification.dart';
import 'package:i_chaos/base-getX-framework/ui/widget/notification/notification_entry.dart';

class NotificationHandler extends AbstractNotification {
  static NotificationHandler? _singleton;

  factory NotificationHandler() => getInstance()!;

  static NotificationHandler? getInstance() {
    _singleton ??= NotificationHandler._();
    return _singleton;
  }

  // 批量通知是否全部显示完毕
  bool streamDone = true;

  late StreamController<NotifyListItemWrapper?> _streamController;
  late StreamSink<NotifyListItemWrapper?> _sink;
  late StreamSubscription<NotifyListItemWrapper?> _subscription;

  Completer? listCompleter;

  NotificationHandler._() {
    _streamController = StreamController<NotifyListItemWrapper?>();
    _sink = _streamController.sink;
    _subscription = _streamController.stream.listen((event) {
      if (event == null) {
        streamDone = true;
        if (!_subscription.isPaused) {
          _subscription.pause();
        }
        if (listCompleter != null) {
          listCompleter!.complete();
          listCompleter = null;
        }
        return;
      }
      _subscription.pause();
      showNotificationFromTop(
        child: event.child,
        animationDuration: event.animationDuration,
        notifyDwellTime: event.notifyDwellTime,
      );
    });

    _subscription.pause();
  }

  ///注册监听列表
  final List<NotifyStatusListener> _listeners = [];

  void _notifyListener(NotifyStatus notifyStatus) {
    _listeners.forEach((element) {
      element(notifyStatus);
    });
  }

  /// @param [animationDuration] child 从顶部滑出/收回所需时间
  /// @param [notifyDwellTime]  通知 停留时间
  @override
  Future showNotificationFromTop({
    required Widget child,
    Duration? animationDuration,
    Duration? notifyDwellTime,
  }) async {
    Completer completer = Completer();
    NotifyOverlayEntry notifyOverlayEntry = NotifyOverlayEntry(
      child,
      animationDuration ?? const Duration(milliseconds: 500),
      notifyDwellTime ?? const Duration(seconds: 2000),
      onNotifyDone: () {
        completer.complete();
        if (!streamDone) {
          _subscription.resume();
        }

        // 通知结束回调
        _notifyListener(NotifyStatus.completed);
      },
    );

    _notifyListener(NotifyStatus.running);
    Overlay.of(context!)!.insert(notifyOverlayEntry.overlayEntry!);
    return completer.future;
  }

  /// if you wanna custom show type or anyway,
  /// plz refer to the [showNotificationFromTop] method.
  @override
  Future? showNotificationCustom({Widget? child, Duration? animationDuration, Duration? notifyDwellTime}) {
    return null;
  }

  @override
  void addNotifyListener(NotifyStatusListener listener) {
    _listeners.add(listener);
  }

  @override
  void removeNotifyListener(NotifyStatusListener listener) {
    _listeners.remove(listener);
  }

  @override
  void clearAllListener() {
    _listeners.clear();
  }

  ///批量显示通知
  /// * 依然要慎重使用，例如： 服务器积压过多通知，导致用户界面长期弹出通知造成较差的用户体验
  @override
  Future showNotifyListFromTop({
    required List<Widget> children,
    Duration? animationDuration,
    Duration? notifyDwellTime,
  }) async {
    listCompleter = Completer();

    children.forEach((element) {
      _sink.add(NotifyListItemWrapper(element, animationDuration, notifyDwellTime));
    });
    _sink.add(null);
    if (streamDone) {
      streamDone = false;
      _subscription.resume();
    }

    return listCompleter!.future;
  }
}
