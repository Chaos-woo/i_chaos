import 'package:floor/floor.dart';

/// 基础实体属性
class RootEntity<V> {
  // 主键id
  @PrimaryKey(autoGenerate: true)
  final int? id;

  // 创建时间
  @ColumnInfo(name: 'create_time')
  final String createTime;

  // 更新时间
  @ColumnInfo(name: 'update_time')
  final String updateTime;

  RootEntity(
    this.id,
    this.updateTime, {
    String? createTime,
  }) : createTime = createTime ?? DateTime.now().toString();

  /// VO对象与实体转换抽象方法
  V fromEntity() {
    return this as V;
  }
}
