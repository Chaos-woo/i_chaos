// ignore_for_file: file_names

import 'package:dio/dio.dart';
import 'package:i_chaos/base_framework/config/net/interceptor/abstract_header_interceptor.dart';

class DefaultHeaderInterceptor extends AbstractHeaderInterceptor {
  DefaultHeaderInterceptor(CancelToken cancelToken) : super(cancelToken);

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) async {
    options.cancelToken = cancelToken;

    /// 这里加入版本信息 在header，可以根据需求更改
//    var appVersion = await PlatformUtils.getAppVersion();
//    var deviceInfo = SpUtil.getString(BaseFrameConstant.deviceUuid);

//    var version = {}
//      ..addAll({
//        'appVersion': appVersion,
//      });
//    options.headers['version'] = version;
//    options.headers['platform'] = Platform.operatingSystem;
//    options.headers['clint_id'] = deviceInfo;

    final Map<String, dynamic> appCustomHeaders = customHeaders();
    if (appCustomHeaders.isNotEmpty) {
      options.headers.addAll(appCustomHeaders);
    }

    super.onRequest(options, handler);
  }

  @override
  void timeoutOption(RequestOptions options) {
    options.connectTimeout = setConnectTimeout();
    options.receiveTimeout = setReceiveTimeout();
    options.sendTimeout = setSendTimeout();
  }

  int setConnectTimeout() {
    return 1000 * 45;
  }

  int setReceiveTimeout() {
    return 1000 * 45;
  }

  int setSendTimeout() {
    return 1000 * 45;
  }

  Map<String, dynamic> customHeaders() {
    return {};
  }
}
