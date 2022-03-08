import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:i_chaos/base-getX-framework/ui/widget/float_container_widget.dart';

// 弹出自定义widget（效果类似dialog）
mixin ManipulateWidgetBinding {
  void floatWidget(
    Widget child, {
    //弹出层的退出由此参数控制
    //默认值Navigator.pop(ctx)，或自定义
    FloatWidgetDismiss? floatWidgetDismiss,
    bool barrierDismissible = false,
    //浮层背景色
    Color bgColor = const Color.fromRGBO(34, 34, 34, 0.3),
    //浮层对齐方式
    Alignment alignment = Alignment.center,
    //回调
    Function? afterPop,
    Function? onComplete,
    //页面进入/退出时间
    Duration transitionDuration = const Duration(milliseconds: 0),
  }) {
//    Navigator.of(context)
//        .push(PageRouteBuilder(
//            settings: const RouteSettings(name: floatLayerRouteName),
//            transitionDuration: transitionDuration,
//            opaque: false,
//            pageBuilder: (ctx, animation, secondAnimation) {
//              return FloatContainerWidget(child,
//                  floatWidgetDismiss: floatWidgetDismiss ?? (ctx) => Navigator.pop(ctx),
//                  barrierDismissible: barrierDismissible,
//                  bgColor: bgColor,
//                  alignment: alignment);
//            }))
//        .then((value) => afterPop ?? () {})
//        .whenComplete(() => onComplete ?? () {});

    Get.to(PageRouteBuilder(
        settings: const RouteSettings(name: floatLayerRouteName),
        transitionDuration: transitionDuration,
        opaque: false,
        pageBuilder: (ctx, animation, secondAnimation) {
          return FloatContainerWidget(child,
              floatWidgetDismiss: floatWidgetDismiss ?? (ctx) => Get.back(),
              barrierDismissible: barrierDismissible,
              bgColor: bgColor,
              alignment: alignment);
        }))!.then((value) => afterPop ?? () {})
        .whenComplete(() => onComplete ?? () {});
  }
}
