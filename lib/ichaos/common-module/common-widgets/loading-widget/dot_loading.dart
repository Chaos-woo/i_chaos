// ignore_for_file: must_be_immutable, prefer_initializing_formals

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:i_chaos/base-getX-framework/utils/image_helper.dart';
import 'package:i_chaos/ichaos/common-module/resources/app_style.dart';

class DotLoadingWidget extends StatefulWidget {
  late Duration intervalDuration;
  late String text;
  late TextStyle textStyle;
  late String loadingText;

  // 点的上限数量
  late int dotTotal;
  Widget? loadingImage;

  DotLoadingWidget({
    Key? key,
    Duration interval = const Duration(milliseconds: 100),
    String text = '',
    TextStyle? textStyle,
    String loadingText = '.',
    int dotTotal = 3,
    this.loadingImage,
  }) : super(key: key) {
    intervalDuration = interval;
    this.text = text;
    this.textStyle = textStyle ??
        TextStyle(
            fontWeight: AppStyle.fontWidget.normal,
            fontSize: AppStyle.fontSize.small_12);
    this.loadingText = loadingText;
    this.dotTotal = dotTotal;
  }

  @override
  _DotLoadingWidgetState createState() => _DotLoadingWidgetState();
}

class _DotLoadingWidgetState extends State<DotLoadingWidget> {
  // 当前已有的点数量
  int _currDotCnt = 1;

  late Timer? _timer;

  @override
  void initState() {
    super.initState();
    _startLoadingTimer();
  }

  @override
  void didUpdateWidget(covariant DotLoadingWidget oldWidget) {
    super.didUpdateWidget(oldWidget);
    _currDotCnt = 1;
    _startLoadingTimer();
  }

  @override
  void dispose() {
    super.dispose();
    // 在页面回收或滑动复用回收的时候一定要把 timer 清除
    if (_timer != null) {
      if (_timer!.isActive) {
        _timer!.cancel();
        _timer = null;
      }
    }
  }

  void _startLoadingTimer() {
    _timer = Timer.periodic(widget.intervalDuration, (timer) {
      try {
        setState(() {
          _currDotCnt = _nextDotCnt();
        });
      } catch (e) {
        if (_timer != null) {
          if (_timer!.isActive) {
            _timer!.cancel();
            _timer = null;
          }
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    Widget loadingTextWidget = _loadingDot();
    if (widget.loadingImage != null) {
      return ImageHelper.imgWidget.vPromptImgWidget(
        image: widget.loadingImage!,
        textWidget: loadingTextWidget,
      );
    } else {
      return loadingTextWidget;
    }
  }

  Widget _loadingDot() {
    return RichText(
      text: TextSpan(text: widget.text, style: widget.textStyle, children: [
        for (int i = 0; i < _currDotCnt; i++)
          TextSpan(text: widget.loadingText, style: widget.textStyle),
      ]),
    );
  }

  int _nextDotCnt() {
    return _currDotCnt < widget.dotTotal ? _currDotCnt + 1 : 1;
  }
}
