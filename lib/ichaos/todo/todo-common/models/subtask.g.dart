// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'subtask.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SubTaskVO _$SubTaskVOFromJson(Map<String, dynamic> json) => SubTaskVO(
      json['uuid'] as String,
      json['content'] as String,
      json['completed'] as bool,
      DateTime.parse(json['createTime'] as String),
      DateTime.parse(json['updateTime'] as String),
    );

Map<String, dynamic> _$SubTaskVOToJson(SubTaskVO instance) => <String, dynamic>{
      'uuid': instance.uuid,
      'content': instance.content,
      'completed': instance.completed,
      'createTime': instance.createTime.toIso8601String(),
      'updateTime': instance.updateTime.toIso8601String(),
    };
