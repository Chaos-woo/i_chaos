import 'package:redstonex/src/commons/exceptions/app_exception.dart';

/// Default http exception.
///
///
class BadRequestException extends AppException {
  BadRequestException(int errCode, String message) : super(errCode, message);
}
