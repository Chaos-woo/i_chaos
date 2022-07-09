
import 'package:i_chaos/base-getX-framework/view-model/single_view_state_ctrl.dart';

class SimpleWebCtrl<SimpleWeb> extends SingleViewStateCtrl<SimpleWeb> {
  late final SimpleWeb web;

  @override
  Future<SimpleWeb?> loadData() {
    web = argument<SimpleWeb>();
    return Future.value(web);
  }

  @override
  void onLoadCompleted(SimpleWeb? data) {
  }

}

class SimpleWeb {
  final String uri;
  final String title;

  SimpleWeb(this.uri, this.title);
}