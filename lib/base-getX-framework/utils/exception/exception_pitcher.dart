import 'dart:collection';

import 'package:dio/dio.dart';
import 'package:i_chaos/base-getX-framework/config/net/base_http_client.dart';
import 'package:i_chaos/base-getX-framework/exception/base_exception.dart';
import 'package:i_chaos/base-getX-framework/exception/dio/cancel_exception.dart';
import 'package:i_chaos/base-getX-framework/exception/dio/connect_timeout_exception.dart';
import 'package:i_chaos/base-getX-framework/exception/dio/other_exception.dart';
import 'package:i_chaos/base-getX-framework/exception/dio/receive_timeout_exception.dart';
import 'package:i_chaos/base-getX-framework/exception/dio/response_exception.dart';
import 'package:i_chaos/base-getX-framework/exception/dio/send_timeout_exception.dart';
import 'package:i_chaos/base-getX-framework/exception/internal_exception.dart';

import 'exception_listener.dart';

typedef ResponseDioExceptionProvider = BaseException Function(DioError err);

class ExceptionPitcher with _ExceptionNotifyBinding {
  static ExceptionPitcher? _instance;

  factory ExceptionPitcher() => getSingleton()!;

  ExceptionPitcher._internal();

  static ExceptionPitcher? getSingleton() {
    _instance ??= ExceptionPitcher._internal();
    return _instance;
  }

  /// * 根据code 转换Exception
  Exception transformException({
    DioError? dioErr,
    BaseResponseData? responseData,
    Map<DioErrorType, ResponseDioExceptionProvider>? dioExceptionProvider,
    bool withNotifyMode = false,
    Map<int, BaseException>? bizExceptionProvider,
    BaseException? defaultException,
  }) {
    Exception exception = defaultException ?? InternalException('');
    if (!withNotifyMode) {
      exception = _transferDioException(dioErr!, dioExceptionProvider);
    } else {
      exception = _transferBizException(responseData!, bizExceptionProvider);
      for (_ExceptionPackage package in _packages) {
        package._listener?.notifyException(exception: exception, rawData: responseData);
      }
    }

    return exception;
  }

  /// 网络异常转换
  Exception _transferDioException(
    DioError err,
    Map<DioErrorType, ResponseDioExceptionProvider>? dioExceptionProvider,
  ) {
    switch (err.type) {
      case DioErrorType.connectTimeout:
        return dioExceptionProvider?[DioErrorType.connectTimeout]?.call(err) ?? ConnectTimeoutException('Connect timeout');
      case DioErrorType.sendTimeout:
        return dioExceptionProvider?[DioErrorType.sendTimeout]?.call(err) ?? SendTimeoutException('Write data timeout');
      case DioErrorType.receiveTimeout:
        return dioExceptionProvider?[DioErrorType.receiveTimeout]?.call(err) ?? ReceiveTimeoutException('Read data timeout');
      case DioErrorType.response:
        return dioExceptionProvider?[DioErrorType.response]?.call(err) ?? ResponseException(err, 'Http request error');
      case DioErrorType.cancel:
        return dioExceptionProvider?[DioErrorType.cancel]?.call(err) ?? CancelException('Request cancel');
      case DioErrorType.other:
        return dioExceptionProvider?[DioErrorType.other]?.call(err) ?? OtherException('Other error');
    }
  }

  /// 业务code异常转换
  Exception _transferBizException(
    BaseResponseData responseData,
    Map<int, BaseException>? bizExceptionProvider,
  ) {
    return bizExceptionProvider?[responseData.code] ?? InternalException('Response is not success. Biz error code: ${responseData.code}');
  }
}

/// mixin [_ExceptionNotifyBinding] can notified a Exception to all the [ExceptionListener] listener.

mixin _ExceptionNotifyBinding {
  final LinkedList<_ExceptionPackage> _packages = LinkedList<_ExceptionPackage>();

  /// 增加一个回调，页面发生时，会通知所有listener
  /// 页面使用后务必移除 [removeListener]
  void addListener(ExceptionListener? listener) {
    _packages.add(_ExceptionPackage(listener));
  }

  /// 移除一个回调
  void removeListener(ExceptionListener? listener) {
    for (final _ExceptionPackage package in _packages) {
      if (package._listener == listener) {
        package.unlink();
        return;
      }
    }
  }
}

/// package  exception with listener
class _ExceptionPackage extends LinkedListEntry<_ExceptionPackage> {
  final ExceptionListener? _listener;

  _ExceptionPackage(this._listener);
}
