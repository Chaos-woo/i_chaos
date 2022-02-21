abstract class BaseException implements Exception {
  String _message = '';

  BaseException(this._message);

  String get message => _message;

  @override
  String toString() {
    return "$runtimeType : $message";
  }
}
