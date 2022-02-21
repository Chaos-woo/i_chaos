import 'package:dio/dio.dart';
import 'package:i_chaos/base_framework/exception/internal_exception.dart';
import 'package:i_chaos/base_framework/utils/exception/exception_pitcher.dart';
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
    if (e is DioError) {
      throw ExceptionPitcher().transformException(dioErr: e, withNotifyMode: false);
    } else {
      throw InternalException('${e.runtimeType}: ${s.toString()}');
    }
  }
}
