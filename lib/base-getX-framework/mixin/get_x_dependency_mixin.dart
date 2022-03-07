
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:i_chaos/base-getX-framework/view-model/base_view_state_controller.dart';

mixin GetXDependencyMixin {
  K findDependency<K extends BaseViewStateController>({String? tag}) {
    return Get.find<K>(tag: tag);
  }

  K putDependency<K extends BaseViewStateController>(K dependency, {String? tag}) {
    return Get.put<K>(dependency, tag: tag);
  }
}