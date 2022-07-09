import 'package:get/get.dart';

enum CtrlState { loading, success, empty, error }

abstract class AbstractViewCtrl extends GetxController {
  @override
  void onInit() {
    super.onInit();
    onStateCtrlInit();
  }

  @override
  void onClose() {
    onStateCtrlPreDispose();
    super.onClose();
  }

  @override
  void onReady() {
    super.onReady();
    onBizDataHandle();
  }

  // 状态初始化
  void onStateCtrlInit();

  // 状态销毁
  void onStateCtrlPreDispose();

  // 数据初始化
  void onBizDataHandle();
}
