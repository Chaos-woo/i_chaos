import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';

class ToastAdditional {
  static const Duration defaultHoldTime = Duration(microseconds: 2000);
  static const Duration defaultAnimationTime = Duration(microseconds: 200);

  late SmartToastType toastType;
  late Duration holdTime;
  late AlignmentGeometry alignment;
  late Duration animationTime;

  ToastAdditional.normalCenter(String msg) {
    toastType = SmartToastType.normal;
    holdTime = autoDuration(msg);
    animationTime = defaultAnimationTime;
    alignment = Alignment.center;
  }

  Duration autoDuration(String msg) {
    return msg.isEmpty
        ? defaultHoldTime
        : Duration(seconds: min(msg.length * 0.06 + 0.8, 5.0).ceil());
  }
}
