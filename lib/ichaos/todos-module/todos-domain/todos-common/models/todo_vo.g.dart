// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'todo_vo.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TodoVO _$TodoVOFromJson(Map<String, dynamic> json) => TodoVO(
      json['id'] as int?,
      json['validTime'] == null
          ? null
          : DateTime.parse(json['validTime'] as String),
      DateTime.parse(json['createTime'] as String),
      DateTime.parse(json['updateTime'] as String),
      json['content'] as String,
      json['needPromptTime'] == null
          ? null
          : DateTime.parse(json['needPromptTime'] as String),
      json['location'] as String?,
      json['level'] as int,
      json['completed'] as bool,
      json['completedTime'] == null
          ? null
          : DateTime.parse(json['completedTime'] as String),
      json['period'] as int,
      json['tag'] as int?,
      json['remark'] as String?,
      (json['subTaskList'] as List<dynamic>)
          .map((e) => SubTaskVO.fromJson(e as Map<String, dynamic>))
          .toList(),
      json['promptEventId'] as String?,
    );

Map<String, dynamic> _$TodoVOToJson(TodoVO instance) => <String, dynamic>{
      'id': instance.id,
      'validTime': instance.validTime?.toIso8601String(),
      'createTime': instance.createTime.toIso8601String(),
      'updateTime': instance.updateTime.toIso8601String(),
      'content': instance.content,
      'location': instance.location,
      'level': instance.level,
      'completed': instance.completed,
      'completedTime': instance.completedTime?.toIso8601String(),
      'period': instance.period,
      'tag': instance.tag,
      'remark': instance.remark,
      'subTaskList': instance.subTaskList,
      'needPromptTime': instance.needPromptTime?.toIso8601String(),
      'promptEventId': instance.promptEventId,
    };
