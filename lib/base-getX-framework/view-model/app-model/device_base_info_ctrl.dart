import 'dart:io';

import 'package:device_info_plus/device_info_plus.dart';
import 'package:flustars/flustars.dart';
import 'package:i_chaos/base-getX-framework/common/frame_constant.dart';
import 'package:i_chaos/base-getX-framework/view-model/base_view_state_ctrl.dart';

// 设备基本信息
class DeviceBaseInfoCtrl extends BaseViewStateCtrl {
  AndroidDevice? _android;
  IosDevice? _ios;

  DeviceBaseInfoCtrl();

  IosDevice get ios => _ios!;
  AndroidDevice get android => _android!;

  // 组装设备信息
  void assembleDeviceInfo() async {
    DeviceInfoPlugin deviceInfoPlugin = DeviceInfoPlugin();
    assembleAndroid(deviceInfoPlugin);
    assembleIOS(deviceInfoPlugin);
  }

  void assembleAndroid(DeviceInfoPlugin deviceInfoPlugin) async {
    if (Platform.isAndroid) {
      AndroidDeviceInfo android = await deviceInfoPlugin.androidInfo;
      String identifier = android.androidId ?? '';
      _android = AndroidDevice(android, identifier);
      SpUtil.putString(BaseFrameConstant.deviceIdentifier, identifier);
    }
  }

  void assembleIOS(DeviceInfoPlugin deviceInfoPlugin) async {
    if (Platform.isIOS) {
      IosDeviceInfo ios = await deviceInfoPlugin.iosInfo;
      String identifier = ios.identifierForVendor ?? '';
      _ios = IosDevice(ios, identifier);
      SpUtil.putString(BaseFrameConstant.deviceIdentifier, identifier);
    }
  }

  @override
  void onStateBizHandle() {
    assembleDeviceInfo();
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

class AndroidDevice {
  AndroidDeviceInfo androidDeviceInfo;
  String deviceIdentifier;

  AndroidDevice(this.androidDeviceInfo, this.deviceIdentifier);
}

class IosDevice {
  IosDeviceInfo iosDeviceInfo;
  String deviceIdentifier;

  IosDevice(this.iosDeviceInfo, this.deviceIdentifier);
}
