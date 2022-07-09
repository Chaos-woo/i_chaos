import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:i_chaos/base-getX-framework/get-x/views/additional/rx_ctrl_views.dart';
import 'package:i_chaos/base-getX-framework/get-x/views/base-views/base-view/additional/partial_builder.dart';
import 'package:i_chaos/base-getX-framework/get-x/views/base-views/base-view/additional/view_ctrl_get.dart';
import 'package:i_chaos/base-getX-framework/get-x/views/base-views/base-view/models/view_metadata.dart';
import 'package:i_chaos/base-getX-framework/get-x/views/base-views/stateless/stateless_view.dart';
import 'package:i_chaos/base-getX-framework/get-x/views/view_mixin_export.dart';

abstract class StatelessCtrlPage<T extends GetxController> extends GetView<T>
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
        RxCtrlViews,
        PartialBuilder
    implements StatelessView, ViewCtrlGet<T> {
  StatelessCtrlPage({Key? key}) : super(key: key) {
    initViewReference();
    initViewRes();
  }

  @override
  late ViewMetadata meta;

  @override
  late T metaCtrl;

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

  Widget ctrlPageBuilder();

  @override
  Widget build(BuildContext context) {
    rootCtx = context;
    metaCtrl = controller;
    meta = ViewMetadata<T>.init(
      ViewType.page,
      moduleBy: moduleBy(),
      builderId: builderIdBy(),
      usingCtrlTag: tag,
    );
    return ctrlPageBuilder();
  }
}
