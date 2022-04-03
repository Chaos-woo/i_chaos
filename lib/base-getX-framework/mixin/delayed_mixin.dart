import 'package:flutter/material.dart';

mixin DelayedMixin {
  Future<void> zeroDelay(VoidCallback callback) {
    return Future.delayed(
      const Duration(milliseconds: 0),
    ).whenComplete(callback);
  }

  Future<void> anyDelay(VoidCallback callback, {Duration? duration}) {
    return Future.delayed(
      duration ?? const Duration(milliseconds: 0),
    ).whenComplete(callback);
  }

  Future<R> returnDelay<R>(VoidCallback callback, {Duration? duration}) {
    return Future.delayed(
      duration ?? const Duration(milliseconds: 0),
    ).then((_) => callback.call() as R);
  }
}
