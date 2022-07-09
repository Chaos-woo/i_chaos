/*
* Author : LiJiqqi
* Date : 2020/4/24
*/

import 'package:flutter/material.dart';
import 'package:i_chaos/base_framework/widget_state/base_stateless_widget.dart';
import 'package:shimmer/shimmer.dart';

///骨架屏 建议用stateless

abstract class BaseSkeletonWidget extends BaseStatelessWidget {
  ///确保全局骨架 颜色一致
  final Color skeletonColor = const Color.fromRGBO(221, 221, 221, 1);
  final Color baseColor = const Color(0xFFE0E0E0);
  final Color highLightColor = const Color(0xFFF5F5F5);

  final bool _enabled = true;

  const BaseSkeletonWidget({Key? key}) : super(key: key);

  ///自动给child 增加 闪闪亮特效！
  Widget getShimmer(Widget child) {
    return Shimmer(
      gradient: LinearGradient(
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
          colors: <Color>[
            baseColor,
            baseColor,
            highLightColor,
            baseColor,
            baseColor
          ],
          stops: const <double>[
            0.0,
            0.35,
            0.5,
            0.65,
            1.0
          ]),
//                baseColor: Colors.grey[300],
//                highlightColor: Colors.grey[100],
      enabled: _enabled,
      child: child,
    );
  }
}
