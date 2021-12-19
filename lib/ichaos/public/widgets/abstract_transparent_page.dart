import 'package:flustars/flustars.dart';
import 'package:flutter/material.dart';
import 'package:i_chaos/base_framework/widget_state/page_state.dart';

// 抽象透明页面
abstract class AbstractTransparentPageX extends PageState with SingleTickerProviderStateMixin {
  /// 可自定义参数
  // 组件最大宽度
  late double? widgetMaxWidth;
  // 组件移动时间
  late int? animationDuration;
  // 进入方向
  late bool? leftStartDirection;
  // 关闭或重新打开距离标识比例
  late int? reOpenRadio;
  // 背景透明度
  late double? opacity;

  late AnimationController controller;
  late Animation animation;
  late EdgeInsets _realStartPos;
  final double _screenWidth = ScreenUtil.getInstance().screenWidth;

  // 组件初始位置
  late double _startPos;

  // 关闭或重新打开距离标识
  late double? _reOpenOrCloseFlagDistance;

  // 滑动时开始和结束的点
  late Offset startPoint;
  late Offset lastPoint;

  @override
  void initState() {
    widgetMaxWidth = null;
    leftStartDirection = null;
    _realStartPos = const EdgeInsets.only(left: 0.0);
    animationDuration = 200;
    reOpenRadio = 3;
    opacity = 0.3;

    initPageParams();

    if (widgetMaxWidth == null) {
      throw Exception('transparent page[horizontal] max width can not be null');
    }

    leftStartDirection = leftStartDirection ?? true;
    // 初始根据进入方向来判断距离left的位置
    _startPos = leftStartDirection! ? -widgetMaxWidth! : _screenWidth;
    reOpenRadio = reOpenRadio ?? 3;
    _reOpenOrCloseFlagDistance = widgetMaxWidth! / reOpenRadio!;
    opacity = opacity ?? 0.3;

    _realStartPos = EdgeInsets.only(left: _startPos);
    // 结束位置根据进入方向来判断距离left的位置
    EdgeInsets realEndPos = leftStartDirection! ? const EdgeInsets.only(left: 0) : EdgeInsets.only(left: _screenWidth - widgetMaxWidth!);

    controller = AnimationController(vsync: this, duration: Duration(milliseconds: animationDuration!));
    animation = EdgeInsetsTween(begin: _realStartPos, end: realEndPos).animate(controller);
    super.initState();

    animation.addListener(() {
      _realStartPos = animation.value;
      _startPos = _realStartPos.left;
      setState(() {});
    });

    WidgetsBinding.instance!.addPostFrameCallback((timeStamp) {
      controller.forward();
    });
  }

  // 初始化页面参数
  void initPageParams();

  // 构建页面组件
  Widget buildWidget(BuildContext context);

  // 自定义组件销毁
  void prePageDispose();

  @override
  void dispose() {
    controller.dispose();
    prePageDispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Material(
        color: Colors.transparent,
        child: GestureDetector(
          onHorizontalDragStart: dragStart,
          onHorizontalDragUpdate: dragUpdate,
          onHorizontalDragEnd: dragEnd,
          onVerticalDragStart: dragStartV,
          onVerticalDragUpdate: dragUpdateV,
          onVerticalDragEnd: dragEndV,
          onTap: () {
            close(leftStartDirection! ? 0.0 : _screenWidth - widgetMaxWidth!);
          },
          child: Container(
            color: Color.fromRGBO(34, 34, 34, opacity!),
            width: _screenWidth,
            height: ScreenUtil.getInstance().screenHeight,
            child: Stack(
              children: <Widget>[
                Positioned(
                  left: _startPos,
                  child: buildWidget(context),
                ),
              ],
            ),
          ),
        ));
  }

  dragStart(DragStartDetails details) {
    startPoint = details.globalPosition;
  }

  dragUpdate(DragUpdateDetails details) {
    final Offset delta = details.delta;
    setState(() {
      _startPos += delta.dx;
    });
    lastPoint = details.globalPosition;
  }

  dragEnd(DragEndDetails details) {
    if ((leftStartDirection! && _startPos < _reOpenOrCloseFlagDistance!) ||
        (!leftStartDirection! && _startPos > widgetMaxWidth! + _reOpenOrCloseFlagDistance!)) {
      close(_startPos);
    } else {
      reOpen(_startPos);
    }
  }

  close(double start) {
    controller.reverse(from: double.parse(animationDuration!.toString())).whenComplete(() {
      pop();
    });
  }

  reOpen(double start) {
    controller.reset();
    controller.forward(from: double.parse(animationDuration!.toString()));
  }

  /// vertical
  dragStartV(DragStartDetails details) {}

  dragUpdateV(DragUpdateDetails details) {}

  dragEndV(DragEndDetails details) {}
}

abstract class AbstractTransparentPageY extends PageState with SingleTickerProviderStateMixin {
  /// 可自定义参数
  // 组件最大高度
  late double? widgetMaxHeight;
  // 组件移动时间
  late int? animationDuration;
  // 进入方向
  late bool? topStartDirection;
  // 关闭或重新打开距离标识比例
  late int? reOpenRadio;
  // 背景透明度
  late double? opacity;

  late AnimationController controller;
  late Animation animation;
  late EdgeInsets _realStartPos;
  final double _screenHeight = ScreenUtil.getInstance().screenHeight;

  // 组件初始位置
  late double _startPos;

  // 关闭或重新打开距离标识
  late double? _reOpenOrCloseFlagDistance;

  // 滑动时开始和结束的点
  late Offset startPoint;
  late Offset lastPoint;

  @override
  void initState() {
    widgetMaxHeight = null;
    topStartDirection = null;
    _realStartPos = const EdgeInsets.only(top: 0.0);
    animationDuration = 200;
    reOpenRadio = 3;
    opacity = 0.3;

    initPageParams();

    if (widgetMaxHeight == null) {
      throw Exception('transparent page[vertical] max height can not be null');
    }

    topStartDirection = topStartDirection ?? true;
    // 初始根据进入方向来判断距离top的位置
    _startPos = topStartDirection! ? -widgetMaxHeight! : _screenHeight;
    reOpenRadio = reOpenRadio ?? 3;
    _reOpenOrCloseFlagDistance = widgetMaxHeight! / reOpenRadio!;
    opacity = opacity ?? 0.3;

    _realStartPos = EdgeInsets.only(top: _startPos);
    // 结束位置根据进入方向来判断距离top的位置
    EdgeInsets realEndPos = topStartDirection! ? const EdgeInsets.only(top: 0) : EdgeInsets.only(top: _screenHeight - widgetMaxHeight!);

    controller = AnimationController(vsync: this, duration: Duration(milliseconds: animationDuration!));
    animation = EdgeInsetsTween(begin: _realStartPos, end: realEndPos).animate(controller);
    super.initState();

    animation.addListener(() {
      _realStartPos = animation.value;
      _startPos = _realStartPos.top;
      setState(() {});
    });

    WidgetsBinding.instance!.addPostFrameCallback((timeStamp) {
      controller.forward();
    });
  }

  // 初始化页面参数
  void initPageParams();

  // 构建页面组件
  Widget buildWidget(BuildContext context);

  // 自定义组件销毁
  void prePageDispose();

  @override
  void dispose() {
    controller.dispose();
    prePageDispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Material(
        color: Colors.transparent,
        child: GestureDetector(
          onHorizontalDragStart: dragStart,
          onHorizontalDragUpdate: dragUpdate,
          onHorizontalDragEnd: dragEnd,
          onVerticalDragStart: dragStartV,
          onVerticalDragUpdate: dragUpdateV,
          onVerticalDragEnd: dragEndV,
          onTap: () {
            close(topStartDirection! ? 0.0 : _screenHeight - widgetMaxHeight!);
          },
          child: Container(
            color: Color.fromRGBO(34, 34, 34, opacity!),
            width: ScreenUtil.getInstance().screenWidth,
            height: _screenHeight,
            child: Stack(
              children: <Widget>[
                Positioned(
                  top: _startPos,
                  child: buildWidget(context),
                ),
              ],
            ),
          ),
        ));
  }

  dragStart(DragStartDetails details) {}

  dragUpdate(DragUpdateDetails details) {}

  dragEnd(DragEndDetails details) {}

  close(double start) {
    controller.reverse(from: double.parse(animationDuration!.toString())).whenComplete(() {
      pop();
    });
  }

  reOpen(double start) {
    controller.reset();
    controller.forward(from: double.parse(animationDuration!.toString()));
  }

  /// vertical
  dragStartV(DragStartDetails details) {
    startPoint = details.globalPosition;
  }

  dragUpdateV(DragUpdateDetails details) {
    final Offset delta = details.delta;
    setState(() {
      _startPos += delta.dy;
    });
    lastPoint = details.globalPosition;
  }

  dragEndV(DragEndDetails details) {
    if ((topStartDirection! && _startPos < _reOpenOrCloseFlagDistance!) ||
        (!topStartDirection! && _startPos > widgetMaxHeight! + _reOpenOrCloseFlagDistance!)) {
      close(_startPos);
    } else {
      reOpen(_startPos);
    }
  }
}