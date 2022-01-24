import 'package:flustars/flustars.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:i_chaos/ichaos/public/widgets/abstract_transparent_page.dart';
import 'package:i_chaos/base_framework/extension/size_adapter_extension.dart';

class PageTodoDrawer extends AbstractTransparentPageY {
  @override
  Widget buildWidget(BuildContext context) {
    return SafeArea(
        child: Padding(
          padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
          child: Container(
            color: Colors.red,
            width: ScreenUtil.getInstance().screenWidth,
            height: 300.w,
            child: Text('AISKHDFKLASHDJKHASKDJHFASKJHDFGrjgilfdjghiklfgjfkldjgJKASHDFJKHASDKJF'),
          ),
        ));
  }

  @override
  initPageParams() {
    widgetMaxHeight = 300.w;
    animationDuration = 500;
    topStartDirection = false;
    topPadding = 100;
  }

  @override
  prePageDispose() {}
}
