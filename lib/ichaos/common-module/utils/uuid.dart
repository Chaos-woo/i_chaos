import 'package:uuid/uuid.dart';

const _uuid = Uuid();

class UuidUnit {
  static String id() {
    return _uuid.v4();
  }
}