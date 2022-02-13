import 'package:flustars/flustars.dart';
import 'package:flutter/material.dart';
import 'package:i_chaos/base_framework/widget_state/page_state.dart';

// 抽象透明页面
abstract class AbstractTransparentPageY<R extends Object> extends PageState with SingleTickerProviderStateMixin {
  /// 可自定义参数
  // 组件最大高度
  late double? widgetMaxHeight;

  // 组件移动时间
  late int? animationDuration;

  // 进入方向
  late bool? topStartDirection;

  // 组件上方padding或组件下方padding
  late double? topPadding;

  // 关闭或重新打开距离标识比例
  late int? reOpenRadio;

  // 背景透明度
  late double? opacity;

  // 触摸透明区域是否可退出当前页
  late bool? canBeCloseByTouchTransparentArea;

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
    topPadding = 0;
    canBeCloseByTouchTransparentArea = true;

    initPageParams();

    if (widgetMaxHeight == null) {
      throw Exception('transparent page[vertical] max height can not be null');
    }

    topStartDirection = topStartDirection ?? true;
    // 初始根据进入方向来判断距离top的位置
    _startPos = topStartDirection! ? -widgetMaxHeight! - topPadding! : _screenHeight;
    reOpenRadio = reOpenRadio ?? 3;
    _reOpenOrCloseFlagDistance = (widgetMaxHeight! + topPadding!) / reOpenRadio!;
    opacity = opacity ?? 0.3;

    _realStartPos = EdgeInsets.only(top: _startPos);
    // 结束位置根据进入方向来判断距离top的位置
    EdgeInsets realEndPos =
        topStartDirection! ? EdgeInsets.only(top: 0 + topPadding!) : EdgeInsets.only(top: _screenHeight - widgetMaxHeight! - topPadding!);

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
          onTapUp: (details) {
            double dx = details.globalPosition.dx;
            double dy = details.globalPosition.dy;
            if (topStartDirection!
                && (dy > (widgetMaxHeight! + topPadding!) || dy < topPadding!)
                && canBeCloseByTouchTransparentArea!) {
              close(topStartDirection! ? 0.0 : _screenHeight - widgetMaxHeight! - topPadding!);
            }

            if (!topStartDirection!
                && (dy < (_screenHeight - widgetMaxHeight! - topPadding!) || (dy < _screenHeight && dy > _screenHeight - topPadding!))
                && canBeCloseByTouchTransparentArea!) {
              close(topStartDirection! ? 0.0 : _screenHeight - widgetMaxHeight! - topPadding!);
            }
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
    closeAndReturn(start, null);
  }

  Future<void> directClose() async {
    await controller.reverse(from: double.parse(animationDuration!.toString()));
    pop();
  }

  closeAndReturn(double start, R? result) {
    controller.reverse(from: double.parse(animationDuration!.toString())).whenComplete(() {
      pop(result: Future.value(result));
    });
  }

  popAndReturn(R? result) {
    closeAndReturn(topStartDirection! ? 0.0 : _screenHeight - widgetMaxHeight! - topPadding!, result);
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
    if ((startPoint.dy - lastPoint.dy).abs() < _reOpenOrCloseFlagDistance!) {
      close(_startPos);
    } else {
      reOpen(_startPos);
    }
  }
}
