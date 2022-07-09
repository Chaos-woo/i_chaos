import 'package:flutter/material.dart';
import 'package:i_chaos/base-getX-framework/get-x/views/base-views/base-view/additional/partial_builder.dart';
import 'package:i_chaos/base-getX-framework/get-x/views/base-views/base-view/models/view_metadata.dart';
import 'package:i_chaos/base-getX-framework/get-x/views/base-views/stateless/stateless_view.dart';
import 'package:i_chaos/base-getX-framework/get-x/views/view_mixin_export.dart';

abstract class StatelessViewWidget extends StatelessWidget
    with
        SmartPopupMixin,
        ToastMixin,
        SmartDialogMixin,
        ManipulateWidgetBinding,
        ScreenMixin,
        GetXNavigationMixin,
        GetXReferenceMixin,
        NavBarMixin,
        DelayedMixin,
        PartialBuilder
    implements StatelessView {
  StatelessViewWidget({Key? key}) : super(key: key) {
    initViewReference();
    initViewRes();
  }

  @override
  late ViewMetadata meta;

  @override
  late BuildContext rootCtx;

  @override
  String? moduleBy() => null;

  @override
  String? builderIdBy() => null;

  @override
  void initViewReference() {
    // TODO: implement initViewReference
  }

  @override
  void initViewRes() {
    // TODO: implement initViewRes
  }

  Widget widgetBuilder();

  @override
  Widget build(BuildContext context) {
    rootCtx = context;
    meta = ViewMetadata.init(ViewType.widget, moduleBy: moduleBy());
    return widgetBuilder();
  }
}
