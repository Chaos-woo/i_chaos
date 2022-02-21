import 'package:i_chaos/base_framework/config/net/abstract-client/abstract_response_data.dart';

/// api 异常监听回调
abstract class ExceptionListener<E extends Exception, T extends AbstractResponseData> {
  /// what kind of [exception] was happened,with api's [rawData]
  void notifyException({E? exception, T? rawData});
}