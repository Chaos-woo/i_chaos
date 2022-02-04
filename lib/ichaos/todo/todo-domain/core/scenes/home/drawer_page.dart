import 'package:flustars/flustars.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:i_chaos/ichaos/public/widgets/abstract_transparent_page.dart';
import 'package:i_chaos/base_framework/extension/size_adapter_extension.dart';

class PageTodoDrawer extends AbstractTransparentPageY {
  @override
  Widget buildWidget(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(0),
      child: Container(
        padding: EdgeInsets.fromLTRB(0, ScreenUtil.getInstance().statusBarHeight, 0, 0),
        color: Colors.red,
        width: 300,
        height: 300.w,
        child: Text('AISKHDFKLASHDJKHASKDJHFASKJHDFGrjgilfdjghiklfgjfkldjgJKASHDFJKHASDKJF'),
      ),
    );
  }

  @override
  initPageParams() {
    widgetMaxHeight = 300.w;
    animationDuration = 400;
    topStartDirection = true;
    topPadding = 0;
  }

  @override
  prePageDispose() {}
}
