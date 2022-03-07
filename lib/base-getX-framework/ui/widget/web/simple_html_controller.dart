
import 'package:i_chaos/base-getX-framework/view-model/single_view_state_controller.dart';

class SimpleHtmlController<SimpleHtml> extends SingleViewStateController<SimpleHtml> {
  late final SimpleHtml html;

  @override
  Future<SimpleHtml?> loadData() {
    html = getRouteArguments<SimpleHtml>();
    return Future.value(html);
  }

  @override
  void onLoadCompleted(SimpleHtml? data) {
  }

}

class SimpleHtml {
  final String uri;
  final String title;

  SimpleHtml(this.uri, this.title);
}