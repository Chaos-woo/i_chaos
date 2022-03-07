import 'package:flustars/flustars.dart';
import 'package:flutter/material.dart';
import 'package:oktoast/oktoast.dart';

mixin ToastMixin {
  static const TextStyle defaultTextStyle =
      TextStyle(color: Colors.white, fontSize: 14, decoration: TextDecoration.none, fontWeight: FontWeight.w200);

  void showSimpleToast(
    String? msg, {
    Duration? duration = const Duration(seconds: 2),
    ToastPosition? position = ToastPosition.bottom,
    TextStyle? textStyle = defaultTextStyle,
    Color? backgroundColor = const Color.fromRGBO(0, 0, 0, 0.4),
    double? radius = 20,
    TextAlign? textAlign = TextAlign.center,
  }) {
    if (msg != null && msg.isNotEmpty) {
      showToast(msg,
          duration: duration, position: position,
          textStyle: textStyle, backgroundColor: backgroundColor,
          radius: radius, textAlign: textAlign);
    }
  }

  void showRichToast(List<TextSpan> textSpans,
      {Duration? duration = const Duration(seconds: 2),
      ToastPosition? position = ToastPosition.bottom,
      TextStyle? textStyle = defaultTextStyle,
      Color? backgroundColor = const Color.fromRGBO(0, 0, 0, 0.4),
      double? radius = 20,
      int? textSpanLineFeedCnt,
      int? maxLines = 10}) {

    if (textSpans.isEmpty) {
      showSimpleToast('');
    }

    final Widget richText = RichText(
      text: TextSpan(children: _getRichText(textSpans, textSpanLineFeedCnt)),
      overflow: TextOverflow.ellipsis,
      maxLines: maxLines,
    );

    final Widget richTextRow = Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Expanded(
          child: richText,
        )
      ],
    );

    final Widget toast = Container(
      margin: const EdgeInsets.fromLTRB(10, 10, 10, 0),
      padding: const EdgeInsets.all(10),
      width: ScreenUtil.getInstance().screenWidth - 20,
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.all(Radius.circular(radius!)),
      ),
      child: richTextRow,
    );

    showToastWidget(toast, duration: duration, position: position);
  }

  List<TextSpan> _getRichText(List<TextSpan> textSpans, int? textSpanLineFeedCnt) {
    List<TextSpan> textSpansNot = textSpans;
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

  TextStyle toastRichStyle(Color color) {
    return TextStyle(color: color, fontSize: 14, decoration: TextDecoration.none, fontWeight: FontWeight.w200);
  }
}
