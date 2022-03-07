// ignore_for_file: file_names


import 'package:dio/dio.dart';

abstract class AbstractHeaderInterceptor extends InterceptorsWrapper {
  final CancelToken cancelToken;

  AbstractHeaderInterceptor(this.cancelToken);

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) async {
    timeoutOption(options);
    options.cancelToken = cancelToken;
    super.onRequest(options, handler);
  }

  void timeoutOption(RequestOptions options);
}
