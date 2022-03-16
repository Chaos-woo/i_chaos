import 'package:floor/floor.dart';
import 'package:i_chaos/ichaos/common-module/root-variable/database/to_value_obj_mixin.dart';

/// 基础实体属性
class RootEntity<V> with ToValueObjMixin {
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
}
