
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';

mixin GetXNavigationMixin {
  Future<R?>? push<R>(String url, {dynamic arguments}) {
    return Get.toNamed<R>(url, arguments: arguments);
  }

  Future<R?>? pushReplacement<R>(String url, {dynamic arguments}) {
    return Get.offAndToNamed<R>(url, arguments: arguments);
  }

  Future<R?>? pushAndRemoveUntil<R>(String url, {dynamic arguments}) {
    return Get.offAllNamed<R>(url, arguments: arguments);
  }

  void pop<R>({R? result}) {
    Get.back(result: result);
  }

  T getRouteArguments<T>() {
    return Get.arguments as T;
  }

  T getRouteParameters<T>(String name) {
    return Get.parameters[name] as T;
  }
}