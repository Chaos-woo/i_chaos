import 'dart:collection';

import 'package:i_chaos/base_framework/config/net/base_http_client.dart';
import 'package:i_chaos/base_framework/exception/un_handle_exception.dart';

import 'exception_listener.dart';

class ExceptionPitcher with _ExceptionNotifyBinding {
  static ExceptionPitcher? _instance;

  factory ExceptionPitcher() => getSingleton()!;

  ExceptionPitcher._internal();

  static ExceptionPitcher? getSingleton() {
    _instance ??= ExceptionPitcher._internal();
    return _instance;
  }

  /// * 根据code 转换Exception
  Exception transformException(BaseResponseData? responseData) {
    assert(responseData != null, 'responseData can not be null!');
    final Exception exception = _transferException(responseData!);

    return exception;
  }

  /// 业务code异常转换
  Exception _transferException(BaseResponseData responseData) {
    return UnHandleException(responseData.message ?? 'Unknown Exception!');
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
