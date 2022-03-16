/// VO对象与实体转换抽象方法
mixin ToValueObjMixin<V> {
  V toVO() {
    return this as V;
  }
}