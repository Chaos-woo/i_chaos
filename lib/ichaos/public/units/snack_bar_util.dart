import 'package:flustars/flustars.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:getwidget/colors/gf_color.dart';
import 'package:oktoast/oktoast.dart';

class SnackBarUtil {
  static const ToastPosition top = ToastPosition(align: Alignment.topCenter, offset: 0);
  static const ToastPosition bottom = ToastPosition(align: Alignment.topCenter, offset: 75.0);

  static void topBar(String content, {Duration? duration = const Duration(seconds: 3)}) {
    Widget _snackContainer = SafeArea(
        child: Container(
      padding: const EdgeInsets.all(6),
      width: ScreenUtil.getInstance().screenWidth,
      decoration: const BoxDecoration(color: GFColors.DARK),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Expanded(
              child: Text(
            content,
            style: const TextStyle(color: GFColors.WHITE, fontSize: 14, decoration: TextDecoration.none, fontWeight: FontWeight.w200),
            overflow: TextOverflow.ellipsis,
            maxLines: 1,
          ))
        ],
      ),
    ));

    showToastWidget(_snackContainer, duration: duration, position: top);
  }
}
