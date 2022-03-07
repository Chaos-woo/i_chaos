import 'package:i_chaos/base-getX-framework/utils/platform_utils.dart';
import 'package:i_chaos/base-getX-framework/view-model/base_view_state_controller.dart';
import 'package:package_info_plus/package_info_plus.dart';

// 应用缓存
class AppPakController extends BaseViewStateController {
  // 包信息
  late PackageInfo packageInfo;

  AppPakController();

  // 初始化获取app报信息
  initAppInfo() async {
    packageInfo = await PlatformUtils.getAppPackageInfo();
  }

  @override
  void onStateBizHandle() {
    initAppInfo();
  }

  @override
  void onStateDispose() {}

  @override
  void onStateInit() {}

  @override
  bool stateUpdateViewPredicate(ViewState pre, ViewState next) {
    return false;
  }
}
