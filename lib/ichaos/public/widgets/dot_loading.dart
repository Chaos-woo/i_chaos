// ignore_for_file: must_be_immutable, prefer_initializing_formals

import 'dart:async';

import 'package:flutter/material.dart';

class DotLoading extends StatefulWidget {
  late Duration intervalDuration;
  late String text;
  late TextStyle textStyle;
  late String similarDotText;

  DotLoading({Key? key, Duration interval = const Duration(milliseconds: 100), String text = '', TextStyle? textStyle, String similarDotText = '.'}) : super(key: key) {
    intervalDuration = interval;
    // ignore: prefer_initializing_formals
    this.text = text;
    this.textStyle = textStyle ?? const TextStyle(color: Color(0xFF757575), fontFamily: 'Lexend Deca', fontWeight: FontWeight.w500, fontSize: 12);
    this.similarDotText = similarDotText;
  }

  @override
  _DotLoadingState createState() => _DotLoadingState();
}

class _DotLoadingState extends State<DotLoading> {
  // 点的上限数量
  final int _dotTotal = 3;

  // 当前已有的点数量
  int _currDotCnt = 1;

  late Timer? _timer;

  @override
  void initState() {
    super.initState();
    _startLoadingTimer();
  }

  @override
  void didUpdateWidget(covariant DotLoading oldWidget) {
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
      setState(() {
        _currDotCnt = _nextDotCnt();
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return _widgetLoadingDot();
  }

  Widget _widgetLoadingDot() {
    return RichText(
      text: TextSpan(text: widget.text, style: widget.textStyle, children: [
        for (int i = 0; i < _currDotCnt; i++) TextSpan(text: widget.similarDotText, style: widget.textStyle),
      ]),
    );
  }

  int _nextDotCnt() {
    return _currDotCnt < _dotTotal ? _currDotCnt + 1 : 1;
  }
}