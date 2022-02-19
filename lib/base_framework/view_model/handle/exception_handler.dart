import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:i_chaos/base_framework/view_model/view_state_model.dart';

class ExceptionHandler {
  static ExceptionHandler? _singleton;

  static ExceptionHandler? getInstance() {
    _singleton ??= ExceptionHandler._();
    return _singleton;
  }

  ExceptionHandler._();

  /// Handle Error and Exception
  ///
  /// 统一处理子类的异常情况
  /// [e],有可能是Error,也有可能是Exception.所以需要判断处理
  /// [s] 为堆栈信息
  void handleException<T extends ViewStateModel>(T model, e, s) {
    debugPrint("e :    $e");
    debugPrint("s :    $s");
    if (e is DioError) {
      if (e.type == DioErrorType.connectTimeout) {
        //todo
      }
    }
  }
}
