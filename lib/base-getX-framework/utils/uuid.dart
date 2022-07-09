import 'package:uuid/uuid.dart';

const _uuid = Uuid();

class UuidUtil {
  static String id() {
    return _uuid.v4();
  }
}