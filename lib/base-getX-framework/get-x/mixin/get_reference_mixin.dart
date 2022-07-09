import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

mixin GetXReferenceMixin {
  K findReference<K extends GetxController>({String? tag}) {
    return Get.find<K>(tag: tag);
  }

  K putReference<K extends GetxController>(K dependency, {String? tag}) {
    return Get.put<K>(dependency, tag: tag);
  }

  void lazyPutReference<K extends GetxController>(K dependency, {String? tag}) {
    Get.lazyPut<K>(() => dependency, tag: tag);
  }

  bool existReference<K extends GetxController>({String? tag}) {
    return Get.isRegistered<K>(tag: tag);
  }

  void removeReference<K extends GetxController>({String? tag}) {
    Get.delete<K>(tag: tag);
  }

  Future<void> safeRemoveReference<K extends GetxController>({String? tag}) async {
    if (Get.isRegistered<K>(tag: tag)) {
      Get.delete<K>(tag: tag);
    }
  }

  // ************ 静态方法版本
  static K findRef<K extends GetxController>({String? tag}) {
    return Get.find<K>(tag: tag);
  }

  static K putRef<K extends GetxController>(K dependency, {String? tag}) {
    return Get.put<K>(dependency, tag: tag);
  }

  static void lazyPutRef<K extends GetxController>(K dependency, {String? tag}) {
    Get.lazyPut<K>(() => dependency, tag: tag);
  }

  static bool existRef<K extends GetxController>({String? tag}) {
    return Get.isRegistered<K>(tag: tag);
  }
}
