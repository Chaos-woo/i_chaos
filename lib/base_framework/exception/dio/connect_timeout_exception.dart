import 'package:i_chaos/base_framework/exception/base_exception.dart';

class ConnectTimeoutException extends BaseException {
  ConnectTimeoutException(String message) : super(message);
}