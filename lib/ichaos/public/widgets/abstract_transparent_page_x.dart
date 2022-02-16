// ignore_for_file: prefer_initializing_formals

import 'package:flustars/flustars.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:i_chaos/base_framework/widget_state/page_state.dart';

enum AtpXPageEnterDirection { left, right }

class AtpXPageConfig {
  // 子组件最大宽度
  late final double childWidgetMaxWidth;
  // 子组件最大高度
  late final double? childWidgetMaxHeight;
  // 动画时长
  late final int animationDuration; // ms
  // 进入方向
  late final AtpXPageEnterDirection direction;
  // 子组件进入方向的透明间隔
  late final double childWidgetPadding;
  // 子组件在一定比例内关闭或重新打开
  late final double reOpenRadio;
  // 子组件容器的背景透明度
  late final double backgroundOpacity;
  // 触摸透明区域是否关闭页面
  late final bool closeByTouchTransparentArea;

  AtpXPageConfig(
      {required double childWidgetMaxWidth,
      double? childWidgetMaxHeight,
      required int animationDuration,
      AtpXPageEnterDirection direction = AtpXPageEnterDirection.left,
      double childWidgetPadding = 0.0,
      double reOpenRadio = 0.5,
      double backgroundOpacity = 0.3,
      bool closeByTouchTransparentArea = true}) : assert (reOpenRadio > 0.0 && reOpenRadio < 1.0){
    this.childWidgetMaxWidth = childWidgetMaxWidth;
    this.childWidgetMaxHeight = childWidgetMaxHeight;
    this.animationDuration = animationDuration; // ms
    this.direction = direction;
    this.childWidgetPadding = childWidgetPadding;
    this.reOpenRadio = reOpenRadio;
    this.backgroundOpacity = backgroundOpacity;
    this.closeByTouchTransparentArea = closeByTouchTransparentArea;
  }
}

// 抽象透明页面
abstract class AbstractTransparentPageX<R extends Object> extends PageState with SingleTickerProviderStateMixin {
  // 页面自定义配置
  late AtpXPageConfig _pageConfig;
  // 动画组件
  late AnimationController _animationController;
  late Animation _animation;
  // 子组件初始位置
  late double _widgetStartPos;
  // 子组件初始位置
  late EdgeInsets _widgetEdgeStartPos;
  // 子组件动画结束位置
  late EdgeInsets _widgetEdgeEndPos;
  // 页面关闭或重开的距离标识
  late double _reOpenOrCloseFlagDistance;
  // 页面进入方向
  late bool _isLeftEnterDirection;
  // 滑动时开始的点
  late Offset _widgetSlideStartPoint;
  // 滑动结束的点
  late Offset _widgetSlideLastPoint;
  // 动画容器包含的子组件
  late final Widget _childWidget;
  // 页面组件
  final ScreenUtil screen = ScreenUtil.getInstance();
  // 子组件首次构建需要使用BuildContext，在didChangeDependencies首次调用后不再构建子组件
  bool _childFirstBuildWithBuildContext = false;

  // 初始化页面参数前的子组件自定义参数初始化
  void childWidgetInitWithoutBuildContext();

  // 初始化页面参数
  AtpXPageConfig? initPageConfig();

  // 构建页面组件，可用context
  Widget buildWidget();

  // 自定义组件销毁
  void pageDispose();

  // 子组件状态初始化，可用context
  void childWidgetInitState();

  Widget get childWidget => _childWidget;

  @override
  void initState() {
    childWidgetInitWithoutBuildContext();
    super.initState();
    // 初始化页面参数
    _initChildPageConfig();
    // 初始化位置参数
    _initChildAnimationPosition();
    // 初始动画组件
    _initAnimation();

    WidgetsBinding.instance!.addPostFrameCallback((timeStamp) {
      _animationController.forward();
    });
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (!_childFirstBuildWithBuildContext) {
      childWidgetInitState();
      // 构建子组件，避免子组件刷新
      _childWidget = buildWidget();
      _childFirstBuildWithBuildContext = true;
    }
  }

  // 页面参数初始化
  void _initChildPageConfig() {
    AtpXPageConfig? childConfig = initPageConfig();
    childConfig ??= AtpXPageConfig(
        childWidgetMaxWidth: screen.screenWidth,
        animationDuration: 200
    );
    _pageConfig = childConfig;
    _isLeftEnterDirection = _pageConfig.direction == AtpXPageEnterDirection.left;
  }

  // 组件动画位置计算
  void _initChildAnimationPosition() {
    double maxWidth = _pageConfig.childWidgetMaxWidth;
    double padding = _pageConfig.childWidgetPadding;
    double screenWidth = screen.screenWidth;

    // 初始根据进入方向来判断距离left的位置
    _widgetStartPos = _isLeftEnterDirection ? - maxWidth - padding : screenWidth;
    _widgetEdgeStartPos = EdgeInsets.only(left: _widgetStartPos);
    // 结束位置根据进入方向来判断距离left的位置
    _widgetEdgeEndPos = _isLeftEnterDirection ? EdgeInsets.only(left: 0 + padding) : EdgeInsets.only(left: screenWidth - maxWidth - padding);

    // 计算滑动开关距离
    _reOpenOrCloseFlagDistance = (maxWidth + padding) * _pageConfig.reOpenRadio;
  }

  // 动画组件初始化
  void _initAnimation() {
    _animationController = AnimationController(vsync: this, duration: Duration(milliseconds: _pageConfig.animationDuration));
    _animation = EdgeInsetsTween(begin: _widgetEdgeStartPos, end: _widgetEdgeEndPos).animate(_animationController);

    // 动画监听
    _animation.addListener(() {
      _widgetEdgeStartPos = _animation.value;
      _widgetStartPos = _widgetEdgeStartPos.left;
      setState(() {});
    });
  }

  @override
  void dispose() {
    _animationController.dispose();
    pageDispose();
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
            double maxWidth = _pageConfig.childWidgetMaxWidth;
            double padding = _pageConfig.childWidgetPadding;

            if (_isLeftEnterDirection
                && (dx > (maxWidth + padding) || dx < padding)
                && _pageConfig.closeByTouchTransparentArea) {

              close(_isLeftEnterDirection ? 0.0 : screen.screenWidth - maxWidth - padding);
            }

            if (!_isLeftEnterDirection
                && (dx < (screen.screenWidth -maxWidth - padding) || (dx < screen.screenWidth && dx > screen.screenWidth - padding))
                && _pageConfig.closeByTouchTransparentArea) {

              close(_isLeftEnterDirection ? 0.0 : screen.screenWidth - maxWidth - padding);
            }
          },
          child: Container(
            color: Color.fromRGBO(34, 34, 34, _pageConfig.backgroundOpacity),
            width: screen.screenWidth,
            height: screen.screenHeight,
            child: Stack(
              children: <Widget>[
                Positioned(
                  left: _widgetStartPos,
                  child: _childWidget,
                ),
              ],
            ),
          ),
        ));
  }

  dragStart(DragStartDetails details) {
    _widgetSlideStartPoint = details.globalPosition;
  }

  dragUpdate(DragUpdateDetails details) {
    final Offset delta = details.delta;
    setState(() {
      _widgetStartPos += delta.dx;
    });
    _widgetSlideLastPoint = details.globalPosition;
  }

  dragEnd(DragEndDetails details) {
    if ((_widgetSlideStartPoint.dx - _widgetSlideLastPoint.dx).abs() > _reOpenOrCloseFlagDistance) {
      close(_widgetStartPos);
    } else {
      reOpen(_widgetStartPos);
    }
  }

  close(double start) {
    closeAndReturn(start, null);
  }

  Future<void> directClose() async {
    await _animationController.reverse(from: double.parse(_pageConfig.animationDuration.toString()));
    pop();
  }

  closeAndReturn(double start, R? result) {
    _animationController.reverse(from: double.parse(_pageConfig.animationDuration.toString())).whenComplete(() {
      pop(result: Future.value(result));
    });
  }

  popAndReturn(R? result) {
    closeAndReturn(_isLeftEnterDirection ? 0.0 : screen.screenWidth - _pageConfig.childWidgetMaxWidth - _pageConfig.childWidgetPadding, result);
  }

  reOpen(double start) {
    _animationController.reset();
    _animationController.forward(from: double.parse(_pageConfig.animationDuration.toString()));
  }

  /// vertical
  dragStartV(DragStartDetails details) {}

  dragUpdateV(DragUpdateDetails details) {}

  dragEndV(DragEndDetails details) {}
}
