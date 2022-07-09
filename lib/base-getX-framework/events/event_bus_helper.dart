import 'dart:async';

import 'package:event_bus/event_bus.dart';

class EventBusHelper {
  static final EventBusHelper _instance = EventBusHelper._internal();
  static final EventBus _bus = EventBus();

  factory EventBusHelper() => _instance;

  EventBusHelper._internal();

  Future<void> fire<T>(T event) => Future.delayed(Duration.zero, () => _bus.fire(event));

  StreamSubscription subscribeAutoCancelOnError<T>(
    void Function(T event) onData, {
    Function? onError,
    void Function()? onDone,
  }) {
    return subscribe<T>(
      onData,
      onError: onError,
      onDone: onDone,
      cancelOnError: true,
    );
  }

  StreamSubscription subscribe<T>(
    void Function(T event) onData, {
    Function? onError,
    void Function()? onDone,
    bool? cancelOnError,
  }) {
    StreamSubscription subscription = _bus.on<T>().listen(
          onData,
          onError: onError,
          onDone: onDone,
          cancelOnError: cancelOnError,
        );
    // 调用cancel()取消订阅
    return subscription;
  }

  StreamSubscription subscribeAll(
    void Function(dynamic event) onData, {
    Function? onError,
    void Function()? onDone,
    bool? cancelOnError,
  }) {
    StreamSubscription subscription = _bus.on().listen(
          onData,
          onError: onError,
          onDone: onDone,
          cancelOnError: cancelOnError,
        );
    // 调用cancel()取消订阅
    return subscription;
  }
}
