/// 子类需要重写
abstract class AbstractResponseData {
  int? code = 0;
  String? message;
  dynamic data;

  bool get success;

  AbstractResponseData({this.code, this.message, this.data});

  @override
  String toString() {
    return 'BaseRespData{code: $code, message: $message, data: $data}';
  }
}