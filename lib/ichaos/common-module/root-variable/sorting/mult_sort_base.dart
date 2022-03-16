/// 配合MutiSort.dart使用
/// 使用多属性比较的实例类需要继承该类
abstract class MultiSortBase {

// i.e
//  ///Mapping the properties
//  Map<String, dynamic> toSortMap() {
//    return {'name': name, 'price': price, 'ram': ram, 'storage': storage};
//  }

//  ///get function to get the properties of Item
  dynamic get(String propertyName) {
    var _mapRep = toSortMap();
    if (_mapRep.containsKey(propertyName)) {
      return _mapRep[propertyName];
    }
    throw ArgumentError('property not found');
  }

  Map<String, dynamic> toSortMap();
}