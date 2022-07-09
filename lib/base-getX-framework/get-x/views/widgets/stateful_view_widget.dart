import 'package:flutter/material.dart';
import 'package:i_chaos/base-getX-framework/get-x/views/base-views/base-view/additional/partial_builder.dart';
import 'package:i_chaos/base-getX-framework/get-x/views/base-views/base-view/models/view_metadata.dart';
import 'package:i_chaos/base-getX-framework/get-x/views/base-views/stateful/stateful_generator.dart';
import 'package:i_chaos/base-getX-framework/get-x/views/base-views/stateful/stateful_view.dart';
import 'package:i_chaos/base-getX-framework/get-x/views/view_mixin_export.dart';

abstract class StatefulViewWidget extends StatefulGeneratorView
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
        StatefulGenerator,
        PartialBuilder
    implements StatefulView {
  StatefulViewWidget({Key? key}) {
    initViewReference();
    initViewRes();
  }

  @override
  void initViewReference() {
    // TODO: implement initViewReference
  }

  @override
  void initViewRes() {
    // TODO: implement initViewRes
  }

  @override
  void initViewState() {
    // TODO: implement initViewState
  }

  @override
  void preDispose() {
    // TODO: implement preDispose
  }

  @override
  String? moduleBy() => null;

  @override
  String? builderIdBy() => null;

  @override
  late ViewMetadata meta;

  @override
  late BuildContext rootCtx;

  Widget widgetBuilder();

  void didUpdate(covariant StatefulWidget oldWidget) => () {};

  void didChange() => () {};

  @override
  void initState() {
    super.initState();
    meta = ViewMetadata.init(ViewType.widget, moduleBy: moduleBy());
    initViewState();
  }

  @override
  void dispose() {
    preDispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    rootCtx = context;
    return widgetBuilder();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    didChange();
  }

  @override
  void didUpdateWidget(covariant StatefulWidget oldWidget) {
    super.didUpdateWidget(oldWidget);
    didUpdate(oldWidget);
  }
}
