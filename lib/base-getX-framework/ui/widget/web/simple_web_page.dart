/*
*
* 普通网页展示，需要的也可以自定义
*/

import 'package:flutter/material.dart';
import 'package:i_chaos/base-getX-framework/ui/widget/web/simple_web_controller.dart';
import 'package:i_chaos/base-getX-framework/view/base_controller_view.dart';
import 'package:i_chaos/base-getX-framework/view/page/single_page_controller_view.dart';
import 'package:webview_flutter/webview_flutter.dart';

class SimpleWebPage extends SinglePageControllerView<SimpleWebCtrl> {
  SimpleWebPage({Key? key}) : super(key: key);

  @override
  ViewWidgetBuilder viewWidgetBuilder(BuildContext context, SimpleWebCtrl controller) {
    return ViewWidgetBuilder(
      viewBuilder: <SimpleWebController>(ctrl) {
        return view();
      },
    );
  }

  Widget view() {
    return Scaffold(
      appBar: backNavBar(title: controller.web.title),
      body: Container(
        width: screenWidth,
        height: remainHeightWithoutAppBar,
        color: Colors.grey[300],
        child: Expanded(
          child: WebView(initialUrl: controller.web.uri, javascriptMode: JavascriptMode.unrestricted),
        ),
      ),
    );
  }
}
