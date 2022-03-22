import 'package:flutter/material.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';

mixin ToastMixin {
  void showToast(
    String? msg, {
    Duration animationDuration = const Duration(milliseconds: 200),
    AlignmentGeometry alignment = Alignment.bottomCenter,
    Duration holdTime = const Duration(milliseconds: 2000),
    SmartToastType toastType = SmartToastType.normal,
  }) {
    SmartDialog.showToast(
      msg ?? '',
      animationDurationTemp: animationDuration,
      alignment: alignment,
      time: holdTime,
      type: toastType,
    );
  }

  void showCenterToast(
    String? msg, {
    Duration animationDuration = const Duration(milliseconds: 200),
    Duration holdTime = const Duration(milliseconds: 2000),
    SmartToastType toastType = SmartToastType.normal,
  }) {
    showToast(
      msg,
      animationDuration: animationDuration,
      holdTime: holdTime,
      toastType: toastType,
      alignment: Alignment.center,
    );
  }
}
