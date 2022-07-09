// ignore_for_file: file_names

import 'package:dio/dio.dart';
import 'package:i_chaos/base-getX-framework/config/net/base_http_client.dart';
import 'package:i_chaos/base-getX-framework/exception/default_biz_exception.dart';
import 'package:i_chaos/base-getX-framework/utils/exception/exception_pitcher.dart';


class DefaultApiInterceptor extends InterceptorsWrapper {

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    BaseResponseData responseData = BaseResponseData.fromJson(response.data);
    if (responseData.success) {
      return super.onResponse(response, handler);
    } else {
      ExceptionPitcher().transformException(
          responseData: responseData,
          withNotifyMode: true,
          defaultException: DefaultBizException('Response is not success. Biz error code: ${responseData.code}'));
    }
  }

  @override
  void onError(DioError err, ErrorInterceptorHandler handler) {
    ExceptionPitcher().transformException(dioErr: err, withNotifyMode: false);
  }
}
