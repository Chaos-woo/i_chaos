
import 'package:i_chaos/base-getX-framework/view-model/single_view_state_ctrl.dart';

class SimpleHtmlCtrl<SimpleHtml> extends SingleViewStateCtrl<SimpleHtml> {
  late final SimpleHtml html;

  @override
  Future<SimpleHtml?> loadData() {
    html = argument<SimpleHtml>();
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