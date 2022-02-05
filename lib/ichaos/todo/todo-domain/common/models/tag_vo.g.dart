// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tag_vo.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TagVO _$TagVOFromJson(Map<String, dynamic> json) => TagVO(
      json['id'] as int?,
      DateTime.parse(json['createTime'] as String),
      DateTime.parse(json['updateTime'] as String),
      json['name'] as String,
      json['colorRGBA'] as String,
      json['order'] as int,
    );

Map<String, dynamic> _$TagVOToJson(TagVO instance) => <String, dynamic>{
      'id': instance.id,
      'createTime': instance.createTime.toIso8601String(),
      'updateTime': instance.updateTime.toIso8601String(),
      'name': instance.name,
      'colorRGBA': instance.colorRGBA,
      'order': instance.order,
    };
