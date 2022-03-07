import 'package:dio/dio.dart';
import 'package:i_chaos/base-getX-framework/exception/base_exception.dart';

class ResponseException extends BaseException {
  ResponseException(DioError err, String message) : super('${err.response != null ? err.response!.statusCode : 'Unknown http code'}: $message');
}