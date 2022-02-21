import 'package:dio/dio.dart';
import 'abstract-client/abstract_http_client.dart';

import 'abstract-client/abstract_response_data.dart';

abstract class BaseHttpClient extends AbstractHttpClient {
  final String _baseUrlExample = "https://www.baidu.com/";

  @override
  void init() {
    options.baseUrl = baseUrlProvider();
    interceptors
      ..addAll(clientInterceptorsProvider())
      ..add(LogInterceptor());
  }

  List<Interceptor> clientInterceptorsProvider() {
    return [];
  }

  String baseUrlProvider();
}

class BaseResponseData extends AbstractResponseData {
  @override
  bool get success => code == 200;

  BaseResponseData.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    message = json['message'];
    data = json['data'];
  }
}
