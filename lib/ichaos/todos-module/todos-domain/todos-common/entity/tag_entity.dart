import 'package:floor/floor.dart';
import 'package:flutter/material.dart';
import 'package:i_chaos/ichaos/common-module/extensions/date_time_extension.dart';
import 'package:i_chaos/ichaos/common-module/root-variable/database/root_entity.dart';
import 'package:i_chaos/ichaos/todos-module/todos-domain/todos-common/models/tag_vo.dart';

@Entity(tableName: 'tb_tag')
class TagEntity extends RootEntity<TagVO> {
  // 标签名
  final String name;

  // 颜色
  @ColumnInfo(name: 'color_rgba')
  final String colorRGBA;

  // 排序
  final int order;

  TagEntity(this.name, this.colorRGBA, {required this.order, int? id, String? createTime, required String updateTime})
      : super(id, updateTime, createTime: createTime);

  @override
  TagVO toVO() {
    List<String> rgbaSplit = colorRGBA.split(',');

    return TagVO(
      id,
      createTime.dateTime,
      updateTime.dateTime,
      name,
      Color.fromARGB(int.parse(rgbaSplit[3]), int.parse(rgbaSplit[0]), int.parse(rgbaSplit[1]), int.parse(rgbaSplit[2])),
      order,
    );
  }
}
