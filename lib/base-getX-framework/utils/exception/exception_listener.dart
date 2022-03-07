import 'package:i_chaos/base-getX-framework/config/net/abstract-client/abstract_response_data.dart';

/// api异常监听回调
abstract class ExceptionListener<E extends Exception, T extends AbstractResponseData> {
  /// what kind of [exception] was happened,with api's [rawData]
  void notifyException({E? exception, T? rawData});
}