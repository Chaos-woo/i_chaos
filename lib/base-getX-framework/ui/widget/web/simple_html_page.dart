import 'package:flutter/material.dart';
import 'package:i_chaos/base-getX-framework/ui/widget/web/simple_html_controller.dart';
import 'package:i_chaos/base-getX-framework/view/base_controller_view.dart';
import 'package:i_chaos/base-getX-framework/view/page/single_page_controller_view.dart';
import 'package:webview_flutter/webview_flutter.dart';

class SimpleHtmlPage extends SinglePageControllerView<SimpleHtmlCtrl> {
  SimpleHtmlPage({Key? key}) : super(key: key);

  @override
  ViewWidgetBuilder viewWidgetBuilder(BuildContext context, SimpleHtmlCtrl controller) {
    return ViewWidgetBuilder(
      viewBuilder: <SimpleHtmlController>(ctrl) {
        return view();
      }
    );
  }

  Widget view() {
    return Scaffold(
      appBar: backNavBar(title: controller.html.title),
      body: Container(
        width: screenWidth,
        height: remainHeightWithoutAppBar,
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
