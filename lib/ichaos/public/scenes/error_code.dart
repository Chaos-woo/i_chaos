
class ErrorCode {
  final int code;
  final String desc;

  ErrorCode._(this.code, this.desc);

  @override
  String toString() {
    return 'ErrorCode{code: $code, desc: $desc}';
  }

  static ErrorCode internalCodeError = ErrorCode._(50001, '(O_O)? 发生内部错误咯');

  String customToString() => '$desc ($code).';
}