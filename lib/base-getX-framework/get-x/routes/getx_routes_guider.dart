import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class GetXRoutesGuider {
  static final List<GetPage> routes = [];

  // 路由初始化
  void initRoutes();

  GetPage normal({
    required String route,
    required Widget page,
    Map<String, String>? parameters,
  }) {
    return GetPage(name: route, page: () => page, parameters: parameters);
  }

  GetPage singleBinding({
    required String route,
    required Widget page,
    required Bindings binding,
    Map<String, String>? parameters,
  }) {
    return GetPage(name: route, page: () => page, binding: binding, parameters: parameters);
  }

  GetPage multiBindings({
    required String route,
    required Widget page,
    required Bindings mainBinding,
    required List<Bindings> otherBindings,
    Map<String, String>? parameters,
  }) {
    return GetPage(
      name: route,
      page: () => page,
      binding: mainBinding,
      bindings: otherBindings,
      parameters: parameters,
    );
  }
}
