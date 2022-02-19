/*
* 用于显示富文本
*/

import 'package:flutter/material.dart';
import 'package:i_chaos/base_framework/widget_state/page_state.dart';
import 'package:webview_flutter/webview_flutter.dart';

class HtmlPageState extends PageState {
  final String htmlContent;

  HtmlPageState(this.htmlContent);

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
              initialUrl: Uri.dataFromString(htmlContent, mimeType: 'text/html').toString(),
            ),
          ),
        ],
      ),
    ));
  }
}
