import 'package:flutter/material.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:i_chaos/base-getX-framework/commons/base-module/toast-module/toast_additional.dart';
import 'package:i_chaos/base-getX-framework/commons/base-module/toast-module/toast_msg.dart';

mixin ToastMixin {
  static const String _emptyMsg = '';

  void showToast(
    String? msg, {
    Duration animationDuration = const Duration(milliseconds: 200),
    AlignmentGeometry alignment = Alignment.bottomCenter,
    Duration holdTime = const Duration(milliseconds: 2000),
    SmartToastType toastType = SmartToastType.normal,
  }) {
    SmartDialog.showToast(
      msg ?? '',
      animationTime: animationDuration,
      alignment: alignment,
      displayTime: holdTime,
      displayType: toastType,
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

  void normalToast({
    required ToastMsg toastMsg,
    required ToastAdditional additional,
  }) {
    SmartDialog.showToast(
      _emptyMsg,
      builder: (_) => SizedBox.expand(
        child: toastMsg.iconToast(),
      ),
      animationTime: additional.animationTime,
      alignment: additional.alignment,
      displayTime: additional.holdTime,
      displayType: additional.toastType,
    );
  }

  void normalToastMsg(String msg) {
    normalToast(
      toastMsg: ToastMsg.msg(msg),
      additional: ToastAdditional.normalCenter(msg),
    );
  }

  void normalIconToast(String msg, IconData preIcon) {
    normalToast(
      toastMsg: ToastMsg.iconMsg(msg, preIcon),
      additional: ToastAdditional.normalCenter(msg),
    );
  }
}
