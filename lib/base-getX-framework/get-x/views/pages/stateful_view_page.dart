import 'package:flutter/material.dart';
import 'package:i_chaos/base-getX-framework/get-x/views/base-views/base-view/additional/partial_builder.dart';
import 'package:i_chaos/base-getX-framework/get-x/views/base-views/base-view/models/view_metadata.dart';
import 'package:i_chaos/base-getX-framework/get-x/views/base-views/stateful/stateful_generator.dart';
import 'package:i_chaos/base-getX-framework/get-x/views/base-views/stateful/stateful_view.dart';
import 'package:i_chaos/base-getX-framework/get-x/views/view_mixin_export.dart';

abstract class StatefulPage extends StatefulGeneratorView
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
  StatefulPage({Key? key}) {
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

  Widget pageBuilder();

  @override
  void initState() {
    super.initState();
    initViewState();
  }

  @override
  void dispose() {
    preDispose();
    super.dispose();
  }

  void _initMetaData() {
    rootCtx = context;
    meta = ViewMetadata.init(ViewType.page, moduleBy: moduleBy());
  }

  @override
  Widget build(BuildContext context) {
    _initMetaData();
    return pageBuilder();
  }

  // 因混入AutomaticKeepAliveClientMixin必须重写build()方法，因此子类需要调用父类处理元数据
  void withAutomaticKeepAliveClientMixin() {
    _initMetaData();
  }
}
