import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

mixin GetXDependencyMixin {
  K findDependency<K extends GetxController>({String? tag}) {
    return Get.find<K>(tag: tag);
  }

  K putDependency<K extends GetxController>(K dependency, {String? tag}) {
    return Get.put<K>(dependency, tag: tag);
  }

  void lazyPutDependency<K extends GetxController>(K dependency, {String? tag}) {
    Get.lazyPut(() => dependency, tag: tag);
  }

  void removeDependency<K extends GetxController>({String? tag}) {
    Get.delete(tag: tag);
  }
}
