import 'package:i_chaos/ichaos/common-module/utils/uuid.dart';
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

  @override
  String toString() {
    return 'SubTaskVO{uuid: $uuid, content: $content, completed: $completed, createTime: $createTime, updateTime: $updateTime}';
  }

  static SubTaskVO newSubTask({required String content, DateTime? createTime}) {
    DateTime time = createTime ?? DateTime.now();
    return SubTaskVO(UuidUnit.id(), content, false, time, time);
  }
}
