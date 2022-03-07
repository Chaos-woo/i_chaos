import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:dio/native_imp.dart';
import 'package:flutter/foundation.dart';

// 必须是顶层函数
_parseAndDecode(String response) {
  return jsonDecode(response);
}

parseJson(String text) {
  return compute(_parseAndDecode, text);
}

/// 默认项目所有cancelToken使用这一个，用于断网下取消
/// 如有特殊需要可以 在ApiInterceptor进行覆盖或者注释
final CancelToken cancelToken = CancelToken();

abstract class AbstractHttpClient extends DioForNative {
  final CancelToken rootCancelToken = CancelToken();

  AbstractHttpClient() {
    /// json 解析放在了子isolate，不过按文档来看，这个解析速度要慢于直接解析
    /// 优点就是不会造成ui卡顿（前提是你的json数据非常大）
    (transformer as DefaultTransformer).jsonDecodeCallback = parseJson;

    init();
  }

  void init();

  cancelAllRequest() {
    cancelToken.cancel(['no available net']);
  }
}
