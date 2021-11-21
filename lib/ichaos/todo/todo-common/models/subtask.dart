
import 'package:json_annotation/json_annotation.dart';

part 'subtask.g.dart';

@JsonSerializable()
class SubTaskVO {
  String uuid;
  String content;
  bool completed;
  DateTime createTime;
  DateTime updateTime;

  SubTaskVO(this.uuid, this.content, this.completed, this.createTime, this.updateTime);

  factory SubTaskVO.fromJson(Map<String, dynamic> json) => _$SubTaskVOFromJson(json);

  Map<String, dynamic> toJson() => _$SubTaskVOToJson(this);
}