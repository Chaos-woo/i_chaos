import 'package:flutter/material.dart';
import 'package:i_chaos/base_framework/widget_state/page_state.dart';
import 'package:i_chaos/ichaos/public/config/design_config.dart';

///非业务型异常展示的页面

class ExceptionPageState extends PageState {
  final String exception;
  final String stack;

  ExceptionPageState(this.exception, this.stack);

  @override
  Widget build(BuildContext context) {
    return switchStatusBar2Dark(
        isSetDark: true,
        child: Container(
          color: Colors.white,
          width: DesignConfig.designWidth.w,
          height: DesignConfig.designHeight.h,
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  exception,
                  style: const TextStyle(color: Colors.black),
                ),
                50.hGap,
                Text(
                  stack,
                  style: const TextStyle(color: Colors.blue),
                ),
              ],
            ),
          ),
        ));
  }
}
