import 'package:dio/dio.dart';

/// A http request
class Request<R> {
  R? data;
  Options requestOption;

  Request(this.requestOption, {this.data});
}
