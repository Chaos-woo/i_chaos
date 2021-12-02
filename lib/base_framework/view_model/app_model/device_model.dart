


import 'dart:io';

import 'package:device_info/device_info.dart';
import 'package:flustars/flustars.dart';
import 'package:flutter/cupertino.dart';
import 'package:i_chaos/base_framework/config/frame_constant.dart';


class DeviceModel extends ChangeNotifier{

  DeviceModel({this.isAndroid,this.isIOS,this.androidDeviceInfo,this
      .iosDeviceInfo}){
    assembleDeviceInfo();
  }
  assembleDeviceInfo()async{
    DeviceInfoPlugin deviceInfoPlugin = DeviceInfoPlugin();
    if(Platform.isAndroid){
      //load android device info
      await deviceInfoPlugin.androidInfo.then((deviceInfo){
        isAndroid = true;
        androidDeviceInfo = deviceInfo;
        SpUtil.putString(BaseFrameConstant.DEVICE_UUID, deviceInfo.androidId);
      });

    }else{
      //load ios device info
      await deviceInfoPlugin.iosInfo.then((deviceInfo){
        isIOS = true;
        iosDeviceInfo = deviceInfo;
        SpUtil.putString(BaseFrameConstant.DEVICE_UUID, deviceInfo.identifierForVendor);

      });

    }
  }

  bool? isAndroid = false;
  bool? isIOS = false;

  AndroidDeviceInfo? androidDeviceInfo;
  IosDeviceInfo? iosDeviceInfo;


}