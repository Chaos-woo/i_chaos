
import 'package:dio/dio.dart';
import 'package:redstonex/src/network-core/definitions/http/request.dart';

/// Http request context.
///
class RequestContext<R, B> {
  Request<R> request;
  Response<B>? response;

  RequestContext(this.request);
}