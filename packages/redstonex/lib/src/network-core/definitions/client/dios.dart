
import 'package:redstonex/src/network-core/definitions/client/redstone_dio.dart';

/// A Dio configuration creator.
///
class Dios {
  ///
  /// dios总配置？
  /// 怎么可以简单获取?去创建retrofit客户端的时候可以简单使用？
  /// 怎么提前配置好呢？
  ///
  /// 使用初始化函数去调用dios的方法注册，retrofit直接通过名字获取？类似loggers
  ///
  ///

  /// fixed redstonex dio name
  static const String _fixedRedstoneXDioName = '_fixedRedstoneXDio';

  /// named dio instance map
  static final Map<String, RedStoneDio> _dios = {};
}