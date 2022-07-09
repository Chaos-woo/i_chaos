import 'dart:math';

import 'package:flutter/material.dart';

mixin DelayedMixin {
  Future<void> zeroDelay(VoidCallback callback) {
    return Future.delayed(
      const Duration(milliseconds: 0),
    ).whenComplete(callback);
  }

  Future<void> varDelay(VoidCallback callback, {Duration? duration}) {
    return Future.delayed(
      duration ?? const Duration(milliseconds: 0),
    ).whenComplete(callback);
  }

  Future<void> varReplayDelay(VoidCallback callback, int replay, {Duration? duration}) {
    return Future.delayed(
      duration ?? const Duration(milliseconds: 0),
    ).whenComplete(() {
      replay = min(replay, 3);
      for (int i = 0; i < replay; i++) {
        zeroDelay(callback);
      }
    });
  }

  Future<R> returnDelay<R>(VoidCallback callback, {Duration? duration}) {
    return Future.delayed(
      duration ?? const Duration(milliseconds: 0),
    ).then((_) => callback.call() as R);
  }
}
