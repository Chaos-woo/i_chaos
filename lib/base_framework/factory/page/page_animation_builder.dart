import 'package:flutter/material.dart';
import 'package:i_chaos/base_framework/ui/anim/page_route_anim/fade_animation.dart';
import 'package:i_chaos/base_framework/ui/anim/page_route_anim/no_animation.dart';
import 'package:i_chaos/base_framework/ui/anim/page_route_anim/size_scale_animation.dart';
import 'package:i_chaos/base_framework/ui/anim/page_route_anim/slide_animation.dart';

final PageAnimationBuilder? pageBuilder = PageAnimationBuilder.getInstance();

///动画枚举类，这个你可以根据需求自定义
///但最好保持代码这个结构

enum PageAnimation { fade, scale, slide, non }

class PageAnimationBuilder {
  static PageAnimationBuilder? singleton;

  static PageAnimationBuilder? getInstance() {
    singleton ??= PageAnimationBuilder._();
    return singleton;
  }

  PageAnimationBuilder._();

  Route<dynamic> wrapWithNoAnimation(Widget page, RouteSettings routeSettings) {
    return NoAnimRouteBuilder(page, routeSettings);
  }

  /// fade
  Route<dynamic> wrapWithFadeAnimation(Widget page, RouteSettings routeSettings) {
    return FadeRouteBuilder(page, routeSettings);
  }

  /// slide
  Route<dynamic> wrapWithSlideAnimation(Widget page, RouteSettings routeSettings) {
    return SlideRightRouteBuilder(page, routeSettings);
  }

  Route<dynamic> wrapWithSlideTopAnimation(Widget page, RouteSettings routeSettings) {
    return SlideTopRouteBuilder(page, routeSettings);
  }

  /// scale
  Route<dynamic> wrapWithScaleAnimation(Widget page, RouteSettings routeSettings) {
    return ScaleRouteBuilder(page, routeSettings);
  }
}
