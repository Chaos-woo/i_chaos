import 'package:flutter/material.dart';
import 'package:i_chaos/base-getX-framework/get-x/views/base-views/abstract-view/abstract_view.dart';
import 'package:i_chaos/base-getX-framework/get-x/views/base-views/base-view/additional/view_module_builder.dart';
import 'package:i_chaos/base-getX-framework/get-x/views/base-views/base-view/models/view_metadata.dart';

// 基础属性定义
abstract class BaseView extends AbstractView implements ViewModuleBuilder {
  late BuildContext rootCtx;
  late ViewMetadata meta;
}
