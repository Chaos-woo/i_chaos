// 视图元数据

import 'package:get/get.dart';

enum ViewType { page, widget }

class ViewMetadata<T extends GetxController> {
  /// ***** 必填属性
  final List<String> errorMsgs = [];
  late ViewType viewType;

  /// ***** 可填属性
  late DateTime createAt;
  late DateTime disposeAt;
  late String moduleBy;

  /// ***** 可选属性
  String? builderId;
  String? usingCtrlTag;

  ViewMetadata.init(
    this.viewType, {
    String? moduleBy,
    this.builderId,
    this.usingCtrlTag,
  }) {
    createAt = DateTime.now();
    this.moduleBy = moduleBy ?? 'no module';
  }

  void addError(String msg) => errorMsgs.add(msg);
}
