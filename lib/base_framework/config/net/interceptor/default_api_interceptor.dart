// ignore_for_file: file_names

import 'package:dio/dio.dart';
import '../../../utils/exception/exception_pitcher.dart';

import '../base_http_client.dart';

class DefaultApiInterceptor extends InterceptorsWrapper {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) async {
    ///这里将空值参数去除掉，可根据自己的需求更改
//    options.queryParameters.removeWhere((key, value) => value == null);
//
//    String params="";
//    String mark = "&";
//
//    if(!kReleaseMode){
//      debugPrint('---api-request--->url--> ${options.baseUrl}${options.path}' +
//          ' queryParameters: ${options.queryParameters}'
//              ' formdata  : ${options.data.toString()}' );
//      options.queryParameters.forEach((k,v){
//        if(v == null) return;
//        params = "$params${params.isEmpty?"":mark}$k=$v";
//      });
//      debugPrint("---api-request--->url--> ${options.baseUrl}${options.path}?$params");
//    }

    //debugPrint("request header  :  ${options.headers.toString()}");
    super.onRequest(options, handler);
  }

  ///这里可以根据不同的业务代码 扔出不同的异常
  ///具体要根据后台进行协商
  /// [ViewStateModel] 的子类会对此处进行捕捉，捕捉后逻辑可以在[ExceptionHandler]中处理
  /// * 此处的异常捕捉功能仅在[loadData]中有效
  /// * 如果需要独立收到Api的业务异常，见此类[ExceptionBinding]

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    BaseResponseData responseData = BaseResponseData.fromJson(response.data);
    if (responseData.success) {
      return super.onResponse(response, handler);
    } else {
      throw ExceptionPitcher().transformException(responseData);
    }
  }
}
