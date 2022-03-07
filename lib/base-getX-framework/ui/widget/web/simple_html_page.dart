import 'package:flutter/material.dart';
import 'package:i_chaos/base-getX-framework/ui/widget/web/simple_html_controller.dart';
import 'package:i_chaos/base-getX-framework/view/page/single_page_controller_view.dart';

import 'package:webview_flutter/webview_flutter.dart';

class SimpleHtmlPage extends SinglePageControllerView<SimpleHtmlController> {
  SimpleHtmlPage({Key? key}) : super(key: key);

  @override
  Widget viewBuilder(BuildContext context, SimpleHtmlController controller) {
    return Scaffold(
      appBar: commonAppBar(title: controller.html.title),
      body: Container(
        width: screenWidth,
        height: leftAppBarHeight,
        color: Colors.grey[300],
        child: Expanded(
          child: WebView(
            initialUrl: Uri.dataFromString(controller.html.uri, mimeType: 'text/html').toString(),
          ),
        ),
      ),
    );
  }
}
