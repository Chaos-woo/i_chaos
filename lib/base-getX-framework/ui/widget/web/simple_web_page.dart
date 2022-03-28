/*
*
* 普通网页展示，需要的也可以自定义
*/

import 'package:flutter/material.dart';
import 'package:i_chaos/base-getX-framework/ui/widget/web/simple_web_controller.dart';
import 'package:i_chaos/base-getX-framework/view/base_controller_view.dart';
import 'package:i_chaos/base-getX-framework/view/page/single_page_controller_view.dart';
import 'package:webview_flutter/webview_flutter.dart';

class SimpleWebPage extends SinglePageControllerView<SimpleWebController> {
  SimpleWebPage({Key? key}) : super(key: key);

  @override
  ViewWidgetBuilder viewWidgetBuilder(BuildContext context, SimpleWebController controller) {
    return ViewWidgetBuilder(
      view: view(),
    );
  }

  Widget view() {
    return Scaffold(
      appBar: commonAppBar(title: controller.web.title),
      body: Container(
        width: screenWidth,
        height: leftAppBarHeight,
        color: Colors.grey[300],
        child: Expanded(
          child: WebView(initialUrl: controller.web.uri, javascriptMode: JavascriptMode.unrestricted),
        ),
      ),
    );
  }
}
