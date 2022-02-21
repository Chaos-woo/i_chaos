/*
*
* 普通网页展示，需要的也可以自定义
*/

import 'package:flutter/material.dart';
import 'package:i_chaos/base_framework/widget_state/page_state.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebPageState extends PageState {
  final String url;

  WebPageState(this.url);

  @override
  Widget build(BuildContext context) {
    return switchStatusBar2Dark(
        child: Container(
      width: 750.w,
      height: 1334.h,
      child: Column(
        children: <Widget>[
          commonAppBar(leftWidget: buildAppBarLeft(), leftPadding: 40.w, rightPadding: 40.w),
          Expanded(
            child: WebView(
              initialUrl: url,
              javascriptMode: JavascriptMode.unrestricted,
            ),
          ),
        ],
      ),
    ));
  }
}
