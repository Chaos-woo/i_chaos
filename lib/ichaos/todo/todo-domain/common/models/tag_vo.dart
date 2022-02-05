import 'package:i_chaos/ichaos/public/base/database/root_vo.dart';
import 'package:i_chaos/ichaos/public/base/sorting/mult_sort_base.dart';
import 'package:i_chaos/ichaos/public/extension/date_time_extension.dart';
import 'package:i_chaos/ichaos/todo/todo-domain/common/entity/tag_entity.dart';
import 'package:json_annotation/json_annotation.dart';

part 'tag_vo.g.dart';

@JsonSerializable()
class TagVO extends MultiSortBase with SerializeVO<TagEntity>{
  int? id;
  DateTime createTime;
  DateTime updateTime;
  // 标签名
  String name;
  // 颜色
  String colorRGBA;
  // 排序
  int order;

  TagVO(this.id, this.createTime, this.updateTime, this.name, this.colorRGBA, this.order);

  factory TagVO.fromJson(Map<String, dynamic> json) => _$TagVOFromJson(json);

  Map<String, dynamic> toJson() => _$TagVOToJson(this);

  @override
  Map<String, dynamic> toSortMap() {
    return <String, dynamic>{'order': order};
  }

  @override
  String toString() {
    return 'TagVO{id: $id, createTime: $createTime, updateTime: $updateTime, name: $name, colorRGBA: $colorRGBA, order: $order}';
  }

  @override
  TagEntity toEntity() {
    return TagEntity(name, colorRGBA, updateTime: updateTime.yyyyMMddHHmmss,
      id: id,
      order: order,
      createTime: createTime.yyyyMMddHHmmss
    );
  }
}