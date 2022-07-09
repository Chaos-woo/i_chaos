import 'package:get/get.dart';
import 'package:i_chaos/base-getX-framework/get-x/views/view_mixin_export.dart';

abstract class GetXBindingsGuider extends Bindings with DelayedMixin, ScreenMixin, GetXReferenceMixin, GetXNavigationMixin {
  @override
  void dependencies() {
    putBindingReferences();
  }

  void putBindingReferences();
}