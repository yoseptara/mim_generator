// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'meme_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_MemeModel _$$_MemeModelFromJson(Map<String, dynamic> json) => _$_MemeModel(
      id: json['id'] as String,
      name: json['name'] as String?,
      url: json['url'] as String?,
      width: json['width'] as int? ?? 0,
      height: json['height'] as int? ?? 0,
      boxCount: json['box_count'] as int? ?? 0,
    );

Map<String, dynamic> _$$_MemeModelToJson(_$_MemeModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'url': instance.url,
      'width': instance.width,
      'height': instance.height,
      'box_count': instance.boxCount,
    };
