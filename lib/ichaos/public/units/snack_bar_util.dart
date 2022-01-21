import 'package:flustars/flustars.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:getwidget/colors/gf_color.dart';
import 'package:oktoast/oktoast.dart';

class SnackBarUtil {
  static const ToastPosition top = ToastPosition(align: Alignment.topCenter, offset: 0);
  static const ToastPosition bottom = ToastPosition(align: Alignment.topCenter, offset: 75.0);

  static const TextStyle defaultStyle = TextStyle(color: GFColors.WHITE, fontSize: 14, decoration: TextDecoration.none, fontWeight: FontWeight.w200);

  static void topBar({String? simpleContent, Duration? duration = const Duration(seconds: 3), List<TextSpan>? textSpans, int? textSpanLineFeedCnt}) {
    Widget _snackContainer = SafeArea(
        child: Container(
      margin: const EdgeInsets.fromLTRB(10, 10, 10, 0),
      padding: const EdgeInsets.all(10),
      width: ScreenUtil.getInstance().screenWidth - 20,
      decoration: const BoxDecoration(
        color: GFColors.DARK,
        borderRadius: BorderRadius.all(Radius.circular(10)),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Expanded(
            child: simpleContent != null
                ? Text(
                    simpleContent,
                    style: const TextStyle(color: GFColors.WHITE, fontSize: 14, decoration: TextDecoration.none, fontWeight: FontWeight.w200),
                    overflow: TextOverflow.ellipsis,
                    maxLines: 10,
                  )
                : RichText(
                    text: TextSpan(children: _getRichText(textSpans, textSpanLineFeedCnt)),
                    overflow: TextOverflow.ellipsis,
                    maxLines: 10,
                  ),
          )
        ],
      ),
    ));

    showToastWidget(_snackContainer, duration: duration, position: top);
  }

  static List<TextSpan> _getRichText(List<TextSpan>? textSpans, int? textSpanLineFeedCnt) {
    if (textSpans == null && textSpanLineFeedCnt == null) {
      throw Exception('SnackBarUtil#_getRichText textSpans and textSpanLineFeedCnt params can not be null together');
    }

    List<TextSpan> textSpansNot = textSpans!;
    int textSpanLineFeedCntNot = textSpanLineFeedCnt!;

    List<TextSpan> spans = [];
    for (int i = 0; i < textSpansNot.length; i++) {
      spans.add(textSpansNot[i]);
      if (textSpanLineFeedCntNot > 0) {
        spans.add(const TextSpan(text: '\n'));
        textSpanLineFeedCntNot--;
      }
    }

    while (textSpanLineFeedCntNot > 0) {
      spans.add(const TextSpan(text: '\n'));
      textSpanLineFeedCntNot--;
    }

    return spans;
  }

  static TextStyle snackBarTextStyleWithColor(Color color) {
    return TextStyle(color: color, fontSize: 14, decoration: TextDecoration.none, fontWeight: FontWeight.w200);
  }
}
