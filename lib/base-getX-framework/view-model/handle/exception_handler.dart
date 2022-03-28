import 'package:dio/dio.dart';
import 'package:i_chaos/base-getX-framework/exception/internal_exception.dart';
import 'package:i_chaos/base-getX-framework/utils/exception/exception_pitcher.dart';
import 'package:i_chaos/base-getX-framework/view-model/base_view_state_ctrl.dart';

class ExceptionHandler {
  static ExceptionHandler? _singleton;

  static ExceptionHandler? getInstance() {
    _singleton ??= ExceptionHandler._();
    return _singleton;
  }

  ExceptionHandler._();

  void handleException<T extends BaseViewStateCtrl>(T model, e, s) {
    if (e is DioError) {
      throw ExceptionPitcher().transformException(dioErr: e, withNotifyMode: false);
    } else {
      throw InternalException('${e.runtimeType}: ${s.toString()}');
    }
  }
}
