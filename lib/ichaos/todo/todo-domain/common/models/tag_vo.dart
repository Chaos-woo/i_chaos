import 'package:flutter/material.dart';
import 'package:i_chaos/ichaos/public/base/database/root_vo.dart';
import 'package:i_chaos/ichaos/public/base/sorting/mult_sort_base.dart';
import 'package:i_chaos/ichaos/public/extension/date_time_extension.dart';
import 'package:i_chaos/ichaos/todo/todo-domain/common/entity/tag_entity.dart';
import 'package:json_annotation/json_annotation.dart';

part 'tag_vo.g.dart';

@JsonSerializable()
@_ColorConverter()
class TagVO extends MultiSortBase with SerializeVO<TagEntity>{
  int? id;
  DateTime createTime;
  DateTime updateTime;
  // 标签名
  String name;
  // 颜色
  Color colorRGBA;
  // 排序
  int order;

  TagVO(this.id, this.createTime, this.updateTime, this.name, this.colorRGBA, this.order);

  static TagVO newTag(String name, Color color) {
    return TagVO(null, DateTime.now(), DateTime.now(), name, color, -1);
  }

  factory TagVO.fromJson(Map<String, dynamic> json) => _$TagVOFromJson(json);

  Map<String, dynamic> toJson() => _$TagVOToJson(this);

  @override
  Map<String, dynamic> toSortMap() {
    return <String, dynamic>{'order': order, 'createTime': createTime};
  }

  @override
  String toString() {
    return 'TagVO{id: $id, createTime: $createTime, updateTime: $updateTime, name: $name, colorRGBA: $colorRGBA, order: $order}';
  }


  @override
  TagEntity toEntity() {
    String rgba = '${colorRGBA.red},${colorRGBA.green},${colorRGBA.blue},${colorRGBA.alpha}';

    return TagEntity(name, rgba, updateTime: updateTime.yyyyMMddHHmmss,
      id: id,
      order: order,
      createTime: createTime.yyyyMMddHHmmss
    );
  }
}

class ColorConverterUtil {
  static String to(Color color) {
    return '${color.red},${color.green},${color.blue},${color.alpha}';
  }

  static Color from(String colorString) {
    List<String> rgbaSplit = colorString.split(',');

    return Color.fromARGB(int.parse(rgbaSplit[3]), int.parse(rgbaSplit[0]), int.parse(rgbaSplit[1]), int.parse(rgbaSplit[2]));
  }
}

class _ColorConverter implements JsonConverter<Color, String> {
  const _ColorConverter();

  @override
  Color fromJson(String colorString) => ColorConverterUtil.from(colorString);

  @override
  String toJson(Color color) => ColorConverterUtil.to(color);
}