import 'package:flutter/material.dart';
import 'package:i_chaos/base-getX-framework/view/page/base_stateless_view.dart';
import 'package:shimmer/shimmer.dart';

abstract class BaseSkeletonWidget extends BaseStatelessView {
  ///确保全局骨架 颜色一致
  final Color skeletonColor = const Color.fromRGBO(221, 221, 221, 1);
  final Color baseColor = const Color(0xFFE0E0E0);
  final Color highLightColor = const Color(0xFFF5F5F5);

  final bool _enabled = true;

  BaseSkeletonWidget({Key? key}) : super(key: key);

  Widget getShimmer(Widget child) {
    return Shimmer(
      gradient: LinearGradient(
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
          colors: <Color>[baseColor, baseColor, highLightColor, baseColor, baseColor],
          stops: const <double>[0.0, 0.35, 0.5, 0.65, 1.0]),
      enabled: _enabled,
      child: child,
    );
  }
}
